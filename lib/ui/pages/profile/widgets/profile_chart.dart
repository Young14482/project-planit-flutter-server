import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart {
  final String x;
  final double y;

  Chart(this.x, this.y);
}

class ProfileChart extends StatelessWidget {
  final List<Chart> chart = [
    Chart('월', 3),
    Chart('화', 5),
    Chart('수', 8),
    Chart('목', 2),
    Chart('금', 7),
    Chart('토', 4),
    Chart('일', 6),
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
              maximum: 8, // 최대값 걸기
              interval: 2,
            ),
            title: ChartTitle(text: '일일 작업 완료'),
            series: <ChartSeries>[
              ColumnSeries<Chart, String>(
                dataSource: chart,
                xValueMapper: (Chart data, _) => data.x,
                yValueMapper: (Chart data, _) => data.y,
                color: Colors.blue,
                animationDuration: 0,
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
