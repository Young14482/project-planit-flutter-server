import 'package:flutter/material.dart';
import 'package:planit/ui/pages/todo/complete/widgets/complete_body.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteBody(),
    );
    ;
  }
}
