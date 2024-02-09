import 'package:flutter/material.dart';
import 'package:nixon/domain/models/customermodel.dart';
import 'package:nixon/domain/models/productmodel.dart';
import 'package:nixon/presentation/home/widgets/firstbox.dart';
import 'package:nixon/presentation/home/widgets/oraganization_dashboard.dart';
import 'package:nixon/presentation/home/widgets/secondbox.dart';
import 'package:nixon/presentation/shimmer/widgets/shimmerFirstBox.dart';
import 'package:nixon/presentation/shimmer/widgets/shimmerSecondContainer.dart';
import 'package:nixon/repostitory/dashboardrepo.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/date_dashboard.dart';
import '../widgets/seperate_firstbox.dart';

class MyDashBoard extends StatelessWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    OrganisationTile()
                  ],
                ),
                DashBoardDate()
              ],
            ),
            const Text('Production',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                FutureBuilder(
                  future: DashBoardRepo.instance.getProductCountForWeek(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ShimmerFirstBoxContainer());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No users found.'));
                    } else {
                      final product = snapshot.data ?? [];
                      List<DealersModel> dealermodelList = [];
                      int maxvalue = product.reduce((value, element) =>
                          value > element ? value : element);
                      for (var produc in product) {
                        final dealerModel = DealersModel(
                            productCount: produc, maxProducCount: maxvalue);
                        dealermodelList.add(dealerModel);
                      }
                      return FirstBoxConatiner(
                        dealerModelList: dealermodelList,
                        title: "Last Week Products",
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                FutureBuilder(
                  future: DashBoardRepo.instance.getMostSoldProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ShimmerSecondContainer());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No users found.'));
                    } else {
                      final product = snapshot.data ?? [];
                      List<ProductModel> customerModelList = [];
                      for (var produc in product) {
                        final model = ProductModel(
                            productName: produc["productType"],
                            productCount: produc["count"],
                            maxSoldCount: produc["mostSoldCount"]);

                        customerModelList.add(model);
                      }
                      return SecondContainer(
                        productModelList: customerModelList,
                        title: "Best Products",
                      );
                    }
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
              const Row(
              children: [SeperateFirstGraph(isProduction: true,)],
              
            ),
               const SizedBox(
              height: 30,
            ),
            const Text('Dealer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FutureBuilder(
                  future: DashBoardRepo.instance.getDealersSoldCountPerWeek(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ShimmerFirstBoxContainer());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No users found.'));
                    } else {
                      final product = snapshot.data ?? [];
                      List<DealersModel> dealermodelList = [];
                      int maxvalue = product.reduce((value, element) =>
                          value > element ? value : element);
                      for (var produc in product) {
                        final dealerModel = DealersModel(
                            productCount: produc, maxProducCount: maxvalue);
                        dealermodelList.add(dealerModel);
                      }
                      return FirstBoxConatiner(
                        dealerModelList: dealermodelList,
                        title: "Last Week Dealer",
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                FutureBuilder(
                  future: DashBoardRepo.instance.getTopDealersWithCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ShimmerSecondContainer());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No users found.'));
                    } else {
                      final product = snapshot.data ?? [];
                      List<ProductModel> customerModelList = [];
                      for (var item in product) {
                        final dealerModel = ProductModel(
                            productName: item["name"],
                            productCount: item["salesCount"],
                            maxSoldCount: item["dealersTotalCount"]);

                        customerModelList.add(dealerModel);
                      }
                      return SecondContainer(
                        productModelList: customerModelList,
                        title: "Best Dealer",
                      );
                    }
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [SeperateFirstGraph(  isProduction: false,)],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Service',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FutureBuilder(
                  future: DashBoardRepo.instance.getDealersSoldCountPerWeek(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ShimmerFirstBoxContainer());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No users found.'));
                    } else {
                      final product = snapshot.data ?? [];
                      List<DealersModel> dealermodelList = [];
                      int maxvalue = product.reduce((value, element) =>
                          value > element ? value : element);
                      for (var produc in product) {
                        final dealerModel = DealersModel(
                            productCount: produc, maxProducCount: maxvalue);
                        dealermodelList.add(dealerModel);
                      }
                      return FirstBoxConatiner(
                        dealerModelList: dealermodelList,
                        title: "Last Week Service",
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                FutureBuilder(
                  future: DashBoardRepo.instance.getTopDealersWithCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ShimmerSecondContainer());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No users found.'));
                    } else {
                      final product = snapshot.data ?? [];
                      List<ProductModel> customerModelList = [];
                      for (var item in product) {
                        final dealerModel = ProductModel(
                            productName: item["name"],
                            productCount: item["salesCount"],
                            maxSoldCount: item["dealersTotalCount"]);

                        customerModelList.add(dealerModel);
                      }
                      return SecondContainer(
                        productModelList: customerModelList,
                        title: "Best Service",
                      );
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
