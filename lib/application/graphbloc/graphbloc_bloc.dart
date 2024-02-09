// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:nixon/repostitory/dashboardrepo.dart';

import '../../domain/models/customermodel.dart';

part 'graphbloc_event.dart';
part 'graphbloc_state.dart';

class GraphblocBloc extends Bloc<GraphblocEvent, GraphblocState> {
  GraphblocBloc() : super(GraphblocInitial()) {
    on<GetDealersNameAndCountForGraphDealer>((event, emit) async {
      //emit loading state
      emit(const GraphblocState(
     
        dealersWithProductCount: [],
        isLoading: true,
        isError: false,
      ));


      //fuction for individual dealers count per week

      final seprateListForDealers = await DashBoardRepo.instance
          .getDealersSoldCountPerWeekForIndividual(dealerid: event.uid);

      List<DealersModel> dealermodelList = [];
      int maxvalue = seprateListForDealers
          .reduce((value, element) => value > element ? value : element);
      for (var produc in seprateListForDealers) {
        final dealerModel =
            DealersModel(productCount: produc, maxProducCount: maxvalue);
        dealermodelList.add(dealerModel);
      }

      //function for find total dealers name

     
      emit(GraphblocState(
        
          dealersWithProductCount: dealermodelList,
          isLoading: false,
          isError: false));
    });
  }
}
