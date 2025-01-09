import 'package:flutter/material.dart';
import 'package:planit/ui/pages/auth/find_password/widgets/find_password_body.dart';

import '../../../widgets/custom_auth_appbar.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppbar(title: "비밀번호 찾기"),
      backgroundColor: Colors.white,
      body: FindPasswordBody(), // body 위젯을 여기서 사용
    );
  }
}
