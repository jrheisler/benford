import 'dart:convert';
import 'package:flutter/material.dart';

import 'bar_chart_sample1.dart';

class GetBenford extends StatelessWidget {
  final String textValue;
  GetBenford(this.textValue);

  @override
  Widget build(BuildContext context) {
    return benfordContainer(textValue);
  }

  Widget benfordContainer(textValue) {
    List<double> middleList = [0,0,0,0,0,0,0,0,0];
    List<double> finalList = [30.1,17.6,12.5,9.7,7.9,6.7,5.8,5.1,4.6];

    LineSplitter ls = new LineSplitter();
    List<String> benStrings = ls.convert(textValue);
    int badDataCount = 0;

    benStrings.forEach((element) {
      if (element.isNotEmpty) {
        if (element[0] == '1') {
          middleList[0] = middleList[0] + 1;
        } else if (element[0] == '2') {
          middleList[1] = middleList[1] + 1;
        } else if (element[0] == '3') {
          middleList[2] = middleList[2] + 1;
        } else if (element[0] == '4') {
          middleList[3] = middleList[3] + 1;
        } else if (element[0] == '5') {
          middleList[4] = middleList[4] + 1;
        } else if (element[0] == '6') {
          middleList[5] = middleList[5] + 1;
        } else if (element[0] == '7') {
          middleList[6] = middleList[6] + 1;
        } else if (element[0] == '8') {
          middleList[7] = middleList[7] + 1;
        } else if (element[0] == '9') {
          middleList[8] = middleList[8] + 1;
        } else {
          badDataCount = badDataCount + 1;
        }
      }

    });

    int i = 0;
    middleList.forEach((element) {
      double finish = 0.0;
      finish = (element / (benStrings.length - badDataCount));
      finalList[i] = finish*100;
      i = i+1;
    });

    finalList.forEach((element) {print(element);});

    return Container(
      color: const Color(0xff232040),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: BarChartSample1(textValue, finalList),
        ),
      ),
    );



  }
}

