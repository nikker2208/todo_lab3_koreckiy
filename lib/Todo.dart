import 'package:flutter/material.dart';
import 'package:todo_lab3_koreckiy/ToDo_Item.dart';
import 'package:todo_lab3_koreckiy/model/_ToDo.dart';
class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final todosList = ToDoList.todoList();
  List<ToDoList> _foundToDo = [];
  final _todoContrl = TextEditingController();
  @override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
              "ToDo List",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15),
            child: Column(
              children: [
                butt(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 15,
                            bottom: 20
                        ),
                        child: Text(
                          'List',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for(ToDoList todos in _foundToDo.reversed)
                        ToDoItem(
                          todo: todos,
                          onToDoChanged: _handleToDoChange,
                          onDelete: _deleteToDo,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),],
                      ),
                      child: TextField(
                        controller: _todoContrl,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Добавить задачу",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    onPressed: (){
                      _addToDo(_todoContrl.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ]),
          )
        ],
      ),
    );
  }

  void _isTrueList(){
    List<ToDoList> results = [];
    results = todosList.where(
            (item) => item.isDone == true
    ).toList();
    setState(() {
      _foundToDo = results;
    });
  }
  void _isList(){
    List<ToDoList> results = todosList;
    setState(() {
      _foundToDo = results;
    });
  }
  void _isFalseList(){
    List<ToDoList> results = [];
    results = todosList.where(
            (item) => item.isDone == false
    ).toList();
    setState(() {
      _foundToDo = results;
    });
  }
  void _deleteToDo(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _handleToDoChange(ToDoList todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  void _addToDo(String toDo){
    setState(() {
      todosList.add(
          ToDoList(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              toDoText: toDo
          ));
      _todoContrl.clear();
    });
  }
Widget butt(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            child: Text(
                "Выполнено",
                style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                onPressed: (){
                _isTrueList();
              },
              style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(45, 45),
              elevation: 10,
            ),
          ),
          ElevatedButton(
            child: Text(
              "Не выполнено",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            onPressed: (){
              _isFalseList();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(45, 45),
              elevation: 10,
            ),
          ),
          ElevatedButton(
            child: Text(
              "Все",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            onPressed: (){
              _isList();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(45, 45),
              elevation: 10,
            ),
          ),
        ],
      ),
  );
  }
}

