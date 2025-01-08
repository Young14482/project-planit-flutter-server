import 'package:flutter/material.dart';

class CategoryDialog extends StatelessWidget {
  final TextEditingController categoryController;

  const CategoryDialog({Key? key, required this.categoryController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('새 카테고리 생성'),
      content: TextField(
        controller: categoryController,
        decoration: const InputDecoration(hintText: '여기에 입력하십시오.'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            print(categoryController.text);
            Navigator.pop(context);
          },
          child: const Text('저장'),
        ),
      ],
    );
  }
}
