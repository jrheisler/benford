import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample1 extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  final String textValue;
  final List<double> middleList;

  BarChartSample1(this.textValue, this.middleList);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xff81e5cd),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Benford Numbers are in BLACK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Your Numbers are in WHITE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  widget.textValue.isNotEmpty ?
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ): SizedBox.shrink(),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,

    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 50,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(18, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 30.1, barColor: Colors.black,isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, widget.middleList[0], isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 17.6, barColor: Colors.black,isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, widget.middleList[1], isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 12.5, barColor: Colors.black,isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, widget.middleList[2], isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 9.7, barColor: Colors.black,isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(7, widget.middleList[3], isTouched: i == touchedIndex);
          case 8:
            return makeGroupData(8, 7.9, barColor: Colors.black,isTouched: i == touchedIndex);
          case 9:
            return makeGroupData(9, widget.middleList[4], isTouched: i == touchedIndex);
          case 10:
            return makeGroupData(10, 6.7, barColor: Colors.black,isTouched: i == touchedIndex);
          case 11:
            return makeGroupData(11, widget.middleList[5], isTouched: i == touchedIndex);
          case 12:
            return makeGroupData(12, 5.8, barColor: Colors.black,isTouched: i == touchedIndex);
          case 13:
            return makeGroupData(13, widget.middleList[6], isTouched: i == touchedIndex);
          case 14:
            return makeGroupData(14, 5.1, barColor: Colors.black,isTouched: i == touchedIndex);
          case 15:
            return makeGroupData(15, widget.middleList[7], isTouched: i == touchedIndex);
          case 16:
            return makeGroupData(16, 4.6, barColor: Colors.black,isTouched: i == touchedIndex);
          case 17:
            return makeGroupData(17, widget.middleList[8], isTouched: i == touchedIndex);

          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String benNumber;
              switch (group.x.toInt()) {
                case 0:
                  benNumber = 'Benford 1';
                  break;
                case 1:
                  benNumber = '1';
                  break;
                case 2:
                  benNumber = 'Benford 2';
                  break;
                case 3:
                  benNumber = '2';
                  break;
                case 4:
                  benNumber = 'Benford 3';
                  break;
                case 5:
                  benNumber = '3';
                  break;
                case 6:
                  benNumber = 'Benford 4';
                  break;
                case 7:
                  benNumber = '4';
                  break;
                case 8:
                  benNumber = 'Benford 5';
                  break;
                case 9:
                  benNumber = '5';
                  break;
                case 10:
                  benNumber = 'Benford 6';
                  break;
                case 11:
                  benNumber = '6';
                  break;
                case 12:
                  benNumber = 'Benford 7';
                  break;
                case 13:
                  benNumber = '7';
                  break;
                case 14:
                  benNumber = 'Benford 8';
                  break;
                case 15:
                  benNumber = '8';
                  break;
                case 16:
                  benNumber = 'Benford 9';
                  break;
                case 17:
                  benNumber = '9';
                  break;
              }
              return BarTooltipItem(benNumber + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'B 1';
              case 1:
                return '1';
              case 2:
                return 'B 2';
              case 3:
                return '2';
              case 4:
                return 'B 3';
              case 5:
                return '3';
              case 6:
                return 'B 4';
              case 7:
                return '4';
              case 8:
                return 'B 5';
              case 9:
                return '5';
              case 10:
                return 'B 6';
              case 11:
                return '6';
              case 12:
                return 'B 7';
              case 13:
                return '7';
              case 14:
                return 'B 8';
              case 15:
                return '8';
              case 16:
                return 'B 9';
              case 17:
                return '9';
              default:
                return '';
            }
          },
        ),



        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(color: Colors.white, fontSize: 10),
          rotateAngle: 45,
          getTitles: (double value) {
            if (value == 0) {
              return '0';
            }
            return '${value.toInt()}%';
          },
          interval: 5,
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }




}
