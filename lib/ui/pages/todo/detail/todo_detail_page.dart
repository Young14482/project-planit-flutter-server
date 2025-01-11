import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/ui/pages/todo/detail/todo_detail_vm.dart';
import 'package:planit/ui/pages/todo/detail/widgets/todo_detail_body.dart';

import '../../../widgets/dialogs/custom_dialog.dart';

class TodoDetailPage extends ConsumerWidget {
  final int todoId;

  TodoDetailPage(this.todoId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoDetailVM vm = ref.read(todoDetailProvider(todoId).notifier);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                    main: "작업을 삭제하시겠습니까?",
                    sub: "한번 삭제되면 복구할 수 없습니다.",
                    confirm: "삭제",
                  ),
                );
                if (result) {
                  vm.delete();
                }
              },
              icon: Icon(CupertinoIcons.delete))
        ],
      ),
      body: TodoDetailBody(todoId),
    );
  }
}
