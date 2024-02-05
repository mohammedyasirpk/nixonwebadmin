part of 'graphbloc_bloc.dart';

 class GraphblocState {
  final bool isLoading;
  final bool isError;
  final List<int> countOfproductsPerDay;
  final List<Map<String, dynamic>> dealersWithProductCount;
  const GraphblocState({required this.dealersWithProductCount, 
      required this.isLoading,
      required this.isError,
      required this.countOfproductsPerDay});
}

final class GraphblocInitial extends GraphblocState {
  GraphblocInitial()
      : super(isLoading: false, isError: false, countOfproductsPerDay: [],dealersWithProductCount: []);
}
