// import 'package:flutter/material.dart';
// import 'package:nixon/domain/models/customermodel.dart';
// import 'package:nixon/domain/models/productmodel.dart';
// import 'package:nixon/presentation/home/widgets/analyticContainer1.dart';
// import 'package:nixon/presentation/home/widgets/oraganization_dashboard.dart';
// import 'package:nixon/presentation/users/widgets/firstboxdupee.dart';
// import 'package:nixon/presentation/users/widgets/secondboxdupe.dart';
// import 'package:nixon/repostitory/dashboardrepo.dart';

// import '../../presentation/home/widgets/allproject.dart';
// import '../../presentation/home/widgets/date_dashboard.dart';
// import '../../presentation/home/widgets/lastbox.dart';
// import '../../presentation/home/widgets/second_screen.dart';


// class MobileDashBord extends StatefulWidget {
//   const MobileDashBord({Key? key}) : super(key: key);

//   @override
//   State<MobileDashBord> createState() => _MyDashBoardState();
// }

// class _MyDashBoardState extends State<MobileDashBord> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//             const  Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Dashboard",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     OrganisationTile()
//                   ],
//                 ),
//                 DashBoardDate()
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Column(
//               children: [
//                 FutureBuilder(
//                   future: DashBoardRepo.instance.getMostSoldProducts(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (snapshot.hasError) {
//                       return const Center(child: Text('No users found.'));
//                     } else {
//                       final product = snapshot.data ?? [];
//                       List<ProductModel> productModelList = [];
//                       for (var produc in product) {
//                         // final model = ProductModel(
//                         //     productName: produc["productType"],
//                         //     productCount: produc["count"]);
//                         // productModelList.add(model);
//                       }
//                       return FirstBoxDupe(
//                           products: productModelList,
//                           mainTitle: " Top Products");
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 FutureBuilder(
//                   future: DashBoardRepo.instance.getTopDealers(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (snapshot.hasError) {
//                       return const Center(child: Text('No users found.'));
//                     } else {
//                       final product = snapshot.data ?? [];
//                       List<DealersModel> customerModelList = [];
//                       for (var produc in product) {
//                         final model = DealersModel(customername: produc);
//                         customerModelList.add(model);
//                       }
//                       return SecondBoxDupe(
//                         dealerModel: customerModelList,
//                         mainTitle: " Top Dealers",
//                       );
//                     }
//                   },
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Column(
//               children: [
//                 Row(
//                   children: [
//                     AnalyzeContaianer(),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SecoendContainer(
//                         timeText: "0h:0m", persentage: "70", title: "Last week")
//                   ],
//                 ),
//                 SizedBox(
//                   width: 25,
//                 ),
//                 SecoendContainer(
//                     timeText: "70 %", persentage: "70", title: "Last week"),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 AllProjectContainer(
//                   date: "January 4,2024",
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Column(
//               children: [
//                 Column(
//                   children: [
//                     LastBox(
//                         mainTitle: "Activity Report",
//                         imageString: "lib/images/report.png"),
//                     SizedBox(
//                       width: 30,
//                     ),
//                     LastBox(
//                         mainTitle: "Top Assigned Project",
//                         imageString: "lib/images/project.png")
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: [
//                     Row(
//                       children: [
//                         AnalyzeContaianer(),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         SecoendContainer(
//                             timeText: "0h:0m",
//                             persentage: "70",
//                             title: "Last week")
//                       ],
//                     ),
//                     SizedBox(
//                       width: 25,
//                     ),
//                     SecoendContainer(
//                         timeText: "70 %", persentage: "70", title: "Last week"),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     AllProjectContainer(
//                       date: "January 4,2024",
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
