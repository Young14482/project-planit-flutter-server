import 'package:flutter/material.dart';
import 'package:planit/ui/widgets/custom_auth_appbar.dart';

import 'widgets/change_password_body.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppbar(title: "비밀번호 변경"),
      backgroundColor: Colors.white,
      body: ChangePasswordBody(), // body 위젯을 여기서 사용
    );
  }
}
