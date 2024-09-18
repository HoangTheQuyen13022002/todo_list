import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [
    Todo(title: "Đi chợ", content: "Mua cá và mua rau", isCompleted: true),
    Todo(title: "Chạy bộ", content: "Nâng cao sức khỏe", isCompleted: false)
  ];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }

  void deletedTodo(int index){
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, Todo updateTodo){
    _todos[index] = updateTodo;
    notifyListeners();
  }

  void checkCompleted(int index){
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }


}