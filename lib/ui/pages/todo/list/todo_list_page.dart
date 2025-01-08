import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/list/widgets/todo_list_body.dart';

import '../../../widgets/dialogs/category_dialog.dart';

class TodoListPage extends StatelessWidget {
  void _showInputCategoryDialog(BuildContext context) {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => CategoryDialog(
        categoryController: categoryController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputCategoryDialog(context);
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
