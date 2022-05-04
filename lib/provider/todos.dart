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
  List<Todo> get completedTodos => _todos.where((todo) => todo.isDone).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodo(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
