import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixon/application/graphbloc/graphbloc_bloc.dart';
import 'package:nixon/domain/models/productmodel.dart';
import 'package:nixon/repostitory/capitalise.dart';

import '../../../domain/models/customermodel.dart';
import '../barGrap/widget/mygraph.dart';

// ignore: must_be_immutable
class FirstBox extends StatelessWidget {
  FirstBox({
    Key? key,
    required this.mainTitle,
    required this.products,
    required this.dealers,
  }) : super(key: key);

  final String mainTitle;
  final List<ProductModel> products;
  final List<DealersModel> dealers;

  List<int> weeklysummery = [0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    dealers.isEmpty
        ? BlocProvider.of<GraphblocBloc>(context).add(GetDatesForGraph())
        : BlocProvider.of<GraphblocBloc>(context)
            .add(GetDealersWithProductCount());
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      mainTitle,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: dealers.isEmpty
                      ? ListView.builder(
                          itemCount: products.length > 5 ? 5 : products.length,
                          itemBuilder: (context, index) {
                            products.sort((a, b) =>
                                b.productCount.compareTo(a.productCount));

                            final item = products[index];
                            return Row(
                              children: [
                                const SizedBox(width: 16),
                                Text(
                                  item.productName.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  ': ${item.productCount.toString()}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: dealers.length > 5 ? 5 : dealers.length,
                          itemBuilder: (context, index) {
                            final item = dealers[index];
                            return Row(
                              children: [
                                const SizedBox(width: 16),
                                Text(
                                  item.customername.capitalize().toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8), // Adjust the spacing as needed
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dealers.isEmpty ? "Weekly sales Report" : "Dealers Report",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 300,
                    height: 200,
                    child: dealers.isEmpty
                        ? BlocBuilder<GraphblocBloc, GraphblocState>(
                            builder: (context, state) {
                              return MyGraph(
                                  weeklysummery:
                                      state.countOfproductsPerDay.isNotEmpty
                                          ? state.countOfproductsPerDay
                                          : weeklysummery);
                            },
                          )
                        : MyGraph(weeklysummery: weeklysummery)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
