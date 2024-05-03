import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final _mybox = Hive.box("mybox");

  // Display default tasks if this is the first ever time of opening the application
  void creatInitialData() {
    todoList = [
      ["Create new app", false],
      ["Read Zero to One", false],
    ];
  }

  // Just load data because application has been opened before
  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  // Make update to the list
  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
