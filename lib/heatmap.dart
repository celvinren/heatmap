library heatmap;

import 'package:flutter/material.dart';

class Heatmap extends StatefulWidget {
  final List<List<List<int>>> data;
  final Color startColorRGBO;
  final Color endColorRGBO;
  final int colorRangeSteps;
  final List<String> xTitle;
  final List<String> yTitle;
  final Color titleTextColor;
  final double min;
  final double max;
  Heatmap({
    @required this.data,
    this.startColorRGBO,
    this.endColorRGBO,
    this.colorRangeSteps,
    @required this.xTitle,
    @required this.yTitle,
    this.titleTextColor,
    @required this.min,
    @required this.max,
  });
  @override
  _HeatmapState createState() => _HeatmapState();
}

class _HeatmapState extends State<Heatmap> {
  Color rowColor1 = Color.fromRGBO(174, 174, 174, 1);
  Color rowColor2 = Color.fromRGBO(186, 186, 186, 1);
  Color oddRow;

  List<Color> colorList = [];
  // List<double> range = [];

  // void generateRange() {
  //   for (int i = 0; i < widget.colorRangeSteps; i++) {
  //     range.add((widget.max - widget.min)*i/widget.colorRangeSteps);
  //   }
  // }

  void generateColorList() {
    colorList.add(widget.startColorRGBO);
    for (int i = 1; i < widget.colorRangeSteps; i++) {
      int red = (widget.startColorRGBO.red +
              (widget.endColorRGBO.red - widget.startColorRGBO.red) *
                  i /
                  (widget.colorRangeSteps - 1))
          .round();
      int green = (widget.startColorRGBO.green +
              (widget.endColorRGBO.green - widget.startColorRGBO.green) *
                  i /
                  (widget.colorRangeSteps - 1))
          .round();
      int blue = (widget.startColorRGBO.blue +
              (widget.endColorRGBO.blue - widget.startColorRGBO.blue) *
                  i /
                  (widget.colorRangeSteps - 1))
          .round();
      colorList.add(Color.fromRGBO(red, green, blue, 1));
    }
  }

  List<Row> generateRowList() {
    List<Row> rowList = [];
    for (int i = 0; i < widget.data.length; i++) {
      List<Container> containerList = [];
      for (int j = 0; j < widget.data[i].length; j++) {
        Color rowEmptyColor;
        if (widget.data[i][j][0] == 0) {
          if (i % 2 == 0 && j % 2 == 0) {
            rowEmptyColor = rowColor1;
          } else if (i % 2 == 1 && j % 2 == 1) {
            rowEmptyColor = rowColor1;
          } else {
            rowEmptyColor = rowColor2;
          }
        }

        containerList.add(
          Container(
            decoration: BoxDecoration(
              color: widget.data[i][j][0] == 0
                  ? rowEmptyColor
                  : widget.data[i][j][0] >= 10
                      ? colorList[colorList.length - 1]
                      : colorList[widget.data[i][j][0] - 1],
            ),
            height: MediaQuery.of(context).size.height *
                0.9 /
                (widget.data.length + 3),
            width:
                MediaQuery.of(context).size.width / (widget.data[i].length + 2),
            child: Center(
              child: widget.data[i][j][0] != 0
                  ? Text(widget.data[i][j][0].toString())
                  : Container(),
            ),
          ),
        );
      }
      containerList.insert(
        0,
        Container(
          height: MediaQuery.of(context).size.height *
              0.9 /
              (widget.data.length + 3),
          width:
              MediaQuery.of(context).size.width / (widget.data[i].length + 2),
          child: Center(
            child: Text(
              widget.xTitle[i],
              style: TextStyle(color: widget.titleTextColor),
            ),
          ),
        ),
      );
      Row row = Row(
        children: containerList,
      );
      rowList.add(row);
    }

    ////////////////
    List<Container> yTitleContainers = [];
    yTitleContainers.add(Container(
      height:
          MediaQuery.of(context).size.height * 0.9 / (widget.data.length + 3),
      width: MediaQuery.of(context).size.width / (widget.data[0].length + 2),
    ));
    for (int i = 0; i < widget.yTitle.length; i++) {
      yTitleContainers.add(
        Container(
          height: MediaQuery.of(context).size.height *
              0.9 /
              (widget.data.length + 3),
          width:
              MediaQuery.of(context).size.width / (widget.data[0].length + 2),
          child: Center(
            child: Text(
              widget.yTitle[i],
              style: TextStyle(color: widget.titleTextColor),
            ),
          ),
        ),
      );
    }
    Row yTitle = Row(
      children: yTitleContainers,
    );
    rowList.add(yTitle);

    /////////////////////
    rowList.add(generateColorBar());
    return rowList;
  }

  Row generateColorBar() {
    List<Container> containerList = [];
    for (int i = 0; i < colorList.length - 1; i++) {
      containerList.add(
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [colorList[i], colorList[i + 1]],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
          height: 10,
          width: MediaQuery.of(context).size.width / (colorList.length + 2),
        ),
      );
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: containerList);
  }

  @override
  void initState() {
    super.initState();
    generateColorList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: generateRowList(),
    );
  }
}
