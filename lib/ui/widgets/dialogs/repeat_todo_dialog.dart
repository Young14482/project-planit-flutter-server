import 'package:flutter/material.dart';

class RepeatTodoDialog extends StatefulWidget {
  final String repeat;

  RepeatTodoDialog(this.repeat);

  @override
  _RepeatTodoDialogState createState() => _RepeatTodoDialogState(repeat);
}

class _RepeatTodoDialogState extends State<RepeatTodoDialog> {
  String selectedOption; // 선택된 옵션을 저장하는 변수
  bool? isRepeatTask; // 스위치 상태를 저장하는 변수
  _RepeatTodoDialogState(this.selectedOption) {
    isRepeatTask = selectedOption != "없음";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      // 다이얼로그 모서리를 둥글게 설정
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 다이얼로그 너비 설정
        height: MediaQuery.of(context).size.height * 0.5, // 다이얼로그 높이 설정
        padding: EdgeInsets.all(16.0), // 다이얼로그 내부 여백 설정
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '반복 작업으로 설정',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('반복 작업으로 설정'),
              value: isRepeatTask!, // 스위치 상태 설정
              onChanged: (bool value) {
                setState(() {
                  isRepeatTask = value; // 스위치 상태 업데이트
                  if (isRepeatTask!) {
                    selectedOption = "매일";
                  } else {
                    selectedOption = "없음";
                  }
                });
              },
              activeColor: Colors.blue.shade600, // 스위치가 켜져 있을 때 색상 설정
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOptionButton('매일'), // '매일' 버튼
                _buildOptionButton('매주'), // '주간' 버튼
                _buildOptionButton('매월'), // '월간' 버튼
                _buildOptionButton('매년'), // '매년' 버튼
              ],
            ),
            Spacer(), // 남은 공간을 채워주는 위젯
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: Text('취소'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedOption); // 다이얼로그 닫기
                  },
                  child: Text('완료'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 옵션 버튼을 생성하는 함수
  Widget _buildOptionButton(String option) {
    return ElevatedButton(
      onPressed: isRepeatTask!
          ? () {
              // 스위치가 켜져 있을 때만 버튼 활성화
              setState(() {
                selectedOption = option; // 버튼 선택 시 선택된 옵션을 업데이트
              });
            }
          : null, // 스위치가 꺼져 있을 때 버튼 비활성화
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedOption == option
            ? Colors.blue.shade200
            : null, // 선택된 옵션일 경우 배경색을 blue.shade200으로 설정
      ),
      child: Text(option), // 버튼 텍스트 설정
    );
  }
}
