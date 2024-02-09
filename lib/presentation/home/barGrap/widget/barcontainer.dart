import 'package:flutter/material.dart';

import '../../../../domain/models/customermodel.dart';
import 'persentage.dart';

class BarContainer extends StatelessWidget {
  const BarContainer({super.key, required this.dealerModel});

  final List<DealersModel> dealerModel;

  int fuctionForCheckContainsKey(int index) {
    return dealerModel.asMap().containsKey(index)
        ? dealerModel[index].productCount
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: const Color.fromARGB(255, 197, 187, 187))),
        child: Column(
          children: [
            PercentageContainer(soldCount: fuctionForCheckContainsKey(0)),
            PercentageContainer(soldCount: fuctionForCheckContainsKey(1)),
            PercentageContainer(soldCount: fuctionForCheckContainsKey(2)),
            PercentageContainer(soldCount: fuctionForCheckContainsKey(3)),
            PercentageContainer(soldCount: fuctionForCheckContainsKey(4)),
          ],
        ),
      ),
    );
  }
}
