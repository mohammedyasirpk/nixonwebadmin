import 'package:flutter/material.dart';

class ProgressbarContainer extends StatelessWidget {
  const ProgressbarContainer({super.key, required this.date});

  final String date;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2,left: 3),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
            width: 30,
            height: 60,
          ),
        ),
        Text(date)
      ],
    );
  }
}
