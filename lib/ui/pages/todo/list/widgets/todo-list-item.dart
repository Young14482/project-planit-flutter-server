import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planit/ui/pages/todo/detail/todo_detail_page.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_checkbox.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_expansion.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.widget,
    required this.index,
  });

  final TodoListExpansion widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TodoDetailPage(widget.list![index].id)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100], // 배경색을 회색으로 설정
            borderRadius: BorderRadius.circular(12.0), // 모서리를 둥글게 설정
          ),
          child: ListTile(
            leading: TodoListCheckbox(),
            title: Text(
              widget.list![index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Text(
                    DateFormat('yy-MM-dd').format(widget.list![index].dueDate)),
                Icon(Icons.alarm),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
