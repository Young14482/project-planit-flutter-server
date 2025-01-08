import 'package:flutter/material.dart';

class TodoMemoBody extends StatelessWidget {
  const TodoMemoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
