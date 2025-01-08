import 'package:flutter/material.dart';

class AlarmDialog extends StatefulWidget {
  const AlarmDialog({Key? key}) : super(key: key);

  @override
  _AlarmDialog createState() => _AlarmDialog();
}

final List<String> list = ["마감 시간", "5분 전", "10분 전", "30분 전", "1시간 전", "1일 전"];

class _AlarmDialog extends State<AlarmDialog> {
  bool _isSwitched = false; // 스위치 상태를 추적하는 변수
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('알림 꺼짐'),
          Switch(
            value: _isSwitched,
            onChanged: (bool newValue) {
              setState(() {
                _isSwitched = newValue;
              });
            },
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("에 알림"),
          SizedBox(
            width: 76,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                style: const TextStyle(fontSize: 13),
                items: list
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
            ),
          ),
        ],
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
            Navigator.pop(context);
          },
          child: const Text('완료'),
        ),
      ],
    );
  }
}
