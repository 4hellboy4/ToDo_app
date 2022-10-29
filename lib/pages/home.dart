import 'package:flutter/material.dart';
import 'package:todo_app2/utils/dialog_box.dart';
import 'package:todo_app2/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List ToDoLIst = [
    ["Do exercise", false],
    ["Make a video", true]
  ];

  void checkBoxIsChanged(bool? value, int index) {
    setState(() {
      ToDoLIst[index][1] = !ToDoLIst[index][1];
    });
  }

  void createNewToDoTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text("TO DO"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ToDoLIst.length,
        itemBuilder: ((context, index) {
          return TodoTile(
            text: ToDoLIst[index][0],
            isComplited: ToDoLIst[index][1],
            onChanged: (value) => checkBoxIsChanged(value, index),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewToDoTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
