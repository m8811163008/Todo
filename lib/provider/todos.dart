import 'package:flutter/foundation.dart';
import 'package:todo_crud/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Walk the dog'),
    Todo(createdTime: DateTime.now(), title: 'Walk the dog2', description: '''
    a
    b
    c
    '''),
  ];
  List<Todo> get todos => _todos.where((todo) => !todo.isDone).toList();
}
