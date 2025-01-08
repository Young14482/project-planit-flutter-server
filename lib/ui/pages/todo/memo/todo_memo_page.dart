import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/memo/widgets/todo_memo_body.dart';

class TodoMemoPage extends StatelessWidget {
  TodoMemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TodoMemoBody(),
    );
  }
}
