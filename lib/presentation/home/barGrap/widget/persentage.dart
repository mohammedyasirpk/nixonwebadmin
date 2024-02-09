import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PercentageContainer extends StatelessWidget {
   PercentageContainer({Key? key, required this.soldCount})
      : super(key: key);

  final int soldCount;
  int totalSoldCount = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 20.0,
      child: Row(
        children: [
         
          Expanded(
            flex: (((soldCount / totalSoldCount * 10) == 0)
                    ? (soldCount / totalSoldCount * 10)
                    : (soldCount / totalSoldCount * 10) + 1)
                .toInt(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 5.0),
          
          Expanded(
            flex: (totalSoldCount - soldCount).toInt(),
            child: Text(
              soldCount.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
