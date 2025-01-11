import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/ui/pages/todo/list/todo_list_vm.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body.dart';

class TodoListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoListVM vm = ref.read(TodoListProvider.notifier);
    return Scaffold(
      body: TodoListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.newTodo();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
      ),
    );
  }
}
