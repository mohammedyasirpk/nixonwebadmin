import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nixon/constants/sizedbox.dart';
import '../../../constants/colors.dart';
import '../../home/widgets/progress_container.dart';

class ShimmerFirstBoxContainer extends StatelessWidget {
   ShimmerFirstBoxContainer(
      {super.key,  });

  final List dealerModelList = [1,2,3,4,5];
  


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
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Title",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 5),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:
                            List.generate(dealerModelList.length, (index) {
                          
                          return const Column(
                            children: [
                              ProgressbarContainer(
                                date: "",
                                soldCount: 5,
                                maxcount: 5,
                              ),
                              sizedwidth,
                            ],
                          );
                        }),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
