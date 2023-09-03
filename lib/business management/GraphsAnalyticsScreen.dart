import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomGraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Adjust the height as needed
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: _createSampleData(),
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelMapper: (ChartData data, _) => data.category,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  List<ChartData> _createSampleData() {
    final data = [
      ChartData('Category A', 30),
      ChartData('Category B', 40),
      ChartData('Category C', 20),
      // Add more data points as needed
    ];

    return data;
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
