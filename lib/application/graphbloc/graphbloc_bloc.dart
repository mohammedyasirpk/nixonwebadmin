// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:nixon/repostitory/dashboardrepo.dart';

import '../../domain/models/customermodel.dart';
import '../../domain/models/productmodel.dart';

part 'graphbloc_event.dart';
part 'graphbloc_state.dart';

class GraphblocBloc extends Bloc<GraphblocEvent, GraphblocState> {
  GraphblocBloc() : super(GraphblocInitial()) {
    on<GetDealersNameAndCountForGraphDealer>((event, emit) async {
      //emit loading state
      emit(const GraphblocState(
        dealersWithNames: [],
        dealersWithProductCount: [],
        isLoading: true,
        isError: false,
      ));


      //fuction for individual dealers count per week

      final seprateListForDealers = await DashBoardRepo.instance
          .getDealersSoldCountPerWeekForIndividual(dealname: event.name);

      List<DealersModel> dealermodelList = [];
      int maxvalue = seprateListForDealers
          .reduce((value, element) => value > element ? value : element);
      for (var produc in seprateListForDealers) {
        final dealerModel =
            DealersModel(productCount: produc, maxProducCount: maxvalue);
        dealermodelList.add(dealerModel);
      }

      //function for find total dealers name

      final dealerNameList =
          await DashBoardRepo.instance.getTopDealersWithCount();
      List<ProductModel> customerModelList = [];
      for (var item in dealerNameList) {
        final dealerModel = ProductModel(
            productName: item["name"],
            productCount: item["salesCount"],
            maxSoldCount: item["dealersTotalCount"]);

        customerModelList.add(dealerModel);
      }
      emit(GraphblocState(
          dealersWithNames: customerModelList,
          dealersWithProductCount: dealermodelList,
          isLoading: false,
          isError: false));
    });
  }
}
