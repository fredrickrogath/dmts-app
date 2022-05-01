import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:card_swiper/card_swiper.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return Container();
    }

    return Padding(
      child: Text(text, style: _dateTextStyle),
      padding: const EdgeInsets.only(top: 4),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 12.0);
    return Text('${value + 0.5}', style: style);
  }

  static const _dateTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 80.0,
          backgroundColor: const Color(0xFF004B23),

          bottom: PreferredSize(
              child: Opacity(
                opacity: 0.9,
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(
                        child: Text('Weekly'),
                      ),
                      Tab(
                        child: Text('Monthly'),
                      ),
                      Tab(
                        child: Text('Monthly'),
                      ),
                      Tab(
                        child: Text('Yearly'),
                      ),
                    ]),
              ),
              preferredSize: const Size.fromHeight(30.0)),
        ),
        body: const TabBarView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: [
            Text('hello'),
            Text('hello'),
            Text('hello'),
            Text('hello'),
          ],
        ),
      ),
    );
  }
}

    
    //  Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: const Color(0xFF004B23),
    //   ),
    //   body: 
    //   Padding(
    //     padding: const EdgeInsets.only(top: 18.0),
    //     child: AspectRatio(
    //       aspectRatio: 2.0,
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 12, right: 24),
    //         child: LineChart(
    //           LineChartData(
    //             lineTouchData: LineTouchData(enabled: false),
    //             lineBarsData: [
    //               LineChartBarData(
    //                 spots: const [
    //                   FlSpot(0, 4),
    //                   FlSpot(1, 3.5),
    //                   FlSpot(2, 4.5),
    //                   FlSpot(3, 1),
    //                   FlSpot(4, 4),
    //                   FlSpot(5, 6),
    //                   FlSpot(6, 6.5),
    //                   FlSpot(7, 6),
    //                   FlSpot(8, 4),
    //                   FlSpot(9, 6),
    //                   FlSpot(10, 6),
    //                   FlSpot(11, 7),
    //                 ],
    //                 isCurved: true,
    //                 barWidth: 8,
    //                 color: Colors.purpleAccent,
    //                 belowBarData: BarAreaData(
    //                   show: true,
    //                   color: Colors.deepPurple.withOpacity(0.4),
    //                   cutOffY: cutOffYValue,
    //                   applyCutOffY: true,
    //                 ),
    //                 aboveBarData: BarAreaData(
    //                   show: true,
    //                   color: Colors.orange.withOpacity(0.6),
    //                   cutOffY: cutOffYValue,
    //                   applyCutOffY: true,
    //                 ),
    //                 dotData: FlDotData(
    //                   show: false,
    //                 ),
    //               ),
    //             ],
    //             minY: 0,
    //             titlesData: FlTitlesData(
    //               show: true,
    //               topTitles: AxisTitles(
    //                 sideTitles: SideTitles(showTitles: false),
    //               ),
    //               rightTitles: AxisTitles(
    //                 sideTitles: SideTitles(showTitles: false),
    //               ),
    //               bottomTitles: AxisTitles(
    //                 axisNameWidget: const Text(
    //                   '2022',
    //                   style: _dateTextStyle,
    //                 ),
    //                 sideTitles: SideTitles(
    //                   showTitles: true,
    //                   reservedSize: 18,
    //                   interval: 1,
    //                   getTitlesWidget: bottomTitleWidgets,
    //                 ),
    //               ),
    //               leftTitles: AxisTitles(
    //                 axisNameSize: 20,
    //                 axisNameWidget: const Padding(
    //                   padding: EdgeInsets.only(bottom: 8.0),
    //                   child: Text('Blood Pressure mmHg'),
    //                 ),
    //                 sideTitles: SideTitles(
    //                   showTitles: true,
    //                   interval: 1,
    //                   reservedSize: 40,
    //                   getTitlesWidget: leftTitleWidgets,
    //                 ),
    //               ),
    //             ),
    //             gridData: FlGridData(
    //               show: true,
    //               drawVerticalLine: false,
    //               horizontalInterval: 1,
    //               checkToShowHorizontalLine: (double value) {
    //                 return value == 1 || value == 6 || value == 4 || value == 5;
    //               },
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  // }
// }
