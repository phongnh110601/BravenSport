import 'package:demo_180121_bloc/models/feeds_models.dart';

class FeedsState{
  const FeedsState();
}

class GetFeedsInitial extends FeedsState{}
class GetFeedsFailure extends FeedsState{}
class GetFeedsSuccess extends FeedsState{
  final List<News> newsList;
  final List<Transfer> transferList;
  final List<Sponsor> sponsorList;
  final List<Video> videoList;
  final List<Post> postList;
  final List<LeagueEvent> leagueEventList;

  GetFeedsSuccess({this.newsList, this.transferList, this.sponsorList, this.videoList, this.postList, this.leagueEventList});
}