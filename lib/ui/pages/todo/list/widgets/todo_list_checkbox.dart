import 'package:flutter/material.dart';

class TodoListCheckbox extends StatefulWidget {
  const TodoListCheckbox({super.key});

  @override
  State<TodoListCheckbox> createState() => _TodoListCheckboxState();
}

class _TodoListCheckboxState extends State<TodoListCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      icon: CircleAvatar(
        radius: 15,
        backgroundColor: isChecked ? Colors.grey : Colors.transparent,
        child: isChecked
            ? Icon(Icons.check, color: Colors.white, size: 20)
            : CircleAvatar(
                radius: 13,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
      ),
      onPressed: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
    );
    ;
  }
}
