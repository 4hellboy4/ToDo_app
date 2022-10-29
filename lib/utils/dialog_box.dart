import 'package:flutter/material.dart';
import 'package:todo_app2/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {Key? key,
      required this.controller,
      required this.onCancel,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 120,
        child: Column(
          //Get user input
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            const SizedBox(height: 12),

            //Save and Cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Cancel button
                MyButton(nameOfTheButton: "Cancel", onPressed: onCancel),
                //Save button
                MyButton(
                  nameOfTheButton: "Save",
                  onPressed: onSave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
