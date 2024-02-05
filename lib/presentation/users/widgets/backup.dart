import 'package:flutter/material.dart';

import '../../home/widgets/progress_container.dart';

class AnalyzeContaianer extends StatelessWidget {
  const AnalyzeContaianer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37 / 2,
      height: MediaQuery.of(context).size.height * 0.5 / 2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Hours',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),

                // Small container
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 5),
                  // Set the height as needed
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Row(
                      children: [Icon(Icons.arrow_right), Text("00 %")],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressbarContainer(date: "Mon"),
                  ProgressbarContainer(date: "Tue"),
                  ProgressbarContainer(date: "Wed"),
                  ProgressbarContainer(date: "Thu"),
                  ProgressbarContainer(date: "Fri"),
                  ProgressbarContainer(date: "Sat"),
                  ProgressbarContainer(date: "Sun"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
