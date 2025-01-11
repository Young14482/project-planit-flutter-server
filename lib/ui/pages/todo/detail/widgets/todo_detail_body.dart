import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/ui/pages/todo/detail/todo_detail_vm.dart';
import 'package:planit/ui/pages/todo/memo/todo_memo_page.dart';
import 'package:planit/ui/widgets/dialogs/calendar_dialog.dart';
import 'package:planit/ui/widgets/dialogs/repeat_todo_dialog.dart';

List<String> list = ['카테고리 없음', "카테고리1", "카테고리2", "카테고리3", "카테고리4", "카테고리5"];

class TodoDetailBody extends StatefulWidget {
  final int todoId;

  TodoDetailBody(this.todoId);

  @override
  State<TodoDetailBody> createState() => _TodoDetailBodyState(todoId);
}

class _TodoDetailBodyState extends State<TodoDetailBody> {
  String dropdownValue = list.first;
  final int todoId;

  _TodoDetailBodyState(this.todoId);

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    return Consumer(
      builder: (context, ref, child) {
        TodoDetailModel? model = ref.watch(todoDetailProvider(todoId));
        TodoDetailVM vm = ref.read(todoDetailProvider(todoId).notifier);

        if (model == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          title.text = model.todo.title;
          String memo = model.todo.memo;
          String repeat = model.todo.repeat;
          DateTime dueDate = model.todo.dueDate;
          FocusNode _focusNode = FocusNode();

          _focusNode.addListener(() {
            if (!_focusNode.hasFocus) {
              setState(() {
                vm.changeTitle(title.text.trim());
              });
            }
          });

          return PopScope(
            onPopInvokedWithResult: (didPop, result) {
              vm.update();
              _focusNode.dispose();
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 130,
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            style: TextStyle(fontSize: 13),
                            items: list
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: title,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "제목없음",
                    ),
                    focusNode: _focusNode,
                  ),
                  Divider(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        alignment: Alignment.centerLeft,
                        child: Icon(CupertinoIcons.calendar),
                      ),
                      Text("마감일"),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          final DateTime pickedDate = await showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CalendarDialog(dueDate),
                          );

                          if (pickedDate != null && pickedDate != dueDate) {
                            setState(() {
                              vm.changeDate(pickedDate);
                              print(dueDate);
                            });
                          }
                        },
                        child:
                            Text("${DateFormat('yy-MM-dd').format(dueDate)}"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.repeat),
                      ),
                      Text("반복"),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  RepeatTodoDialog(repeat));
                          if (result != null && result != repeat) {
                            setState(() {
                              vm.changeRepeat(result);
                              print(result);
                            });
                          }
                        },
                        child: Text("${repeat}"),
                      ),
                    ],
                  ),
                  Divider(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.event_note),
                      ),
                      Text("메모"),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      TodoMemoPage(title.text, memo)));

                          if (result != memo) {
                            setState(() {
                              vm.changeMemo(result);
                            });
                          }
                        },
                        child: Text("${memo.isEmpty ? '추가' : '수정'}"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 42, height: 10),
                      Text(
                        "${memo}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
