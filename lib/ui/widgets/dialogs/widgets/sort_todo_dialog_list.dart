import 'package:flutter/material.dart';

enum SingingCharacter {
  dateAndTime,
  createdByDesc,
  createdByAsc,
  alphabetAtoZ,
  alphabetZtoA
}

class SortTodoDialogList extends StatefulWidget {
  const SortTodoDialogList({super.key});

  @override
  State<SortTodoDialogList> createState() => _SortTodoDialogListState();
}

class _SortTodoDialogListState extends State<SortTodoDialogList> {
  SingingCharacter? _character = SingingCharacter.dateAndTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('마감 날짜 및 시간'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.dateAndTime,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('작업 생성 시간(최신순 하위)'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.createdByDesc,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('작업 생성 시간(최신순 상위)'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.createdByAsc,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('알파벳 A-Z'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.alphabetAtoZ,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('알파벳 Z-A'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.alphabetZtoA,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
