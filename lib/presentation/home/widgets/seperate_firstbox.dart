import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixon/application/graphbloc/graphbloc_bloc.dart';

import 'package:nixon/constants/sizedbox.dart';
import 'package:nixon/domain/models/customermodel.dart';
import 'package:nixon/domain/models/productmodel.dart';
import '../../../constants/colors.dart';
import '../../home/widgets/progress_container.dart';

class SeperateFirstGraph extends StatelessWidget {
  SeperateFirstGraph({
    super.key,
    required this.dealerModelList, required this.dealerNameList,
  });

  final List<DealersModel> dealerModelList;
  final List<ProductModel> dealerNameList;
 
  final ValueNotifier<String> selectedValuePopUp = ValueNotifier("user");

  String _getDateByIndex(int index) {
    List<String> daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    if (index >= 0 && index < daysOfWeek.length) {
      return daysOfWeek[index];
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
             BlocProvider.of<GraphblocBloc>(context).add(GetDealersNameAndCountForGraphDealer(name: ""));
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
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                          PopupMenuButton<String>(
                            child: Row(
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: selectedValuePopUp,
                                  builder: (context, value, child) => Text(
                                    selectedValuePopUp.value,
                                    style: const TextStyle(
                                        color: graphTextWhiteColor),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: graphTextWhiteColor,
                                )
                              ],
                            ),
                            itemBuilder: (context) {
                              return List.generate(dealerModelList.length,
                                  (index) {
                                return PopupMenuItem<String>(
                                  value: dealerNameList[index].productName,
                                  child: Text(
                                    dealerNameList[index].productName),
                                  onTap: () {
                                    final selectedName = dealerNameList[index].productName ;
                                    BlocProvider.of<GraphblocBloc>(context).add(GetDealersNameAndCountForGraphDealer(name: selectedName));
                                  }
                                  ,
                                );
                              });
                            },
                            onSelected: (value) {
                              
                              selectedValuePopUp.value = value;
                            },
                          ),
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
                            List.generate(dealerModelList.length, (index) {
                          final dealer = dealerModelList[index];
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
