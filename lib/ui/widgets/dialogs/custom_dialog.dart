import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String main;
  final String sub;
  final String confirm;

  const CustomDialog({
    Key? key,
    required this.main,
    required this.sub,
    required this.confirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(main),
      content: Text(sub),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(confirm),
        ),
      ],
    );
  }
}
