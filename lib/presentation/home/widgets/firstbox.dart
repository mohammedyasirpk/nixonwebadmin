import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nixon/constants/sizedbox.dart';
import 'package:nixon/domain/models/customermodel.dart';
import '../../../constants/colors.dart';
import 'progress_container.dart';

class FirstBoxConatiner extends StatefulWidget {
  const FirstBoxConatiner(
      {super.key, required this.dealerModelList, required this.title});

  final List<DealersModel> dealerModelList;
  final String title;

  @override
  State<FirstBoxConatiner> createState() => _FirstBoxConatinerState();
}

class _FirstBoxConatinerState extends State<FirstBoxConatiner> {


  
  String _getDateByIndex(int index) {
    List<String> daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    int currentDayOfWeek =
        DateTime.now().weekday == 7 ? 0 : DateTime.now().weekday;

    if (index >= 0 && index < daysOfWeek.length) {
      if (index == currentDayOfWeek) {
        return '${daysOfWeek[index]}*';
      } else {
        return daysOfWeek[index];
      }
    } else {
      return '';
    }
  }

  List<DealersModel> dealerModelListTest = [];

  void createNewSundayList() {
  
    bool isSunday = DateTime.now().weekday == 7;

    if (isSunday) {
      dealerModelListTest.clear();
      dealerModelListTest.add(widget.dealerModelList[6]);
    
    }
  }

  @override
  void initState() {
    dealerModelListTest = widget.dealerModelList;
    createNewSundayList();
    super.initState();
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
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,
                    style: const TextStyle(
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
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:
                            List.generate(dealerModelListTest.length, (index) {
                          final dealer = dealerModelListTest[index];
                          final date = _getDateByIndex(index);
                          return Column(
                            children: [
                              ProgressbarContainer(
                                date: date,
                                soldCount: dealer.productCount,
                                maxcount: dealer.maxProducCount,
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
