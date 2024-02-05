import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nixon/presentation/home/barGrap/bardata.dart';

// ignore: must_be_immutable
class MyGraph extends StatelessWidget {
  const MyGraph({super.key, required this.weeklysummery});

  final List weeklysummery;

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunAmount: weeklysummery[0],
      monAmount: weeklysummery[1],
      tuesdayAmount: weeklysummery[2],
      wedAmount: weeklysummery[3],
      theAmount: weeklysummery[4],
      friAmount: weeklysummery[5],
      satAmount: weeklysummery[6],
    );

    barData.initializeBarData();

    return BarChart(BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
            show: true,
            border:
                Border.all(color: const Color.fromARGB(255, 197, 187, 187))),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget: getBottomTitles))
        ),
        maxY: 200,
        minY: 0,
        barGroups: barData.bardata
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y.toDouble(),
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        color: Colors.white,
                      ),
                      width: 20)
                ]))
            .toList()));
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black);

    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text(
          "S",
          style: style,
        );
        break;
      case 2:
        text = const Text(
          "M",
          style: style,
        );
        break;
      case 3:
        text = const Text(
          "T",
          style: style,
        );
        break;
      case 4:
        text = const Text(
          "W",
          style: style,
        );
        break;
      case 5:
        text = const Text(
          "T",
          style: style,
        );
        break;
      case 6:
        text = const Text(
          "F",
          style: style,
        );
        break;
      case 7:
        text = const Text(
          "S",
          style: style,
        );
        break;
        default :
        text = const Text(
          "S",
          style: style,
        );
        break;
      
        
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
}
