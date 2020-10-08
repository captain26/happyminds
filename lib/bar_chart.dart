import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedStackedWeightPatternBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedStackedWeightPatternBarChart(this.seriesList, {this.animate});

  factory GroupedStackedWeightPatternBarChart.withSampleData() {
    return new GroupedStackedWeightPatternBarChart(
      createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Card(
        elevation: 5.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 300,
                width: 200,
                child: Expanded(
                  child: charts.BarChart(
                    seriesList,
                    animate: animate,
                    barGroupingType: charts.BarGroupingType.groupedStacked,
                    vertical: true,
                    // Configure the bar renderer in grouped stacked rendering mode with a
                    // custom weight pattern.
                    //
                    // The first stack of bars in each group is configured to be twice as wide
                    // as the second stack of bars in each group.
                    defaultRenderer: new charts.BarRendererConfig(
                      groupingType: charts.BarGroupingType.groupedStacked ,
                      cornerStrategy: const charts.ConstCornerStrategy(30),

                    ),
                    domainAxis: charts.OrdinalAxisSpec(
                      renderSpec: charts.NoneRenderSpec(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final desktopSalesDataA = [
      new OrdinalSales('2014', 5,Color(0xff072ac8)),
      new OrdinalSales('2015', 25,Color(0xff072ac8)),
      new OrdinalSales('2016', 100,Color(0xff072ac8)),
      new OrdinalSales('2017', 75,Color(0xff072ac8)),
      new OrdinalSales('2018', 25,Color(0xff072ac8)),
      new OrdinalSales('2019', 50,Color(0xff072ac8)),
      new OrdinalSales('2020', 10,Color(0xff072ac8)),
      new OrdinalSales('2021', 20,Color(0xff072ac8)),

    ];

    final tableSalesDataA = [
      new OrdinalSales('2014', 25,Color(0xffFFC600)),
      new OrdinalSales('2015', 50,Color(0xffFFC600)),
      new OrdinalSales('2016', 10,Color(0xffFFC600)),
      new OrdinalSales('2017', 20,Color(0xffFFC600)),
      new OrdinalSales('2018', 5,Color(0xffFFC600)),
      new OrdinalSales('2019', 25,Color(0xffFFC600)),
      new OrdinalSales('2020', 100,Color(0xffFFC600)),
      new OrdinalSales('2021', 75,Color(0xffFFC600)),

    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataA,
        colorFn: (OrdinalSales clickData, _) => clickData.color,


      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataA,
        colorFn: (OrdinalSales clickData, _) => clickData.color,

      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color color;

  OrdinalSales(this.year, this.sales ,Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
