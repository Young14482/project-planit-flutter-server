import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data/model/todo.dart';
import 'package:planit/data/repository/profile_repository.dart';

import '../../../data/model/category.dart';
import '../../../main.dart';

class Chart {
  final String x;
  final double y;

  Chart(this.x, this.y);
}

class ProfileModel {
  List<Todo> todos;
  List<Category> categories;
  int complete = 0;
  int notComplete = 0;
  List<Chart>? charts;
  List<DateTime>? dateTimes;

  ProfileModel(this.complete, this.notComplete,
      {required this.categories, required this.todos});

  ProfileModel.fromMap(Map<String, dynamic> map)
      : todos = (map["todos"] as List<dynamic>)
            .map((e) => Todo.fromMap(e))
            .toList(),
        categories = (map["categories"] as List<dynamic>)
            .map((e) => Category.fromMap(e))
            .toList(),
        complete = (map["todos"] as List<dynamic>).where((todos) {
          return todos["isCompleted"] == true;
        }).length,
        notComplete = (map["todos"] as List<dynamic>).where((todos) {
          return todos["isCompleted"] == false;
        }).length;
}

final profileProvider = NotifierProvider<ProfileVM, ProfileModel?>(() {
  return ProfileVM();
});

class ProfileVM extends Notifier<ProfileModel?> {
  ProfileRepository profileRepository = const ProfileRepository();
  final mContext = navigatorKey.currentContext!;

  @override
  ProfileModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> responseBody = await profileRepository.findAll();
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("프로필 로드 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    ProfileModel profileModel = ProfileModel.fromMap(responseBody["response"]);
    List<Chart> charts = generateWeeklyChart(profileModel.todos);
    List<DateTime> dateTimes = extractCompletedDueDates(profileModel.todos);

    profileModel.charts = charts;
    profileModel.dateTimes = dateTimes;
    state = profileModel;
  }

  List<Chart> generateWeeklyChart(List<Todo> todos) {
    // 이번 주 시작일과 끝일 계산
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

    // 요일별 작업 수 초기화
    Map<int, int> weeklyCounts = {
      for (var i = 0; i < 7; i++) i: 0, // 0: 월요일, 6: 일요일
    };

    // 이번 주에 해당하는 작업을 요일별로 분류
    for (var todo in todos) {
      if (todo.isCompleted && // isCompleted가 true인지 확인
          todo.dueDate
              .isAfter(startOfWeek.subtract(const Duration(seconds: 1))) &&
          todo.dueDate.isBefore(endOfWeek.add(const Duration(seconds: 1)))) {
        int weekdayIndex = todo.dueDate.weekday - 1; // Dart에서 1: 월요일, 7: 일요일
        weeklyCounts[weekdayIndex] = weeklyCounts[weekdayIndex]! + 1;
      }
    }

    // 요일 이름 리스트
    List<String> weekdayNames = ["월", "화", "수", "목", "금", "토", "일"];

    // Chart 객체 리스트 생성
    List<Chart> chartData = weeklyCounts.entries.map((entry) {
      return Chart(weekdayNames[entry.key], entry.value.toDouble());
    }).toList();

    return chartData;
  }

  List<DateTime> extractCompletedDueDates(List<Todo> todos) {
    List<DateTime> completedDates = [];

    for (var todo in todos) {
      if (todo.isCompleted) {
        // 시간 정보를 제외하고 연, 월, 일만 유지
        completedDates.add(
            DateTime(todo.dueDate.year, todo.dueDate.month, todo.dueDate.day));
      }
    }

    return completedDates;
  }
}
