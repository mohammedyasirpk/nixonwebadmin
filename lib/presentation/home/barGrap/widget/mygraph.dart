import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nixon/domain/models/customermodel.dart';
import 'package:nixon/presentation/home/barGrap/bardata.dart';

// ignore: must_be_immutable
class MyGraph extends StatelessWidget {
  const MyGraph(
      {super.key, required this.weeklysummery, required this.productGraph});

  final List<DealersModel> weeklysummery;
  final bool productGraph;

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunAmount: weeklysummery.asMap().containsKey(0)
          ? weeklysummery[0].productCount
          : 0,
      monAmount: weeklysummery.asMap().containsKey(1)
          ? weeklysummery[1].productCount
          : 0,
      tuesdayAmount: weeklysummery.asMap().containsKey(2)
          ? weeklysummery[2].productCount
          : 0,
      wedAmount: weeklysummery.asMap().containsKey(3)
          ? weeklysummery[3].productCount
          : 0,
      theAmount: weeklysummery.asMap().containsKey(4)
          ? weeklysummery[4].productCount
          : 0,
      friAmount: weeklysummery.asMap().containsKey(5)
          ? weeklysummery[5].productCount
          : 0,
      satAmount: weeklysummery.asMap().containsKey(6)
          ? weeklysummery[6].productCount
          : 0,
    );

    barData.initializeBarData();

    return BarChart(BarChartData(
      alignment: BarChartAlignment.spaceAround,
      
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          
            show: true,
            border:
                Border.all(color: const Color.fromARGB(255, 197, 187, 187))),
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            // rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(

                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottomTitles))),
        maxY: 10,
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
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = fnForText("S", 0);
        break;
      case 2:
        text = fnForText("M", 1);
        break;
      case 3:
        text = fnForText("T", 2);
        break;
      case 4:
        text = fnForText("W", 3);
        break;
      case 5:
        text = fnForText("T", 4);
        break;
      case 6:
        text = fnForText("F", 5);
        break;
      case 7:
        text = fnForText("S", 6);
        break;
      default:
        text = fnForText("S", 7);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget fnForText(String day, int index) {
    return Text(
      productGraph == false
          ? (weeklysummery.asMap().containsKey(index)
              ? weeklysummery[index].customername.toString()
              : "")
          : day,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
