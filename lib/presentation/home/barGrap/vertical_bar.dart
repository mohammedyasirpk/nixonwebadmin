

// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// import 'bardata.dart';

// class MyGraph extends StatelessWidget {
//   const MyGraph({super.key, required this.weeklysummery});

//   final List weeklysummery;

//   @override
//   Widget build(BuildContext context) {
//     BarData barData = BarData(
//       sunAmount: weeklysummery[0],
//       monAmount: weeklysummery[1],
//       tuesdayAmount: weeklysummery[2],
//       wedAmount: weeklysummery[3],
//       theAmount: weeklysummery[4],
//       friAmount: weeklysummery[5],
//       satAmount: weeklysummery[6],
//     );

//     barData.initializeBarData();

//     return BarChart(BarChartData(
//       gridData: FlGridData(show: false),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color.fromARGB(255, 197, 187, 187)),
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         // rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
//         ),
//       ),
//       maxX: 10, // Set the maximum value on X-axis
//       minX: 0,  // Set the minimum value on X-axis
//       barGroups: barData.bardata
//           .map((data) => BarChartGroupData(groupsSpace: 4, x: data.y.toDouble(), barRods: [
//                 BarChartRodData(
//                   y: data.x, // Use data.x as Y-axis value
//                   color: Colors.grey[500],
//                   borderRadius: BorderRadius.circular(4),
//                   backDrawRodData: BackgroundBarChartRodData(
//                     show: true,
//                     color: Colors.white,
//                   ),
//                   width: 20,
//                 )
//               ]))
//           .toList(),
//       titlesAlignment: MainAxisAlignment.spaceAround,
//       axisTitleData: FlAxisTitleData(
//         leftTitle: AxisTitle(showTitle: true),
//         bottomTitle: AxisTitle(
//           showTitle: true,
//           margin: 16,
//         ),
//       ),
//     ));
//   }

//   Widget getBottomTitles(double value) {
//     // You can customize the bottom titles as needed
//     return Text(
//       value.toStringAsFixed(0),
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: 12,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
