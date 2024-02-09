import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class ProgressbarContainer extends StatelessWidget {
  const ProgressbarContainer({
    Key? key,
    required this.date,
    required this.soldCount,
    required this.maxcount,
  }) : super(key: key);

  final String date;
  final int maxcount;
  final int soldCount;

  double calculateHeightValue(int soldCount, int maxcount) {
    if (maxcount == 0) {
      return 0.0; 
    }
    double totalHeight = 180;
    double divepoint = totalHeight / maxcount;

    return divepoint * soldCount;
  }

  @override
  Widget build(BuildContext context) {
    double height = calculateHeightValue(soldCount, maxcount);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2, left: 3),
          child: Container(
            decoration: BoxDecoration(
              color: primeryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 45,
            height: height.isNaN ? 0.0 : height, // Handle NaN case
          ),
        ),
        Text(date, style: GoogleFonts.poppins(color: Colors.grey)),
      ],
    );
  }
}
