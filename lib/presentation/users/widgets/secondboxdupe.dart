// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nixon/application/graphbloc/graphbloc_bloc.dart';
// import 'package:nixon/presentation/home/barGrap/widget/barcontainer.dart';
// import 'package:nixon/repostitory/capitalise.dart';

// import '../../../domain/models/customermodel.dart';

// // ignore: must_be_immutable
// class SecondBoxDupe extends StatelessWidget {
//   SecondBoxDupe(
//       {Key? key, required this.mainTitle, required this.dealerModel, t})
//       : super(key: key);

//   final String mainTitle;
//   final List<DealersModel> dealerModel;

//   List<DealersModel> weeklysummery = [
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//     DealersModel(customername: "loading", productCount: 0),
//   ];

  

//   Widget fnForText(
//     List<DealersModel> list,
//     int index,
//   ) {
//     return Text(
//       list.asMap().containsKey(index)
//           ? list[index].customername.toString().capitalize()
//           : "",
//       style: const TextStyle(
//           fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<GraphblocBloc>(context)
//         .add(GetDealersNameAndCountForGraphDealer());

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
//             flex: 1,
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
//                 SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.25,
//                     child: ListView.builder(
//                       itemCount:
//                           dealerModel.length > 5 ? 5 : dealerModel.length,
//                       itemBuilder: (context, index) {
//                         dealerModel.sort(
//                             (a, b) => b.productCount.compareTo(a.productCount));

//                         final item = dealerModel[index];
//                         return Row(
//                           children: [
//                             const SizedBox(width: 16),
//                             Text(
//                               item.customername.toString().capitalize(),
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(width: 8),
//                             const Text(
//                               '',
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         );
//                       },
//                     )),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8), // Adjust the spacing as needed
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 20,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 40),
//                     child: Text(
//                       "Dealer Report",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                       width: 500,
//                       height: 210,
//                       child: BlocBuilder<GraphblocBloc, GraphblocState>(
//                         builder: (context, state) {
//                           if (state.isLoading) {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }

//                           return Row(
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   fnForText(state.dealersWithProductCount, 0),
//                                   fnForText(state.dealersWithProductCount, 2),
//                                   fnForText(state.dealersWithProductCount, 3),
//                                   fnForText(state.dealersWithProductCount, 4),
//                                   fnForText(state.dealersWithProductCount, 5),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                                SizedBox(
//                                   width: 300,
//                                   height: 210,
//                                   child: BarContainer(dealerModel: state.dealersWithProductCount,)),
//                             ],
//                           );

                         
//                         },
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
