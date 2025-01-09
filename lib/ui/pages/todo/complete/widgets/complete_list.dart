import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_checkbox.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_remove_all_dialog.dart';

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
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: <Widget>[
              Text('2025-01-11'),
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
                    leading: CompleteCheckbox(),
                    title: Text(
                      "영어 단어 10개 외우기",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        // This adds the strikethrough
                        color: Colors.grey,
                        // This changes the text color to gray
                        fontWeight: FontWeight.bold, // This keeps the text bold
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "01-05",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
