import 'package:flutter/material.dart';
import 'package:planit/ui/pages/main/widgets/main_body.dart';
import 'package:planit/ui/widgets/custom_drawer.dart';

import '../../widgets/custom_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 상태
  int selectedIndex = 1;
  final GlobalKey<ScaffoldState> _forSideScaffoldKey =
      GlobalKey<ScaffoldState>();

  // 행위, onTap보다 여기에 적는 것을 추천
  void onClickBottomNavigation(int value) {
    if (value == 0) {
      _forSideScaffoldKey.currentState?.openDrawer();
    } else {
      selectedIndex = value;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _forSideScaffoldKey,
      // 왼쪽에서 나오는 드로어 설정
      drawer: CustomDrawer(),
      body: MainBody(selectedIndex: selectedIndex),
      bottomNavigationBar: CustomBottonNavigationbar(
          selectedIndex: selectedIndex,
          onClickBottomNavigation: onClickBottomNavigation),
    );
  }
}
