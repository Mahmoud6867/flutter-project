import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../todo/todo_main.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _toDoController = TextEditingController();
      CollectionReference _todo = FirebaseFirestore.instance.collection('ToDo');
       FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> addTodo(String toDoTitle) {

      return _todo
          .add({
              'userId':auth.currentUser!.uid  ?? "no user",
              'toDoTitle':toDoTitle  
          })
          .then((value) => print("To Do Added"))
          .catchError((error) => print("Failed to add To Do: $error"));
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  foregroundColor: Colors.amber,
  title: Text("Home"),
  centerTitle: true,
),
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "To Do Title",
                ),
                controller: _toDoController,
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                addTodo(_toDoController.text);
              }, child: Icon(Icons.add)),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){Get.to(MainTodo());}, child: Text("Todo"))
    ],
  ),
),
    );
  }
}