import 'package:flutter/material.dart';

class TodoMemoPage extends StatelessWidget {
  TodoMemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "제목",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "메모 추가",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
