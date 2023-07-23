import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../pages/home/home_view.dart';
import '../pages/todo/todo_main.dart';

class MainLayot extends StatefulWidget {
  const MainLayot({super.key});

  @override
  State<MainLayot> createState() => _MainLayotState();
}

class _MainLayotState extends State<MainLayot> {
  int _currentIndex = 0;
  var _toDoController = TextEditingController();
  List<Widget> pages = [HomePage(), MainTodo()];
  CollectionReference _todo = FirebaseFirestore.instance.collection('ToDo');
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> addTodo(String toDoTitle) {
    return _todo
        .add({
          'userId': auth.currentUser!.uid ?? "no user",
          'toDoTitle': toDoTitle

        })
        .then((value) => print("To Do Added"))
        .catchError((error) => print("Failed to add To Do: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Todo"),
        ],
        onTap: (index) {
          _currentIndex = index;

          print(_currentIndex);
          setState(() {});
        },
      ),
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(Container(
            height: 150,
            color: Colors.white,
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "To Do Title", 
                    ),
                    controller: _toDoController,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTodo(_toDoController.text);
                      },
                      child: Icon(Icons.add)),
                ],
              ),
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
