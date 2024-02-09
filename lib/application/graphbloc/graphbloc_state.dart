part of 'graphbloc_bloc.dart';

class GraphblocState {
  final bool isLoading;
  final bool isError;
  final List<DealersModel> dealersWithProductCount;
  final List<ProductModel> dealersWithNames;


 



  const GraphblocState({
    required this.dealersWithNames,
   
    required this.dealersWithProductCount,
    required this.isLoading,
    required this.isError,
  });
}

final class GraphblocInitial extends GraphblocState {
  GraphblocInitial()
      : super(
            isLoading: false,
            isError: false,
            dealersWithProductCount: [],dealersWithNames: []
           
            );
}

