import 'dart:ui';

import 'package:flutter/material.dart';

import 'todo_form.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
      title: const Text('Add todo'),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      content: TodoFormWidget(
          onChangeTitle: (title) => setState(() {
                title = title;
              }),
          onChangeDescription: (description) => setState(() {
                description = description;
              }),
          onSavedTodo: () {}));
}
