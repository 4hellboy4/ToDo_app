import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app2/pages/home.dart';

void main() async {
  //Hive initialization
  await Hive.initFlutter();

  //opening a Hive box
  var box = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const Home(),
    );
  }
}
