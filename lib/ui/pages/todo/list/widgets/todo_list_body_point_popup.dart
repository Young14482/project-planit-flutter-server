import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

class TodoListBodyPointPopup extends StatefulWidget {
  @override
  State<TodoListBodyPointPopup> createState() => _TodoListBodyPointPopupState();
}

class _TodoListBodyPointPopupState extends State<TodoListBodyPointPopup> {
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
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('카테고리 관리'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('검색'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('작업 정렬'),
        ),
      ],
    );
  }
}
