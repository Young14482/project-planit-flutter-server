import 'package:flutter/material.dart';
import 'package:planit/ui/pages/auth/signup/widgets/signup_body.dart';

import '../../../widgets/custom_auth_appbar.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppbar(title: "회원 가입"),
      backgroundColor: Colors.white,
      body: SignupBody(), // body 위젯을 여기서 사용
    );
  }
}
