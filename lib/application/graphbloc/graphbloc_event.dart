part of 'graphbloc_bloc.dart';

 class GraphblocEvent {}

class GetDealersNameAndCountForGraphDealer extends GraphblocEvent{
  final String name;
  GetDealersNameAndCountForGraphDealer({required this.name});
}
class GetIndividualGraphPerWeek extends GraphblocEvent{}
