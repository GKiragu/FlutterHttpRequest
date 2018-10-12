import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fcharts/fcharts.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFF009688);
    const colorAccent = const Color(0xFF2fff00);

    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          primaryColor: PrimaryColor,
          accentColor: colorAccent,
        ),

        home: DefaultTabController(length: 4, child: Scaffold(
            appBar: AppBar(bottom: TabBar(
              tabs:
              [Tab(text: 'Temperature',),
              Tab(text: 'Humidity',),
              Tab(text: 'Soil Moisture'),
              Tab(text: 'Door'),
              ],),
              title: Text('Magana Flowers'),
            ),
            body: Center(
              child: TabBarView(
                  children:
                  [FChartsExampleApp(),
                  Text('Tab Test 2', textAlign: TextAlign.center,),
                  Text('Tab Text 3', textAlign: TextAlign.center,),
                  Text('Tab Text 4', textAlign: TextAlign.center,)

                  ]),
            )),
        )
    );
  }
}



class SimpleLineChart extends StatelessWidget {
  // X value -> Y value
  static const myData = [
    ["A", "✔"],
    ["B", "❓"],
    ["C", "✖"],
    ["D", "❓"],
    ["E", "✖"],
    ["F", "✖"],
    ["G", "✔"],
  ];

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 4 / 3,
      child: new LineChart(
        lines: [
          new Line<List<String>, String, String>(
            data: myData,
            xFn: (datum) => datum[0],
            yFn: (datum) => datum[1],
          ),
        ],
        chartPadding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 30.0),
      ),
    );
  }
}

class ChartExample {
  ChartExample(
      this.name,
      this.widget,
      this.description,
      );

  final String name;
  final Widget widget;
  final String description;
}

final chartsA = [
  new ChartExample(
    'Simple Line Chart',
    new SimpleLineChart(),
    'Strings on the X-Axis and their index in the list on the Y-Axis.',
  ),
];







class FChartsExampleApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<FChartsExampleApp> {
  var _chartIndex = 0;

  @override
  Widget build(BuildContext context) {
    final chart = chartsA[_chartIndex % chartsA.length];

    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: new Column(
            children: [
              new Padding(
                padding: new EdgeInsets.all(30.0),
                child: new Text(
                  chart.description,
                  textAlign: TextAlign.center,
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Container(
                    child: chart.widget,
                  )),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            setState(() => _chartIndex++);
          },
          child: new Icon(Icons.refresh),
        ),
      ),
    );
  }
}


