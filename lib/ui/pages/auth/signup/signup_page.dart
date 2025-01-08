import 'package:flutter/material.dart';
import 'package:planit/ui/pages/auth/signup/widgets/signup_body.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SignupBody(), // body 위젯을 여기서 사용
    );
  }
}
