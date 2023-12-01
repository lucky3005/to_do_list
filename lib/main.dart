//import 'dart:js_util';

import 'package:flutter/material.dart';
import './colors.dart';
import './todoitem.dart';
import './tode.dart';

void main(List<String> args) {
  runApp(const ToDoList());
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

// this is the Search Box widget
// this is the Search Box widget
// this is the Search Box widget
// this is the Search Box widget
// Widget SearchBar() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 15),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: TextField(
//       onChanged: (value) => runFilter(value),
//       decoration: const InputDecoration(
//         contentPadding: EdgeInsets.all(0),
//         prefixIcon: Icon(
//           Icons.search,
//           color: tdBlack,
//           size: 20,
//         ),
//         prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
//         border: InputBorder.none,
//         hintText: 'Search',
//         hintStyle: TextStyle(color: tdGrey),
//       ),
//     ),
//   );
// }

// runFilter(String value) {
// }
//
//
//
//
//
//
//
//
//
//

//
//
//
final todoList = ToDo.todoList();
List<ToDo> foundToDo = [];
final todoController = TextEditingController();

class _ToDoListState extends State<ToDoList> {
  @override
  void initState() {
    foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: tdBgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: tdBgColor,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: tdBlack,
                size: 30,
              ),
              Text(
                'ToDo List',
                style: TextStyle(color: tdBlack),
              ),
              Icon(Icons.wordpress_outlined, color: Colors.transparent),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  //SearchBar(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'All ToDos',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        for (ToDo todo in foundToDo)
                          ToDoItem(
                            todo: todo,
                            onToDoChanged: handleToDochange,
                            onDelete: deleteItem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Here we use alignment widget
            //to create add button at the bottom
            //....
            //....
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow:  [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0),
                        ],
                      ),
                      child: TextField(
                        controller: todoController,
                        decoration:const InputDecoration(
                            hintText: 'Add a New ToDo',
                            border: InputBorder.none),
                      ),
                    ),
                  ),

                  //....
                  //....
                  //....
                  //....
                  //....
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print('add new todo button');
                        addToDoItem(todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tdBlue,
                          minimumSize: const Size(60, 60),
                          elevation: 10),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleToDochange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addToDoItem(String todo) {
    setState(
      () {
        todoList.add(
          ToDo(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              todotext: todo),
        );
      },
    );
    todoController.clear();
  }

  // void runFilter(String enteredKeyword) {
  //   List<ToDo> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = todoList;
  //   } else {
  //     results = todoList
  //         .where(
  //           (item) => item.todotext!.toLowerCase().contains(
  //                 enteredKeyword.toLowerCase(),
  //               ),
  //         )
  //         .toList();
  //   }
  //   setState(
  //     () {
  //       foundToDo = results;
  //     },
  //   );
  //}
}
