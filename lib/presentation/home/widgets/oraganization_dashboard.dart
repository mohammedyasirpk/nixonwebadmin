import 'package:flutter/material.dart';

class OrganisationTile extends StatelessWidget {
  const OrganisationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width *
          0.03, // Set height as a percentage of screen width
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.person,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            "Me",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            // Add Expanded widget here
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 2,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.business,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Organisation"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
