import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_crud/model/todo.dart';
import 'package:todo_crud/provider/todos.dart';

import 'todo_form.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Add todo'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        content: Form(
          key: _formKey,
          child: TodoFormWidget(
              onChangeTitle: (title) => setState(() {
                    this.title = title;
                  }),
              onChangeDescription: (description) => setState(() {
                    this.description = description;
                  }),
              onSavedTodo: onSave),
        ),
      );

  void onSave() {
    if (_formKey.currentState!.validate()) {
      final _todoProvider = Provider.of<TodosProvider>(context, listen: false);
      final Todo todo = Todo(
        title: title,
        description: description,
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
      );
      _todoProvider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
