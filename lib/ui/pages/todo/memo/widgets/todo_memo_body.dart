import 'package:flutter/material.dart';

class TodoMemoBody extends StatelessWidget {
  final TextEditingController memo = TextEditingController();
  String title;

  TodoMemoBody(this.title, String m) {
    memo.text = m;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.pop(context, memo.text);
      },
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "$title",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: memo,
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
