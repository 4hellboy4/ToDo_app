import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app2/data/database.dart';
import 'package:todo_app2/utils/dialog_box.dart';
import 'package:todo_app2/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Text controller
  final _controller = TextEditingController();

  final box = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this a first time ever opening this app create default data
    if (box.get("ToDoList") == null) {
      db.initDataToHive();
    } else {
      db.loadDataFromDataBase();
    }
    super.initState();
  }

  void checkBoxIsChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.upgradeDatatoDataBase();
  }

  //SAve a new ToDo task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.upgradeDatatoDataBase();
  }

  void createNewToDoTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.upgradeDatatoDataBase();
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
        itemCount: db.toDoList.length,
        itemBuilder: ((context, index) {
          return TodoTile(
            text: db.toDoList[index][0],
            isComplited: db.toDoList[index][1],
            onChanged: (value) => checkBoxIsChanged(value, index),
            deleteToDoTask: (context) => deleteTask(index),
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
