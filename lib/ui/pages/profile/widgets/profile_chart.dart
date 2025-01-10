import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../profile_vm.dart';

class ProfileChart extends StatelessWidget {
  List<Chart> charts;

  ProfileChart(this.charts);

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
                dataSource: charts,
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
