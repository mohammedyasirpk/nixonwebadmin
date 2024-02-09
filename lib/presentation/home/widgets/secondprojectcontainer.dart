import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

// ignore: must_be_immutable
class SecondProgressContainer extends StatelessWidget {
  SecondProgressContainer(
      {super.key, required this.itemName, required this.soldCount, required this.maxvalue});

  final String itemName;
  final int soldCount;
  final int maxvalue;



  double calculateWidthValue(int soldCountNumber,maxvalue) {
    double totalWidth = 500;
  double  divepoint = totalWidth/maxvalue;

return divepoint*soldCountNumber;
 
 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemName,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 2, left: 3),
          child: Container(
            decoration: BoxDecoration(
                color: primeryColor, borderRadius: BorderRadius.circular(10)),
            width: calculateWidthValue(soldCount,maxvalue),
            height: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
