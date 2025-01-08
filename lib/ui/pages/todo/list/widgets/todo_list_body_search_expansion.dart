import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body_search_checkbox.dart';


class TodoListBodySearchExpansion extends StatefulWidget {
  const TodoListBodySearchExpansion({super.key});

  @override
  State<TodoListBodySearchExpansion> createState() =>
      _TodoListBodySearchExpansionState();
}

class _TodoListBodySearchExpansionState extends State<TodoListBodySearchExpansion> {
  bool _isExpanded = false; // 컬럼의 확장 상태를 관리하는 변수

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded; // 버튼 클릭 시 확장 상태를 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text('확장 버튼'),
              IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: _toggleExpand,
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isExpanded,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // 배경색을 회색으로 설정
                    borderRadius: BorderRadius.circular(12.0), // 모서리를 둥글게 설정
                    // border 속성은 제거
                  ),
                  child: ListTile(
                    leading: TodoListBodySearchCheckbox(),
                    title: Text(
                      "영어 단어 10개 외우기",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text("01-05"),
                        Icon(Icons.alarm),
                      ],
                    ),
                    trailing: Icon(Icons.flag_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
