import 'package:flutter/material.dart';

import 'widgets/change_password_body.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangePasswordBody(), // body 위젯을 여기서 사용
    );
  }
}
