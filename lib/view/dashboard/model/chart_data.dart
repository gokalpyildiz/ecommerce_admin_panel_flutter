import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}

class ChartData1 {
  ChartData1(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}

// class ChartData2 {
//   ChartData2(this.x, this.y1, this.y2);

//   final double x;
//   final double y1;
//   final double y2;
// }
