part of 'graphbloc_bloc.dart';

class GraphblocState {
  final bool isLoading;
  final bool isError;
  final List<DealersModel> dealersWithProductCount;



 



  const GraphblocState({
 
   
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
            dealersWithProductCount: [],
           
            );
}

