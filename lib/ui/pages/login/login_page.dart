import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _username = TextEditingController();
  final _password = TextEditingController();

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
                  // 로고 이미지 추가하기
                  Text(
                    'Planit',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  // 아이디
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "아이디",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // 비밀번호
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "비밀번호",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("로그인"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/findId");
                        },
                        child: Text("아이디 찾기"),
                      ),
                      Text("|"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/findPassword");
                        },
                        child: Text("비밀번호 찾기"),
                      ),
                      Text("|"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/join");
                        },
                        child: Text("회원가입"),
                      ),
                    ],
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
