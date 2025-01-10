import 'package:flutter/material.dart';
import 'package:planit/ui/pages/auth/find_password/widgets/find_password_body.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FindPasswordBody(), // body 위젯을 여기서 사용
    );
  }
}
