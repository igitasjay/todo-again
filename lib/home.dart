import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialogue_box.dart';
import 'package:todo/util/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();

  // List todoList = [
  //   ["Create a new app", false],
  //   ["Read zero to one", false],
  // ];
  final _mybox = Hive.box("mybox");
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.creatInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void onCheckboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void save() {
    final task = controller.text;
    setState(() {
      db.todoList.add([task, false]);
      controller.clear();
    });
    db.updateData();
    Navigator.pop(context);
  }

  void delete(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: db.todoList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.todoList[index][0],
                  taskCompleted: db.todoList[index][1],
                  onChanged: (value) => onCheckboxChanged(value, index),
                  onPress: () => delete(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (builder) {
                return DialogueBox(
                  controller: controller,
                  onSave: save,
                  onCancel: () {
                    Navigator.pop(context);
                    controller.clear();
                  },
                );
              });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
