import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  Function(bool?)? onChanged;
  final bool taskCompleted;
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
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
    );
  }
}
