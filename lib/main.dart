import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_crud/provider/todos.dart';

import 'pages/home.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  static const String title = 'Todo App';

  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.pink, scaffoldBackgroundColor: Colors.grey),
        home: const HomePage(),
      ),
    );
  }
}
