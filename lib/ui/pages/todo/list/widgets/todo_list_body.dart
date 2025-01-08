import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body_category_line.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body_expansion.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body_point_popup.dart';

class TodoListBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // TODO 검색 버튼 누를 경우 카테고리 라인 제거하고 검색 textform
        Row(
          children: [
            // 수평 스크롤 카테고리
            Expanded(
              child: TodoListBodyCategoryLine(),
            ),
            // 점 3개 팝업 메뉴
            TodoListBodyPointPopup(),
          ],
        ),
        // TODO 작업이 하나도 없을 때 보여주는 화면 PlanListBodyCheckbox
        // 확장 패널
        TodoListBodyExpansion(),
        TodoListBodyExpansion(),
        TodoListBodyExpansion(),
        Center(
          child: Text(
            "완료된 모든 작업 확인",
            style: TextStyle(
              color: Colors.grey, // 글자색을 회색으로 설정
              decoration: TextDecoration.underline, // 밑줄 추가
            ),
          ),
        ),
      ],
    );
  }
}
