import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoListBody(),
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
