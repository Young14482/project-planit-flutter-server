import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planit/ui/pages/todo/list/todo_list_vm.dart';

import '../../../../data/model/todo.dart';
import '../../../../data/repository/todo_repository.dart';
import '../../../../main.dart';

class TodoDetailModel {
  Todo todo;
  bool delete;

  TodoDetailModel.fromMap(Map<String, dynamic> map)
      : todo = Todo.fromMap(map),
        delete = false;

  TodoDetailModel(this.todo, {this.delete = false});
}

final todoDetailProvider = NotifierProvider.family
    .autoDispose<TodoDetailVM, TodoDetailModel?, int>(() {
  return TodoDetailVM();
});

class TodoDetailVM extends AutoDisposeFamilyNotifier<TodoDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;
  TodoRepository todoRepository = const TodoRepository();

  @override
  TodoDetailModel? build(id) {
    init(id);
    return null;
  }

  Future<void> init(int id) async {
    Map<String, dynamic> responseBody = await todoRepository.findById(id);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("정보 불러오기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }

    state = TodoDetailModel.fromMap(responseBody["response"]);
  }

  Future<void> delete() async {
    Map<String, dynamic> responseBody =
        await todoRepository.delete(state!.todo.id);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("삭제 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }

    state = TodoDetailModel(state!.todo, delete: true);
    ref.read(todoListProvider.notifier).init();
    Navigator.pop(mContext!);
  }

  Future<void> update() async {
    if (state!.delete!) return;
    String sDueDate = DateFormat('yyyy-MM-dd').format(state!.todo.dueDate);
    final body = {
      "title": state!.todo.title,
      "memo": state!.todo.memo,
      "dueDate": sDueDate,
      "repeat": state!.todo.repeat,
    };

    Map<String, dynamic> responseBody =
        await todoRepository.update(state!.todo.id, body);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("Todo 수정 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    ref.read(todoListProvider.notifier).init();
  }

  void changeDate(DateTime pickedDate) {
    Todo todo = state!.todo;
    todo.dueDate = pickedDate;
    state = TodoDetailModel(todo);
  }

  void changeTitle(String title) {
    if (title.isEmpty) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("제목을 입력해주세요")),
      );
      return;
    }

    Todo todo = state!.todo;
    todo.title = title;
    state = TodoDetailModel(todo);
  }

  void changeRepeat(String result) {
    Todo todo = state!.todo;
    todo.repeat = result;
    state = TodoDetailModel(todo);
  }

  void changeMemo(result) {
    Todo todo = state!.todo;
    todo.memo = result;
    state = TodoDetailModel(todo);
  }
//
// Future<void> delete(int id) async {
//   Map<String, dynamic> responseBody = await postRepository.delete(id);
//   if (!responseBody["success"]) {
//     ScaffoldMessenger.of(mContext!).showSnackBar(
//       SnackBar(content: Text("게시글 삭제 실패 : ${responseBody["errorMessage"]}")),
//     );
//     return;
//   }
//
//   // PostlisvVM의 상태를 변경
//   // ref.read(postListProvider.notifier).init(0);
//   ref.read(postListProvider.notifier).init();
//
//   // EventBus Notifier -> 삭제했어!
//
//   // 화면 파괴시 vm이 autoDispose 됨
//   Navigator.pop(mContext);
// }
}
