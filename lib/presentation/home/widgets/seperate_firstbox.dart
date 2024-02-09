import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixon/application/graphbloc/graphbloc_bloc.dart';

import 'package:nixon/constants/sizedbox.dart';

import 'package:nixon/domain/models/productmodel.dart';
import 'package:nixon/repostitory/dashboardrepo.dart';
import '../../../constants/colors.dart';
import '../../../domain/models/customermodel.dart';
import '../../home/widgets/progress_container.dart';

class SeperateFirstGraph extends StatefulWidget {
  const SeperateFirstGraph({
    super.key,
    required this.isProduction,
  });

  final bool isProduction;

  @override
  State<SeperateFirstGraph> createState() => _SeperateFirstGraphState();
}

class _SeperateFirstGraphState extends State<SeperateFirstGraph> {
  final ValueNotifier<String> selectedValuePopUp = ValueNotifier("Select");

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

  List<ProductModel> dealerNameList = [];
  List<ProductModel> productNameList = [];

  void getdealerNames() async {
    dealerNameList.clear();
    final listgetdealers =
        await DashBoardRepo.instance.getTopDealersWithCount();
    for (var item in listgetdealers) {
      final dealerModel = ProductModel(
          productName: item["name"],
          productCount: item["salesCount"],
          maxSoldCount: item["dealersTotalCount"],
          uid: item["dealerId"]);
      dealerNameList.add(dealerModel);
    }
  }

  void getProductNames() async {
    productNameList.clear();
    final listgetdealers = await DashBoardRepo.instance.getMostSoldProducts();
    for (var item in listgetdealers) {
      final dealerModel = ProductModel(
          productName: item["productType"],
          productCount: item["count"],
          maxSoldCount: item["mostSoldCount"],
          uid: item["docId"]);
      productNameList.add(dealerModel);
    }
  }

  @override
  void initState() {
    widget.isProduction ? getProductNames() : getdealerNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  BlocProvider.of<GraphblocBloc>(context).add(GetDealersNameAndCountForGraphDealer(name: ""));
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
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 5),
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
                              return List.generate(dealerNameList.length,
                                  (index) {
                                return PopupMenuItem<String>(
                                  value: dealerNameList[index].productName,
                                  child:
                                      Text(dealerNameList[index].productName),
                                  onTap: () {
                                    final selectedName =
                                        dealerNameList[index].uid;
                                    BlocProvider.of<GraphblocBloc>(context).add(
                                        GetDealersNameAndCountForGraphDealer(
                                            uid: selectedName ?? ""));
                                  },
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
                      child:  BlocBuilder<GraphblocBloc, GraphblocState>(
                        builder: (context, state) {
                          List<DealersModel> dealerModelListTest = [];
                          dealerModelListTest = state.dealersWithProductCount;
                          bool isSunday = DateTime.now().weekday == 7;
                          if (isSunday) {
                            dealerModelListTest.clear();
                            dealerModelListTest
                                .add(state.dealersWithProductCount[6]);
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                                state.dealersWithProductCount.length, (index) {
                              final dealerModelList = dealerModelListTest;
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
                          );
                        },
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
