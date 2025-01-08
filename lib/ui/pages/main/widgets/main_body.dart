import 'package:flutter/material.dart';
import 'package:planit/ui/pages/calendar/calendar_page.dart';
import 'package:planit/ui/pages/main/widgets/main_body_dummy.dart';
import 'package:planit/ui/pages/profile/porfile_page.dart';
import 'package:planit/ui/pages/todo/list/todo_list_page.dart';

class MainBody extends StatelessWidget {
  final int selectedIndex;

  MainBody({
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        MainBodyDummy(),
        TodoListPage(),
        // 캘린더
        CalendarPage(),
        // 내 정보
        ProfilePage(),
      ],
    );
    ;
  }
}
