import 'package:collection/collection.dart';
import 'package:planit/data/model/todo.dart';


void main() {
  List<Todo> todos = [
    Todo.fromMap({
      "id": 1,
      "title": "Task 1",
      "category": null,
      "memo": "Memo 1",
      "dueDate": "2023-04-10",
      "createdAt": "2023-01-10T12:00:00",
      "repeat": "None",
      "isCompleted": false
    }),
    Todo.fromMap({
      "id": 2,
      "title": "Task 1",
      "category": null,
      "memo": "Memo 1",
      "dueDate": "2023-04-11",
      "createdAt": "2023-01-10T12:00:00",
      "repeat": "None",
      "isCompleted": false
    }),
    Todo.fromMap({
      "id": 3,
      "title": "Task 1",
      "category": null,
      "memo": "Memo 1",
      "dueDate": "2023-04-11",
      "createdAt": "2023-01-10T12:00:00",
      "repeat": "None",
      "isCompleted": false
    }),
    // 더 많은 할 일 추가
  ];

  var groupedTodos = groupBy(todos, (Todo todo) => todo.dueDate);

  groupedTodos.forEach((date, todos) {
    print('Due date: $date');
    todos.forEach((todo) {
      print(todo);
    });
  });
}
