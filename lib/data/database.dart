import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  final box = Hive.box("myBox");

  //Run this method if this is the fist time ever opening this app
  void initDataToHive() {
    toDoList = [
      ["Make a new task", false],
      ["Delete a task", false],
    ];
  }

  //Loading a data from DataBase
  void loadDataFromDataBase() {
    toDoList = box.get("ToDoList");
  }

  //Upgrading data in DataBase
  void upgradeDatatoDataBase() {
    box.put("ToDoList", toDoList);
  }
}
