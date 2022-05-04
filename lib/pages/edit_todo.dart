import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_crud/provider/todos.dart';
import 'package:todo_crud/widgets/todo_form.dart';

import '../model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late String title;
  late String description;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        actions: [
          IconButton(
              onPressed: () {
                final _provider =
                    Provider.of<TodosProvider>(context, listen: false);
                _provider.deleteTodo(widget.todo);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TodoFormWidget(
              onChangeTitle: (title) => setState(() {
                    this.title = title;
                  }),
              onChangeDescription: (description) => setState(() {
                    this.description = description;
                  }),
              title: widget.todo.title,
              description: widget.todo.description,
              onSavedTodo: () {
                if (_formKey.currentState!.validate()) {
                  final _provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  _provider.updateTodo(widget.todo, title, description);
                  Navigator.of(context).pop();
                }
              }),
        ),
      ),
    );
  }
}
