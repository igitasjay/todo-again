import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  const MyButton({super.key, required this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(name),
    );
  }
}
