import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_list.dart';

class CompleteBody extends StatelessWidget {
  const CompleteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // TODO 작업이 하나도 없을 때 보여주는 화면
        // 확장 패널
        CompleteList(),
      ],
    );;
  }
}
