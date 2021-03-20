import 'package:demo_180121_bloc/blocs/feeds_event.dart';
import 'package:demo_180121_bloc/blocs/feeds_state.dart';
import 'package:demo_180121_bloc/repositories/data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsBloc extends Bloc<FeedsEvent, FeedsState> {
  final dataProvider = DataProvider();

  FeedsBloc() : super(GetFeedsInitial());

  @override
  Stream<FeedsState> mapEventToState(FeedsEvent event) async* {
    if (event is GetFeedsData) {
      yield GetFeedsSuccess(
        newsList: dataProvider.allNews,
        transferList: dataProvider.allTransfers,
        sponsorList: dataProvider.allSponsors,
        videoList: dataProvider.allVideos,
        postList: dataProvider.allPosts,
        leagueEventList: dataProvider.allLeagueEvents,
      );
    }
    if (event is GetFeedsDataByType) {
      if (event.news != null) {
        yield GetFeedsSuccess(
          newsList: dataProvider.allNews,
        );
      }
      if (event.transfer != null) {
        yield GetFeedsSuccess(
          transferList: dataProvider.allTransfers,
        );
      }
      if (event.watch != null) {
        yield GetFeedsSuccess(
          videoList: dataProvider.allVideos,
        );
      }
      if (event.social != null) {
        yield GetFeedsSuccess(
          postList: dataProvider.allPosts,
        );
      }
      if (event.event != null) {
        yield GetFeedsSuccess(
            leagueEventList: dataProvider.allLeagueEvents);
      }

      if(event.leagueIndex != null && event.matchIndex != null){
        yield GetFeedsSuccess(
          newsList: dataProvider.allNews,
          transferList: dataProvider.allTransfers,
          sponsorList: dataProvider.allSponsors,
          videoList: dataProvider.allVideos,
          postList: dataProvider.allPosts,
          leagueEventList: dataProvider.getUpdateLeagueEventOnTap(event.leagueIndex, event.matchIndex),
        );
      }
    }
  }
}
