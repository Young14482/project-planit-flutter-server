import 'package:flutter/material.dart';

class FindPasswordPage extends StatelessWidget {
  final _username = TextEditingController();
  final _email = TextEditingController();

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
                    '비밀번호 찾기',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  // 아이디 입력
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
                  // 이메일 입력
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
                  SizedBox(height: 20),
                  // 찾기 버튼
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("찾기"),
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