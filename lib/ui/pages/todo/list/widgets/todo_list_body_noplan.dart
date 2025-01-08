// 작업 없을 때 보여줄 화면
import 'package:flutter/material.dart';

class TodoListBodyNoplan extends StatelessWidget {
  const TodoListBodyNoplan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          width: 300,
          height: 300,
        ),
        Text("이 카테고리에 작업이 없습니다."),
        Text("+를 클릭하여 작업을 만듭니다."),
      ],
    );
  }
}
