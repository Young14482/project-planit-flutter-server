import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}

class ChartSection extends StatelessWidget {
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
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 8,
              interval: 2,
            ),
            title: ChartTitle(text: '일일 작업 완료'),
            series: <ChartSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                color: Colors.blue,
                animationDuration: 0, // 애니메이션 제거
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
