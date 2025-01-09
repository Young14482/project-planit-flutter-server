import 'package:flutter/material.dart';

class CustomAuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  CustomAuthAppbar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          '${title}',
          style: TextStyle(color: Colors.black),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
