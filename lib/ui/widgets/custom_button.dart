import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final text;
  final onclick;

  CustomButton(this.text, this.onclick);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onclick,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300, 50),
        ),
      ),
    );
  }
}
