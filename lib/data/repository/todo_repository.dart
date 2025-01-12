import 'package:dio/dio.dart';

import '../../_core/utils/my_http.dart';

class TodoRepository {
  const TodoRepository();

  Future<Map<String, dynamic>> findAll() async {
    Response response = await dio.get("/api/todo-category");
    Map<String, dynamic> body = response.data;
    return body;
  }

  Future<Map<String, dynamic>> findById(int id) async {
    Response response = await dio.get("/api/todo/$id");

    Map<String, dynamic> body = response.data;

    return body;
  }

  Future<Map<String, dynamic>> newTodo() async {
    Response response = await dio.post("/api/todo");

    Map<String, dynamic> body = response.data;

    return body;
  }

  Future<Map<String, dynamic>> update(int id, Map<String, dynamic> data) async {
    Response response = await dio.put("/api/todo/$id", data: data);

    Map<String, dynamic> body = response.data;

    return body;
  }

  Future<Map<String, dynamic>> delete(int id) async {
    Response response = await dio.delete("/api/todo/$id");

    Map<String, dynamic> body = response.data;

    return body;
  }
}
