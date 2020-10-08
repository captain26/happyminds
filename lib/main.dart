import 'package:discover_therapist/bar_chart.dart';
import 'package:discover_therapist/screen/homepage.dart';
import 'package:discover_therapist/pie_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupedStackedWeightPatternBarChart.withSampleData()
    );
  }
}
