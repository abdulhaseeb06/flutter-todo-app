import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodoListProvider with ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        id: DateTime.now().toString(),
        text: 'Todo 1',
        status: TodoStatus.Pending),
    Todo(
        id: DateTime.now().toString(),
        text: 'Todo 2',
        status: TodoStatus.Completed),
    Todo(
        id: DateTime.now().toString(),
        text: 'Todo 3',
        status: TodoStatus.Pending),
    Todo(
        id: DateTime.now().toString(),
        text: 'Todo 4',
        status: TodoStatus.Pending),
    Todo(
        id: DateTime.now().toString(),
        text: 'Todo 5',
        status: TodoStatus.Pending),
  ];

  List<Todo> get todoList {
    return [..._todos];
  }

  List<Todo> get getPendingTodoList {
    return [
      ..._todos
          .where((element) => element.status == TodoStatus.Pending)
          .toList()
    ];
  }

  List<Todo> get getCompletedTodoList {
    return [
      ..._todos
          .where((element) => element.status == TodoStatus.Completed)
          .toList()
    ];
  }

  int get totalTodos {
    return _todos == null ? 0 : _todos.length;
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodoStatus(String id, TodoStatus status) {
    final index = _todos.indexWhere((element) => element.id == id);
    _todos[index].status = status;
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
