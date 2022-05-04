import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_crud/provider/todos.dart';

import '../model/todo.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
          key: Key(todo.id ?? DateTime.now().toString()),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: onDeleteTodo,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.save,
                label: 'Delete',
              ),
            ],
          ),
          child: buildTodo(context)),
    );
  }

  Container buildTodo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {
              final _provider =
                  Provider.of<TodosProvider>(context, listen: false);
              final bool todoStatus = _provider.toggleTodo(todo);
              Utils.showSnackBar(context,
                  todoStatus ? 'Completed Todo' : 'Todo is not completed');
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22),
                ),
                if (todo.description.isNotEmpty)
                  Text(
                    todo.description,
                    style: const TextStyle(fontSize: 20, height: 1.5),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onDeleteTodo(context) {
    final _provider = Provider.of<TodosProvider>(context, listen: false);
    _provider.deleteTodo(todo);
    Utils.showSnackBar(context, 'Delete todo ${todo.title}');
  }
}
