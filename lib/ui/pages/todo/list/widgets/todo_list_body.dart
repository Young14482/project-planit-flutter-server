import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/ui/pages/todo/list/todo_list_vm.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_category_line.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_expansion.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_point_popup.dart';

class TodoListBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoListModel? model = ref.watch(TodoListProvider);
    // Logger().d(model);

    return ListView(
      children: [
        // TODO 검색 버튼 누를 경우 카테고리 라인 제거하고 검색 textform
        Row(
          children: [
            // 수평 스크롤 카테고리
            Expanded(
              child: TodoListCategoryLine(),
            ),
            // 점 3개 팝업 메뉴
            TodoListPointPopup(),
          ],
        ),
        // TODO 작업이 하나도 없을 때 보여주는 화면 적용 안됨
        // 확장 패널
        if (model?.todosPrev != null)
          TodoListExpansion(
            title: "이전의",
            list: model?.todosPrev,
          ),
        if (model?.todosToday != null)
          TodoListExpansion(
            title: "오늘",
            list: model?.todosToday,
          ),
        if (model?.todosFuture != null)
          TodoListExpansion(
            title: "미래",
            list: model?.todosFuture,
          ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/completed-plan");
              },
              child: Text(
                "완료된 모든 작업 확인",
                style: TextStyle(
                  color: Colors.grey, // 글자색을 회색으로 설정
                  decoration: TextDecoration.underline, // 밑줄 추가
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
