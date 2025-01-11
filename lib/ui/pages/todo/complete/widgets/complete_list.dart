import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_remove_all_dialog.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_expansion.dart';

class CompleteList extends StatefulWidget {
  @override
  _CompleteListState createState() => _CompleteListState();
}

class _CompleteListState extends State<CompleteList> {
  bool _isExpanded = true; // 컬럼의 확장 상태를 관리하는 변수

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded; // 버튼 클릭 시 확장 상태를 토글
    });
  }

  void _showAlertDialog(
      BuildContext context, String main, String sub, String confirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CompleteRemoveAllDialog(
        main: main,
        sub: sub,
        confirm: confirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // This distributes the icons to the left and right ends
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.delete),
              onPressed: () {
                _showAlertDialog(
                    context, "완료된 작업을 삭제하시겠습니까?", "한번 삭제되면 복구할 수 없습니다.", "삭제");
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "완료시간",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        TodoListExpansion(
          title: "asdf",
        )
      ],
    );
  }
}
