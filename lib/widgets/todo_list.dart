import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';
import '../provider/todos.dart';
import 'todo.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodosProvider todoProvider = Provider.of<TodosProvider>(context);
    List<Todo> todos = todoProvider.todos;
    return todos.isEmpty
        ? const Center(child: Text('No todos'))
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final Todo todo = todos[index];
              return TodoWidget(todo: todo);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemCount: todos.length);
  }
}
