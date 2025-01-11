import 'package:flutter/material.dart';
import 'package:planit/data/model/category.dart';

import 'todo_list_category_circle.dart';

class TodoListCategoryLine extends StatelessWidget {
  final List<Category>? categories;

  TodoListCategoryLine({this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories?.length ?? 0,
        itemBuilder: (context, index) {
          return Center(
            child: TodoListCategoryCircle(
              title: categories?[index].name ?? "",
              position: index,
            ),
          );
        },
      ),
    );
  }
}
