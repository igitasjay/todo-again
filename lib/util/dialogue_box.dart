import 'package:flutter/material.dart';
import 'package:todo/util/button.dart';

class DialogueBox extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onSave;
  final Function()? onCancel;
  const DialogueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      content: Container(
        height: 125,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(6),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  name: "Add",
                  onPressed: onSave,
                ),
                const SizedBox(width: 8),
                MyButton(
                  name: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
