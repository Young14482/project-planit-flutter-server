import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/detail/widgets/todo_detail_body.dart';

import '../../../widgets/dialogs/custom_dialog.dart';

class TodoDetailPage extends StatelessWidget {
  TodoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _showAlertDialog(
                    context, "작업을 삭제하시겠습니까?", "한번 삭제되면 복구할 수 없습니다.", "삭제");
              },
              icon: Icon(CupertinoIcons.delete))
        ],
      ),
      body: TodoDetailBody(),
    );
  }

  void _showAlertDialog(
      BuildContext context, String main, String sub, String confirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        main: main,
        sub: sub,
        confirm: confirm,
      ),
    );
  }
}
