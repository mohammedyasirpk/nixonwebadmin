part of 'graphbloc_bloc.dart';

 class GraphblocEvent {}

class GetDealersNameAndCountForGraphDealer extends GraphblocEvent{
  final String uid;
  GetDealersNameAndCountForGraphDealer({required this.uid});
}
class GetIndividualGraphPerWeek extends GraphblocEvent{}
