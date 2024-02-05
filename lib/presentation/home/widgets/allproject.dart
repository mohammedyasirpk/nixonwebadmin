import 'package:flutter/material.dart';

class AllProjectContainer extends StatelessWidget {
  const AllProjectContainer({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37 / 2,
      height: MediaQuery.of(context).size.height * 0.5 / 2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Projects",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("No Activity",
                style: TextStyle(color: Colors.black, fontSize: 30)),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5)),
              width: 180,
              height: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(date,
                style: const TextStyle(color: Colors.grey, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
