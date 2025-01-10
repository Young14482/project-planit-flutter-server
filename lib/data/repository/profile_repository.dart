import 'package:dio/dio.dart';

import '../../_core/utils/api_dio.dart';

class ProfileRepository {
  const ProfileRepository();

  Future<Map<String, dynamic>> findAll({int page = 0}) async {
    Response response =
    await dio.get("/api/todo-category");
    Map<String, dynamic> body = response.data;
    return body;
  }
}
