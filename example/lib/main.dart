import 'package:flutter/material.dart';
import 'package:heatmap/heatmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<List<int>>> dataList = [
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [1],
      [7],
      [6],
      [3],
      [2],
      [4],
      [1],
    ],
    [
      [5],
      [0],
      [0],
      [0],
      [1],
      [12],
      [4],
    ],
    [
      [9],
      [3],
      [5],
      [8],
      [8],
      [8],
      [1],
    ],
    [
      [1],
      [7],
      [6],
      [3],
      [2],
      [4],
      [1],
    ],
    [
      [5],
      [0],
      [2],
      [4],
      [1],
      [12],
      [4],
    ],
    [
      [9],
      [3],
      [5],
      [8],
      [2],
      [4],
      [1],
    ],
    [
      [1],
      [7],
      [6],
      [3],
      [2],
      [4],
      [1],
    ],
    [
      [5],
      [0],
      [2],
      [4],
      [1],
      [12],
      [4],
    ],
    [
      [9],
      [3],
      [5],
      [8],
      [2],
      [4],
      [1],
    ],
    [
      [1],
      [7],
      [6],
      [3],
      [2],
      [4],
      [1],
    ],
    [
      [5],
      [0],
      [2],
      [4],
      [1],
      [12],
      [4],
    ],
    [
      [9],
      [3],
      [5],
      [8],
      [2],
      [4],
      [1],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
    [
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
    ],
  ];
  List<String> xTitleList = [
    "12AM",
    "1AM",
    "2AM",
    "3AM",
    "4AM",
    "5AM",
    "6AM",
    "7AM",
    "8AM",
    "9AM",
    "10AM",
    "11AM",
    "12PM",
    "1PM",
    "2PM",
    "3PM",
    "4PM",
    "5PM",
    "6PM",
    "7PM",
    "8PM",
    "9PM",
    "10PM",
    "11PM"
  ];
  List<String> yTitleList = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(15.0),
                child: Heatmap(
                  data: dataList,
                  startColorRGBO: Color.fromRGBO(255, 252, 0, 1),
                  endColorRGBO: Color.fromRGBO(180, 0, 0, 1),
                  colorRangeSteps: 10,
                  xTitle: xTitleList,
                  yTitle: yTitleList,
                  titleTextColor: Colors.white,
                  max: 0,
                  min: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
