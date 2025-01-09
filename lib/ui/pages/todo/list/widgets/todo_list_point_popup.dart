import 'package:flutter/material.dart';

import 'todo_list_category_button.dart';

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

class TodoListPointPopup extends StatefulWidget {
  @override
  State<TodoListPointPopup> createState() => _TodoListPointPopupState();
}

class _TodoListPointPopupState extends State<TodoListPointPopup> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/category");
              },
              child: Text("카테고리 관리")),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: TodoListCategoryButton(),
        ),
      ],
    );
  }
}
