import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nixon/domain/models/productmodel.dart';

import '../../../constants/colors.dart';
import 'secondprojectcontainer.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key, required this.productModelList, required this.title, });

  final List<ProductModel> productModelList;


  final String title ;

  int fuctionForCheckContainsKey(int index) {
    return productModelList.asMap().containsKey(index)
        ? productModelList[index].productCount
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
       
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 25, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(title,
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 20,
                ),
                // Small container
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 5),
                  // Set the height as needed
                  decoration: BoxDecoration(
                      color: primeryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                            color: graphTextWhiteColor,
                            size: 15,
                          ),
                          Text('0h  00',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: graphTextWhiteColor))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  productModelList.length > 3 ? 3 : productModelList.length,
                  (index) => SecondProgressContainer(
                    itemName: productModelList[index].productName,
                    soldCount: productModelList[index].productCount,
                    maxvalue: productModelList[index].maxSoldCount,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
