import 'package:flutter/material.dart';
import 'package:planit/data/model/todo.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_body.dart';

class CompletePage extends StatelessWidget {
  final List<Todo>? list;

  CompletePage({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteBody(list: list),
    );
    ;
  }
}
