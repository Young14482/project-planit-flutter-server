import 'package:flutter/material.dart';

import 'widgets/find_id_body.dart'; // 변경된 body 클래스를 import

class FindIdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FindIdBody(), // body 위젯을 여기서 사용
    );
  }
}
