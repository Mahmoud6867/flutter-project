import 'package:flutter/material.dart';

import 'todo_page.dart';

class MainTodo extends StatelessWidget {
  const MainTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ToDoPage(),
    );
  }
}