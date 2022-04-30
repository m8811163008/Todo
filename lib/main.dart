import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  static const String title = 'Todo App';

  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
          primarySwatch: Colors.pink, scaffoldBackgroundColor: Colors.grey),
      home: const HomePage(),
    );
  }
}
