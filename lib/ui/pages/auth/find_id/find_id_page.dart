import 'package:flutter/material.dart';

import '../../../widgets/custom_auth_appbar.dart';
import 'widgets/find_id_body.dart'; // 변경된 body 클래스를 import

class FindIdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppbar(title: "아이디 찾기"),
      backgroundColor: Colors.white,
      body: FindIdBody(), // body 위젯을 여기서 사용
    );
  }
}
