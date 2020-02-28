/// REVISE WHEN FIRESTORE IS IMPLEMENTED

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//value object for x-axis and y-axis
class TestCompareStockData extends StatefulWidget {
  static const String id = 'compare stocks data';

  final String category;
  //final int color;
  final double entryAmount;

  TestCompareStockData(this.category, this.entryAmount);

  @override
  State createState() => _TestCompareStockData();
}

//Chart series to give sample data before Firebase is fixed
//and data can be retrieved from the database
//Chart series representation of data points
List<charts.Series<TestCompareStockData, String>> _createVisualizationData() {
  final data = [
    TestCompareStockData("entertainment", 45),
    TestCompareStockData("shopping", 80),
    TestCompareStockData("drinks", 8),
    TestCompareStockData("food", 30),
    TestCompareStockData("miscellaneous", 2.50),
  ];

//TestCompareStockData("entertainment", 0xFF91E63, 45),
//  TestCompareStockData("shopping", 0xFFFF9800, 80),
//  TestCompareStockData("drinks", 0xFF4CAF50, 8),
//  TestCompareStockData("food", 0xFF00BCD4, 30),
//  TestCompareStockData("miscellaneous", 0xFF9C27B0, 2.50),

  return [
    charts.Series<TestCompareStockData, String>(
        id: 'TestCompareStockData',
        //material cyan (0xFF00BCD4) for a color scheme
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (TestCompareStockData dataPoint,
                _) => // WHICH X AXIS VALUE DO WE USE?
            dataPoint.category,
        measureFn: (TestCompareStockData dataPoint,
                _) => // WHICH Y AXIS VALUE DO WE USE?
            dataPoint.entryAmount,
        data: data) // WHICH DATA DO WE USE?
  ];
}

class _TestCompareStockData extends State<TestCompareStockData> {
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('Compare Stock Data'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 250,
                child: charts.BarChart(
                  _createVisualizationData(),
                  animate: true,
                  behaviors: [
                    charts.ChartTitle('Entry Amount in Category'),
                    charts.ChartTitle('Amount',
                        behaviorPosition: charts.BehaviorPosition.start),
                    charts.ChartTitle('Category',
                        behaviorPosition: charts.BehaviorPosition.bottom)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

/*/// Example of a bar chart with grouped, stacked series oriented vertically with
/// a custom weight pattern.
///
/// This is a pattern of weights used to calculate the width of bars within a
/// bar group. If not specified, each bar in the group will have an equal width.
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedStackedWeightPatternBarChart extends StatelessWidget {
  static const String id = 'bar charts';

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
    return new charts.BarChart(
      seriesList,
      animate: animate,
      // Configure the bar renderer in grouped stacked rendering mode with a
      // custom weight pattern.
      //
      // The first stack of bars in each group is configured to be twice as wide
      // as the second stack of bars in each group.
      defaultRenderer: new charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.groupedStacked,
        weightPattern: [2, 1],
      ),
    );
  }

  /// Create series list with multiple series
  /// Once Firebase is working we WILL change this to retrieve the information
  /// the database. For now, this is just an example because I couldn't test it.
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final desktopSalesDataA = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesDataA = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesDataA = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    final desktopSalesDataB = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesDataB = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesDataB = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataA,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataA,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataA,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataB,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataB,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataB,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
*/
