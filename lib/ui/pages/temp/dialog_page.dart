import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/dialogs/calendar_dialog.dart';
import '../../widgets/dialogs/category_dialog.dart';
import '../../widgets/dialogs/custom_dialog.dart';
import '../../widgets/dialogs/repeat_todo_dialog.dart';

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
      builder: (BuildContext context) => CustomDialog(
        main: main,
        sub: sub,
        confirm: confirm,
      ),
    );
  }

  void _showInputCategoryDialog(BuildContext context) {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => CategoryDialog(
        categoryController: categoryController,
      ),
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
