import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String nameOfTheButton;
  VoidCallback onPressed;

  MyButton({super.key, required this.nameOfTheButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(nameOfTheButton,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
    );
  }
}
