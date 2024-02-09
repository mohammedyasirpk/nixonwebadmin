

import 'package:nixon/presentation/home/barGrap/individual.dart';

class BarData {
  final int sunAmount;
  final int monAmount;
  final int tuesdayAmount;
  final int wedAmount;
  final int theAmount;
  final int friAmount;
  final int satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tuesdayAmount,
    required this.wedAmount,
    required this.theAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<Individual> bardata = [];

  void initializeBarData() {
    bardata = [
      Individual(x: 1, y: sunAmount),
      Individual(x: 2, y: monAmount),
      Individual(x: 3, y: tuesdayAmount),
      Individual(x: 4, y: wedAmount),
      Individual(x: 5, y: theAmount),
      Individual(x: 6, y: friAmount),
      Individual(x: 7, y: satAmount),
    ];
  }
}
