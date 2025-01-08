import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onClickBottomNavigation;

  CustomBottonNavigationbar({
    Key? key,
    required this.selectedIndex,
    required this.onClickBottomNavigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        // 위의 index: 랑 똑같이 설정해야 함
        onTap: (value) {
          // value가 현재 index
          onClickBottomNavigation(value);
        },
        // 바텀 네비게이션 바 설정
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(CupertinoIcons.bars),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(CupertinoIcons.doc_plaintext),
                  Text('과제',                   style: TextStyle(
                    color: selectedIndex == 1 ? Colors.blue : Colors.black,
                  ))
                ],
              ), label: ""),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(CupertinoIcons.doc_plaintext),
                  Text('캘린더',                   style: TextStyle(
                    color: selectedIndex == 2 ? Colors.blue : Colors.black,
                  ))
                ],
              ), label: ""),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(CupertinoIcons.doc_plaintext),
                  Text('내정보',                   style: TextStyle(
                    color: selectedIndex == 3 ? Colors.blue : Colors.black,
                  ))
                ],
              ), label: ""),
        ]);
  }
}
