import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// 차트 데이터 클래스
class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}

class ProfilePage extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('월', 3),
    ChartData('화', 5),
    ChartData('수', 8),
    ChartData('목', 2),
    ChartData('금', 7),
    ChartData('토', 4),
    ChartData('일', 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 화면 여백 추가
        child: ListView(
          children: [
            // 첫번째 -사용자 정보
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user1234 | user1234@example.com",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "1일 동안 계획을 지켰습니다!!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // 두번째 -작업 개요
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "작업 개요",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 완료된 작업
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Color(0xfff9ffff),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "완료된 작업",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 완료되지 않은 작업
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Color(0xfff9ffff),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "완료되지 않은 작업",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // 세번째 -그래프
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(), // x축 카테고리 설정
                    primaryYAxis: NumericAxis(
                      minimum: 0, // y축 최소값
                      maximum: 8, // y축 최대값
                      interval: 2, // y축 간격
                      // title: AxisTitle(text: 'y축 제목'),
                    ),
                    title: ChartTitle(text: '일일 작업 완료'), // 그래프 제목
                    series: <ChartSeries>[
                      ColumnSeries<ChartData, String>(
                        dataSource: chartData,
                        // 그래프 데이터 연결
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 16),
            // 네번째 - 그리드
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 제목 왼쪽 정렬
                children: [
                  // 제목
                  Text(
                    "이번달 달성 현황",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7, // 한 줄에 7개
                      crossAxisSpacing: 4.0, // 열 간격
                      mainAxisSpacing: 4.0, // 행 간격
                    ),
                    itemCount: 31,
                    // 총 날짜 수
                    itemBuilder: (context, index) {
                      final day = index + 1; // 1일부터 시작하는 날짜
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: day <= 20
                              ? Colors.blue // 1~20일은 파란색 배경
                              : Colors.grey, // 나머지 날짜는 회색 배경
                          borderRadius:
                          BorderRadius.circular(8.0), // 박스 모서리 둥글게
                        ),
                        child: Text(
                          "$day", // 날짜 텍스트
                          style: TextStyle(
                            color: day <= 20
                                ? Colors.white // 1~20일 텍스트 색상
                                : Colors.black, // 나머지 날짜 텍스트 색상
                            fontWeight: FontWeight.bold, // 텍스트 굵게
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // 그리드 -퍼센트, 완료 개수
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: Colors.blue, size: 30),
                    Text(
                      "88%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.blue, size: 30),
                    Text(
                      "22",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}