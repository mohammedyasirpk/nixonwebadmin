import 'package:flutter/material.dart';

class FirstBox extends StatelessWidget {
  const FirstBox({
    Key? key,
    required this.mainTitle,
    required this.imageString,
    required this.product,
  }) : super(key: key);

  final String mainTitle;
  final String imageString;
  final List<Map<String, dynamic>> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 8),
              Image.asset('lib/images/trophyy.png'),
              const SizedBox(width: 8),
              Text(
                mainTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff00A693),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Display each product and its count
          ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              String productName = product[index]['productType'] ?? "no data";
              int productCount = product[index]['count'] ?? "no value";

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Count: $productCount',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
