import 'package:flutter/material.dart';


class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // + 버튼
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
      ),
    );
  }
}
