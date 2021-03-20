import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:equatable/equatable.dart';

class FeedsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class GetFeedsData extends FeedsEvent{}

class GetFeedsDataByType extends FeedsEvent{
  final bool news;
  final bool transfer;
  final bool watch;
  final bool social;
  final bool event;
  final int leagueIndex;
  final int matchIndex;

  GetFeedsDataByType({this.leagueIndex, this.matchIndex, this.news, this.transfer, this.watch, this.social, this.event});
}
