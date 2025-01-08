import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 카테고리 관리 화면
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: Center(child: Text("홈페이지에 표시되는 카테고리")),
                  color: Colors.blue.shade200,
                ),
              ),
            ],
          ),
          // 동적으로 ListTile을 띄우기 위한 ListView.builder
          // shrinkWrap을 true로 설정하여 필요한 공간만 차지하게 함
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 25, // 데이터의 길이만큼 반복
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: Icon(
                      CupertinoIcons.circle_fill,
                      size: 12.0,
                      color: Colors.blueAccent,
                    ),
                    title: Text("asdasd${index}"), // 리스트 데이터 표시
                    trailing: SizedBox(
                      width: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("0"), // 예시 데이터
                          Icon(CupertinoIcons.ellipsis_vertical),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              // TODO: 카테고리 생성 다이얼로그 띄우기
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 50,
                ),
                Icon(CupertinoIcons.plus),
                SizedBox(width: 10),
                Text("새로 만들기"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
