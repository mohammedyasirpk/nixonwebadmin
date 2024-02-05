import 'package:flutter/material.dart';

class LastBox extends StatelessWidget {
  const LastBox({
    super.key,
    required this.mainTitle,
    required this.imageString,
  });
  final String mainTitle;
  final String imageString;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, 
          children: [
             Text(
                  mainTitle,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
        
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}
