import 'package:discover_therapist/data_view.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ClicksPerYear {
  final String mood;
  final int value;
  final charts.Color color;

  ClicksPerYear(this.mood,this.value, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('SAD', 25, Color(0xff63ADE6)),
      ClicksPerYear('HAPPY', 12, Color(0xffFF9200)),
      ClicksPerYear('ANGRY', 13, Color(0xffFF3636)),
      ClicksPerYear('CONFUSED', 20, Color(0xff9BD355)),
      ClicksPerYear('WOW', 40, Color(0xff8F2EDA)),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.mood,
        measureFn: (ClicksPerYear clickData, _) => clickData.value,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        seriesCategory: 'A',
        data: data,
      ),
    ];

    var chart = charts.PieChart(
      series,
      animate: false,
      
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(0.0),
      child: SizedBox(
        height: 220.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mood',
                      style: TextStyle(
                          color: Color(0xff072ac8),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      ' Chart',
                      style: TextStyle(
                          color: Color(0xffFFC600),
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DataView(
                          icon: 'moodicon/sad.svg',
                          percentage: 25,
                        ),
                        DataView(
                          icon: 'moodicon/happy.svg',
                          percentage: 12,
                        ),
                        DataView(
                          icon: 'moodicon/angry.svg',
                          percentage: 13,
                        ),
                        DataView(
                          icon: 'moodicon/confused.svg',
                          percentage: 20,
                        ),
                        DataView(
                          icon: 'moodicon/wow.svg',
                          percentage: 40,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: chartWidget,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
