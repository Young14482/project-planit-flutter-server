import 'package:intl/intl.dart';

import 'category.dart';

class Todo {
  int id;
  String title;
  Category category;
  String memo;
  DateTime dueDate;
  DateTime createdAt;
  String repeat;
  bool isCompleted;
  bool isDeleted;

  @override
  String toString() {
    return 'Todo{id: $id, title: $title}';
  }

  Todo.fromMap(Map<String, dynamic> map)
      : this.id = map["id"],
        this.title = map["title"],
        this.category = Category.fromMap(map["category"]),
        this.memo = map["memo"],
        this.dueDate = DateFormat("yyyy-MM-dd").parse(map["dueDate"]),
        this.createdAt =
            DateFormat("yyyy-MM-ddTHH:mm:ss").parse(map["createdAt"]),
        this.repeat = map["repeat"],
        this.isCompleted = map["isCompleted"],
        this.isDeleted = map["isDeleted"];
}
