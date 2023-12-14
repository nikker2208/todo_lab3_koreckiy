import 'package:flutter/material.dart';
import 'package:todo_lab3_koreckiy/model/_ToDo.dart';


class ToDoItem extends StatelessWidget {
  final ToDoList todo;
  final onToDoChanged;
  final onDelete;

  const ToDoItem({Key? key, required this.todo,required this.onToDoChanged, required this.onDelete}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black,
        ),
        title: Text(
          todo.toDoText!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            decoration: todo.isDone? TextDecoration.lineThrough: null,
            decorationColor: Colors.black,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: (){
              onDelete(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
