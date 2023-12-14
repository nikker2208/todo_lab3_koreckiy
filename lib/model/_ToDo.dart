import 'package:flutter/material.dart';
class ToDoList{
  String? id;
  String? toDoText;
  bool isDone;
  ToDoList({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });
  static List<ToDoList> todoList(){
    return[
      ToDoList(id: '1', toDoText: 'hello'),
      ToDoList(id: '2', toDoText: 'bye'),
      ToDoList(id: '3', toDoText: 'foreach', isDone: true),
      ToDoList(id: '4', toDoText: 'asd', isDone: true),
    ];
  }
}