import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/detail/widgets/todo_detail_body.dart';

class TodoDetailPage extends StatelessWidget {
  TodoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.delete))
        ],
      ),
      body: TodoDetailBody(),
    );
  }
}
