// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nixon/application/graphbloc/graphbloc_bloc.dart';
// import 'package:nixon/domain/models/productmodel.dart';

// import '../../../domain/models/customermodel.dart';
// import '../../home/barGrap/widget/mygraph.dart';

// // ignore: must_be_immutable
// class FirstBoxDupe extends StatelessWidget {
//   FirstBoxDupe({Key? key, required this.mainTitle, required this.products, t})
//       : super(key: key);

//   final String mainTitle;
//   final List<ProductModel> products;

//   List<DealersModel> weeklysummery = [
//     DealersModel(customername: "loading", productCount: 5),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // BlocProvider.of<GraphblocBloc>(context).add(GetDealersNameAndCountForGraphDealer());

//     return Container(
//       width: MediaQuery.of(context).size.width * 0.37,
//       height: MediaQuery.of(context).size.height * 0.4,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     const SizedBox(width: 10),
//                     Text(
//                       mainTitle,
//                       style: const TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 8),



//                 // SizedBox(
//                 //     height: MediaQuery.of(context).size.height * 0.25,
//                 //     child: ListView.builder(
//                 //       itemCount: products.length > 5 ? 5 : products.length,
//                 //       itemBuilder: (context, index) {
//                 //         products.sort(
//                 //             (a, b) => b.productCount.compareTo(a.productCount));

//                 //         final item = products[index];
//                 //         return Row(
//                 //           children: [
//                 //             const SizedBox(width: 16),
//                 //             Text(
//                 //               item.productName.toString(),
//                 //               style: const TextStyle(
//                 //                   fontSize: 16, fontWeight: FontWeight.bold),
//                 //             ),
//                 //             const SizedBox(width: 8),
//                 //             Text(
//                 //               ': ${item.productCount.toString()}',
//                 //               style: const TextStyle(
//                 //                   fontSize: 16, fontWeight: FontWeight.bold),
//                 //             ),
//                 //           ],
//                 //         );
//                 //       },
//                 //     )),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8), // Adjust the spacing as needed
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 20,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
              
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                     width: 300,
//                     height: 210,
//                     child: BlocBuilder<GraphblocBloc, GraphblocState>(
//                       builder: (context, state) {
//                         if (state.isLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else {
//                           return MyGraph(
//                               productGraph: true,
//                               weeklysummery:
//                                   state.countOfproductsPerDay.isNotEmpty
//                                       ? state.countOfproductsPerDay
//                                       : weeklysummery);
//                         }
//                       },
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
