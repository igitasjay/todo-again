import 'package:flutter/material.dart';
import 'package:slideable/slideable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  Function(bool?)? onChanged;
  final bool taskCompleted;
  final Function() onPress;
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Slideable(
      items: [
        ActionItems(
          icon: const Icon(Icons.delete),
          onPress: onPress,
          backgroudColor: Colors.white,
        ),
      ],
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Theme.of(context).primaryColor,
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
