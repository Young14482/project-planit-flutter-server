import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../_core/utils/api_dio.dart';
import '../../main.dart';
import '../repository/user_repository.dart';

class SessionUser {
  int? id;
  String? username;
  String? accessToken;
  bool? isLogin;

  SessionUser({this.id, this.username, this.accessToken, this.isLogin});
}

class SessionGVM extends Notifier<SessionUser> {
  final mContext = navigatorKey.currentContext!;

  UserRepository userRepository = const UserRepository();

  @override
  SessionUser build() {
    return SessionUser(
        id: null, username: null, accessToken: null, isLogin: false);
  }

  Future<void> login(String username, String password) async {
    final requestBody = {
      "username": username,
      "password": password,
    };

    // 구조 분해 할당으로 return
    // final (Map<String, dynamic> responseBody, String accessToken) =
    final (responseBody, accessToken) =
        await userRepository.findByUsernameAndPassword(requestBody);

    if (!responseBody["success"]) {
      // 로그인 실패
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    // 1. 토큰을 Storage 저장 -> Storage는 휴대폰 껏다 켜도 데이터 보존 -> flutter_secure_storage 라이브러리 필요
    await secureStorage.write(
        key: "accessToken", value: accessToken); // I/O -> 오래 걸린다.

    // 2. SessionUser 갱신
    Map<String, dynamic> data = responseBody["response"];
    state = SessionUser(
        id: data["id"],
        username: data["username"],
        accessToken: accessToken,
        isLogin: true);

    // 3. Dio 토큰 세팅, dio는 메모리에 저장이라 await 필요 없음 -> 껐다 키면 없어지는 데이터
    dio.options.headers["Authorization"] = accessToken;

    // Logger().d(accessToken);
    Navigator.popAndPushNamed(mContext, "/mainpage");
  }

  Future<void> signup(String username, String email, String password) async {
    final body = {
      "username": username,
      "email": email,
      "password": password,
    };

    Map<String, dynamic> responseBody = await userRepository.save(body);
    Logger().d(responseBody);
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    Logger().d(responseBody);
    Navigator.pushNamed(mContext, "/login");
  }

  Future<void> logout() async {
    // 1. 디바이스 토큰 삭제
    await secureStorage.delete(key: "accessToken");

    // 2. 상태 갱신
    state = SessionUser();

    // 3. dio 갱신
    dio.options.headers["Authorization"] = "";

    // 4. 화면 이동
    Navigator.popAndPushNamed(mContext, "/login");
  }

  // Future<void> autoLogin() async {
  //   Future.delayed(
  //     Duration(seconds: 1),
  //     () {
  //       Navigator.popAndPushNamed(mContext, "/login");
  //     },
  //   );
  // }

  Future<void> autoLogin() async {
    // 1. 디바이스에서 토큰 가져오기 (오래 걸리는 작업)
    String? accessToken = await secureStorage.read(key: "accessToken");
    // Logger().d(accessToken);

    // 토큰 없을 경우 로그인 화면으로
    if (accessToken == null) {
      Navigator.popAndPushNamed(mContext, "/login");
      return;
    }

    // 2. 로그인 통신
    Map<String, dynamic> responseBody =
        await userRepository.autoLogin(accessToken);

    // 로그인 실패 시
    if (!responseBody["success"]) {
      Navigator.popAndPushNamed(mContext, "/login");
      return;
    }

    // 3. 로그인 성공 시 SessionUser 상태 업데이트
    Map<String, dynamic> data = responseBody["response"];
    state = SessionUser(
        id: data["id"],
        username: data["username"],
        accessToken: accessToken,
        isLogin: true);

    dio.options.headers["Authorization"] = accessToken;

    Navigator.popAndPushNamed(mContext, "/mainpage");
  }

  Future<void> checkDuplicateId(String username) async {
    if (username.isEmpty) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("아이디를 입력해주세요.")),
      );
      return;
    }

    try {
      final body = {"username": username};
      Map<String, dynamic> responseBody =
          await userRepository.checkUsername(body);
      if (!responseBody['success']) {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("사용 가능한 아이디입니다.")),
        );
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("이미 사용 중인 아이디입니다.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("오류 발생: $e")),
      );
    }
  }

  Future<void> validateUser(String username, String email, String password,
      String confirmPassword) async {
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("모든 칸을 채워주세요.")),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("유효한 이메일 형식이 아닙니다.")),
      );
      return;
    }

    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$')
        .hasMatch(password)) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("비밀번호는 영문 + 숫자 조합, 8~15자여야 합니다.")),
      );
      return;
    }

    // 비밀번호 일치 여부 확인
    if (password != confirmPassword) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("비밀번호가 일치하지 않습니다.")),
      );
      return;
    }

    // 회원가입 처리
    try {
      await signup(username.trim(), email.trim(), password.trim());
    } catch (e) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패")),
      );
    }
  }

  // 비밀번호 변경
  Future<void> passwordUpdate(String currentPassword, String newPassword, String confirmPassword, int id, String username) async {


    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$')
        .hasMatch(newPassword)) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("비밀번호는 영문 + 숫자 조합, 8~15자여야 합니다.")),
      );
      return;
    }
    if(newPassword != confirmPassword) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("새 비밀번호와 비밀번호 확인이 동일하지 않습니다.")),
      );
      return;
    }
    final body = {
      "prev" : currentPassword,
      "password": newPassword,
    };

    Map<String, dynamic> responseBody = await userRepository.passwordUpdate(body, id);

    Logger().d(responseBody);
    if(!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text(responseBody["errorMessage"])),
      );
      return;
    }
    Navigator.popAndPushNamed(mContext, "/mainpage");
  }


}

final sessionProvider = NotifierProvider<SessionGVM, SessionUser>(() {
  return SessionGVM();
});
