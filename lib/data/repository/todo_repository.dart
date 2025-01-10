import 'package:dio/dio.dart';

import '../../_core/utils/api_dio.dart';

class TodoRepository {
  Future<Map<String, dynamic>> findAll() async {
    Response response = await dio.get("/api/todo-category");
    Map<String, dynamic> body = response.data;
    return body;
  }
}
