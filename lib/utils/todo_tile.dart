import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String text;
  final bool isComplited;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteToDoTask;

  TodoTile({
    super.key,
    required this.text,
    required this.isComplited,
    required this.onChanged,
    required this.deleteToDoTask,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteToDoTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 162, 37, 184),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: <Widget>[
              //Check if task is complited
              Checkbox(
                value: isComplited,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              const SizedBox(width: 5),

              //ToDo text of the task,
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: isComplited
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
