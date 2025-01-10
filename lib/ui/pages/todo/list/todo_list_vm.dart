import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:planit/data/model/todo.dart';
import 'package:planit/main.dart';

import '../../../../data/repository/todo_repository.dart';

class TodoListModel {
  // 분류별 리스트
  List<Todo>? todosPrev;
  List<Todo>? todosToday;
  List<Todo>? todosFuture;
  List<Todo>? todosCompleted;

  @override
  String toString() {
    return 'TodoListModel{todosPrev: $todosPrev}';
  }

  TodoListModel.fromMap(Map<String, dynamic> map) {
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);

    this.todosPrev = (map["todos"] as List<dynamic>).where((e) {
      DateTime dueDate = DateFormat("yyyy-MM-dd").parse(e["dueDate"]);
      return dueDate.isBefore(todayWithoutTime);
    }).map((e) {
      return Todo.fromMap(e);
    }).toList();

    this.todosToday = (map["todos"] as List<dynamic>).where((e) {
      DateTime dueDate = DateFormat("yyyy-MM-dd").parse(e["dueDate"]);
      DateTime dueDateWithoutTime =
          DateTime(dueDate.year, dueDate.month, dueDate.day);
      return dueDateWithoutTime.compareTo(todayWithoutTime) == 0;
    }).map((e) {
      return Todo.fromMap(e);
    }).toList();

    this.todosFuture = (map["todos"] as List<dynamic>).where((e) {
      DateTime dueDate = DateFormat("yyyy-MM-dd").parse(e["dueDate"]);
      return dueDate.isAfter(todayWithoutTime);
    }).map((e) {
      return Todo.fromMap(e);
    }).toList();

    this.todosCompleted = (map["todos"] as List<dynamic>).where((e) {
      return e["isCompleted"] == true;
    }).map((e) {
      return Todo.fromMap(e);
    }).toList();
  }
}

final TodoListProvider = NotifierProvider<TodoListVM, TodoListModel?>(() {
  return TodoListVM();
});

class TodoListVM extends Notifier<TodoListModel?> {
  final mContext = navigatorKey.currentContext;
  TodoRepository todoRepository = TodoRepository();

  @override
  TodoListModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    // Logger().d("통신 1번");
    Map<String, dynamic> responseBody = await todoRepository.findAll();

    // 리스트 로딩 실패 시
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("Todo 리스트 보기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    Logger().d(responseBody["response"]);
    state = TodoListModel.fromMap(responseBody["response"]);
  }
}
