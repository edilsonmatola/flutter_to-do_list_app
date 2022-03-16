import 'package:flutter/material.dart';

import 'screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(
        // TODO: Add Light and Dark Theme support
        // TODO: Use ThemeData to customize buttons color
        primarySwatch: Colors.blue,
      ),
      home: ToDoListScreen(),
    );
  }
}
