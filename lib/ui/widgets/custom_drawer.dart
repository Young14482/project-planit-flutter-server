import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data/gvm/session_gvm.dart';
import 'package:planit/ui/widgets/dialogs/category_dialog.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // 범주 - 상태 관리
  bool _isCategory = false;

  // 범주 - 하위 카테고리
  List<String> _subCategory = ['카테고리 1', '카테고리 2', '카테고리 3'];

  // 범주 - 새로운 카테고리 입력 다이얼로그
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
    return Consumer(
      builder: (context, ref, child) {
        // sessionProvider를 통해 gvm 값을 가져옴
        SessionGVM gvm = ref.read(sessionProvider.notifier);

        return Container(
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              // 로고
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/planit.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Planit',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // 범주
              GestureDetector(
                onTap: () {
                  setState(() {
                    // 범주 클릭 시 토글 방식 적용
                    _isCategory = !_isCategory;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, left: 12),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.rectangle_grid_2x2_fill),
                      SizedBox(width: 8.0),
                      Text("범주"),
                      Icon(
                        _isCategory
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              // 범주 클릭 시 하위 카테고리 보이게
              if (_isCategory)
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 10),
                  child: Column(
                    children: _subCategory.map((category) {
                      return Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.circle_fill),
                            SizedBox(width: 8.0),
                            Text(category),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              // 새로 만들기
              Container(
                margin: EdgeInsets.only(top: 25.0, left: 12),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.plus),
                    SizedBox(width: 8.0),
                    InkWell(
                        onTap: () {
                          _showInputCategoryDialog(context);
                        },
                        child: Text("새로 만들기")),
                  ],
                ),
              ),
              // 비밀번호 변경
              Container(
                margin: EdgeInsets.only(top: 25.0, left: 12),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.gear),
                    SizedBox(width: 8.0),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/change-password");
                        },
                        child: Text("비밀번호 변경")),
                  ],
                ),
              ),
              // 로그아웃
              Container(
                margin: EdgeInsets.only(top: 25.0, left: 12),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.square_arrow_left),
                    SizedBox(width: 8.0),
                    InkWell(
                        onTap: () {
                          gvm.logout(); // gvm의 logout 메서드 호출
                        },
                        child: Text("로그아웃")),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
