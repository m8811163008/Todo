import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_crud/widgets/todo.dart';

import '../model/todo.dart';
import '../provider/todos.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodosProvider todoProvider = Provider.of<TodosProvider>(context);
    List<Todo> todos = todoProvider.completedTodos;
    return todos.isEmpty
        ? const Center(child: Text('No completed todos'))
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
            itemCount: todos.length,
          );
  }
}
