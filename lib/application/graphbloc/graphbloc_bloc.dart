// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:nixon/repostitory/dashboardrepo.dart';

part 'graphbloc_event.dart';
part 'graphbloc_state.dart';

class GraphblocBloc extends Bloc<GraphblocEvent, GraphblocState> {
  GraphblocBloc() : super(GraphblocInitial()) {
    on<GetDatesForGraph>((event, emit) async {
      // print("event called");
      emit(const GraphblocState(
          isLoading: true,
          isError: false,
          countOfproductsPerDay: [],
          dealersWithProductCount: []));

      final weeklyReportList =
          await DashBoardRepo.instance.getProductCountForWeek();
      // print(weeklyReportList);

      if (weeklyReportList.isNotEmpty) {
        emit(GraphblocState(
            isLoading: false,
            isError: false,
            countOfproductsPerDay: weeklyReportList,
            dealersWithProductCount: []));
      } else {
        print("list is empty");
      }
    });

    on<GetDealersWithProductCount>((event, emit) async {
      final topDealersProductConutList =
          await DashBoardRepo.instance.getTopDealersWithCount();
      print(topDealersProductConutList);

      emit(GraphblocState(
          isLoading: false,
          isError: false,
          countOfproductsPerDay: [],
          dealersWithProductCount: topDealersProductConutList));
    });
  }
}
