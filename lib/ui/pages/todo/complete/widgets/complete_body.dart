import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planit/data/model/todo.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_list_expansion.dart';

import 'complete_remove_all_dialog.dart';

class CompleteBody extends StatelessWidget {
  final List<Todo>? list;

  CompleteBody({this.list});

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
    final groupedTodos = (list ?? []).isNotEmpty
        ? groupBy(list!, (Todo todo) => todo.dueDate)
        : {};

    // groupedTodos를 날짜 순으로 정렬
    final sortedEntries = groupedTodos.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return ListView(
      children: [
        // TODO 작업이 하나도 없을 때 보여주는 화면
        // 확장 패널
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    _showAlertDialog(context, "완료된 작업을 삭제하시겠습니까?",
                        "한번 삭제되면 복구할 수 없습니다.", "삭제");
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "완료날짜",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            // CompleteListExpansion(
            //   title: "asdf",
            //   list: list,
            // ),
            // sortedEntries를 반복하여 각 날짜에 대해 CompleteListExpansion 생성
            ...sortedEntries.map((entry) {
              return CompleteListExpansion(
                title: DateFormat("yyyy-MM-dd").format(entry.key),
                list: entry.value,
              );
            }).toList(),
          ],
        ),
      ],
    );
  }
}
