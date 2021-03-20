import 'package:bloc/bloc.dart';
import 'package:demo_180121_bloc/blocs/league_event.dart';
import 'package:demo_180121_bloc/blocs/league_state.dart';
import 'package:demo_180121_bloc/repositories/data_provider.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  final dataProvider = DataProvider();

  LeagueBloc() : super(GetLeaguesInitial());

  @override
  Stream<LeagueState> mapEventToState(LeagueEvent event) async* {
    final currentState = state;
    if (event is GetLeagues) {
      if (currentState is GetLeaguesInitial) {
        yield GetLeaguesSuccess(
          dataProvider.allLeagues,
          dataProvider.numberOfCheckedLeagues,
        );
      }
      if (currentState is GetLeaguesSuccess) {
        if(currentState.leagueList.length < 22){
          yield GetLeaguesSuccess(dataProvider.allLeagues, dataProvider.numberOfCheckedLeagues);
        }
        if (event.index != null) {
          yield GetLeaguesSuccess(
              dataProvider.getUpdatedLeaguesOnTap(event.index),
              dataProvider.numberOfCheckedLeagues);
        }
        if (event.name != null) {
          yield GetLeaguesSuccess(dataProvider.getLeaguesByName(event.name),
              dataProvider.numberOfCheckedLeagues);
        }
        if (event.navigate != null) {
          dataProvider.initialTeams();
        }
      }
    }
  }
}
