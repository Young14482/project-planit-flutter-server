import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "user1234 | user1234@example.com",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "1일 동안 계획을 지켰습니다!!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
