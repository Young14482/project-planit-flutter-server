import 'package:flutter/material.dart';
import 'package:planit/ui/pages/auth/login/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginBody(), // body 위젯을 여기서 사용
    );
  }
}
