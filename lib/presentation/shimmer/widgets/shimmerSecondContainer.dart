import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nixon/domain/models/customermodel.dart';

import '../../../constants/colors.dart';
import '../../home/widgets/secondprojectcontainer.dart';

class ShimmerSecondContainer extends StatelessWidget {
   ShimmerSecondContainer({super.key,   });

  final List dealerModelList = [ 1,2,2,3,4,4,5];


  

 

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
                 Text("Title",
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
                  dealerModelList.length > 3 ? 3 : dealerModelList.length,
                  (index) => SecondProgressContainer(
                    itemName:"Product Name",
                    soldCount: 5,
                    maxvalue:5,
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
