import 'package:flutter/material.dart';

import '../../../repostitory/capitalise.dart';

class DashBoardDate extends StatelessWidget {
  const DashBoardDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Container(
                    height: MediaQuery.of(context).size.width *
                        0.03, // Set height as a percentage of screen width
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, top: 8),
                      child:  Text(getCurrentDate()),
                    ),
                  ),
                );
  }
}