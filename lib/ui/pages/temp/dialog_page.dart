import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/dialogs/calendar_dialog.dart';
import '../../widgets/dialogs/repeat_todo_dialog.dart';
import '../../widgets/dialogs/time_set_dialog.dart';

class DialogPage extends StatefulWidget {
  DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 10),
          CustomButton("알림", () {
            _showAlarmDialog(context);
          }),
          SizedBox(height: 10),
          CustomButton("카테고리", () {
            _showInputCategoryDialog(context);
          }),
          SizedBox(height: 10),
          CustomButton("앱종료", () {
            _showAlertDialog(context, "종료 하시겠습니까?", "다시 탭하면 앱이 종료됩니다.", "종료");
          }),
          SizedBox(height: 10),
          CustomButton("작업삭제", () {
            _showAlertDialog(
                context, "작업을 삭제하시겠습니까?", "한번 삭제되면 복구할 수 없습니다.", "삭제");
          }),
          SizedBox(height: 10),
          CustomButton("로그아웃", () {
            _showAlertDialog(
                context, "로그아웃 하시겠습니까?", "로그인 화면으로 가게 됩니다.", "로그아웃");
          }),
          SizedBox(height: 10),
          CustomButton("반복", () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RepeatTodoDialog();
              },
            );
          }),
          SizedBox(height: 10),
          CustomButton("시간", () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return TimeSetDialog();
              },
            );
          }),
          SizedBox(height: 10),
          CustomButton("마감일", () {
            _showCalendarDialog();
          }),
        ],
      ),
    );
  }

  void _showAlertDialog(
      BuildContext context, String main, String sub, String confirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$main'),
        content: Text('$sub'),
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
            child: Text('$confirm'),
          ),
        ],
      ),
    );
  }

  void _showInputCategoryDialog(BuildContext context) {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('새 카테고리 생성'),
        content: TextField(
          controller: categoryController,
          decoration: InputDecoration(hintText: '여기에 입력하십시오.'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('취소'),
          ),
          TextButton(
            onPressed: () {
              print('${categoryController.text}');
              Navigator.pop(context);
            },
            child: Text('저장'),
          ),
        ],
      ),
    );
  }

  void _showAlarmDialog(BuildContext context) {
    bool _isSwitched = false;
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWithSwitch(),
    );
  }

  DateTime? _selectedDate;

  void _showCalendarDialog() async {
    final DateTime pickedDate = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CalendarDialog();
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        print(_selectedDate);
      });
    }
  }
}

class AlertDialogWithSwitch extends StatefulWidget {
  @override
  _AlertDialogWithSwitchState createState() => _AlertDialogWithSwitchState();
}

List<String> list = ["마감 시간", "5분 전", "10분 전", "30분 전", "1시간 전", "1일 전"];

class _AlertDialogWithSwitchState extends State<AlertDialogWithSwitch> {
  bool _isSwitched = false; // 스위치 상태를 추적하는 변수
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('알림 꺼짐'),
          Switch(
            value: _isSwitched, // 스위치 상태
            onChanged: (bool newValue) {
              setState(() {
                _isSwitched = newValue; // 스위치 상태 변경 시 상태 업데이트
              });
            },
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("에 알림"),
          SizedBox(
            width: 76,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                style: TextStyle(fontSize: 13),
                items: list
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
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
          child: Text('취소'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('완료'),
        ),
      ],
    );
  }
}
