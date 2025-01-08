import 'package:flutter/material.dart';

class FindIdPage extends StatelessWidget {
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
                    '아이디 찾기',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
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
                  SizedBox(height: 20),
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