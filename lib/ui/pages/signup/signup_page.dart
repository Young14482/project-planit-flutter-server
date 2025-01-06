import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9ffff),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 로고
                  SizedBox(height: 20),
                  Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  // 아이디 입력, 중복확인 버튼
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "아이디",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("중복확인"),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // 이메일
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "이메일",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // 비밀번호 입력
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "비밀번호 (영문 + 숫자, 8~15자)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // 비밀번호 확인
                  TextFormField(
                    controller: _confirmPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "비밀번호 확인",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 회원가입 버튼
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        // 둥근 버튼
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("회원가입"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}