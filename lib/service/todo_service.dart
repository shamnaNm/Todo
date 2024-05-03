import 'package:flutter/material.dart';


import '../models/todo_model.dart';




class TodoService with ChangeNotifier {
  List<ToDoModel> _todoList = [

    ToDoModel(
        title: "New Task",
        body: "New Task Description"
    )
  ];

  List<ToDoModel> get todoList => _todoList;

  // add task


  Future<List<ToDoModel>?>getAllTodo() async{

    return todoList;


  }

  addTodo(ToDoModel todo) {
    print(todo.title);
    print(todo.body);
    todoList.add(todo);
    notifyListeners();
  }
  void removeTodo(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
  // void editTodo(int index) {
  //    _todoList.editAt(index);
  //   notifyListeners();
  // }
}
