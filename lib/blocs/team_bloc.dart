
import 'package:demo_180121_bloc/blocs/team_event.dart';
import 'package:demo_180121_bloc/blocs/team_state.dart';
import 'package:demo_180121_bloc/repositories/data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final dataProvider = DataProvider();

  TeamBloc() : super(GetTeamsInitial());

  @override
  Stream<TeamState> mapEventToState(TeamEvent event) async* {
    final currentState = state;
    if (event is GetTeams) {
      if (currentState is GetTeamsInitial) {
        yield GetTeamsSuccess(
            dataProvider.allTeams, dataProvider.numberOfCheckedTeams);
      }
      if (currentState is GetTeamsSuccess) {
        if (event.index != null) {
          yield GetTeamsSuccess(dataProvider.getUpdatedTeamsOnTap(event.index),
              dataProvider.numberOfCheckedTeams);
        }
        if (event.name != null) {
          yield GetTeamsSuccess(dataProvider.getTeamsByName(event.name),
              dataProvider.numberOfCheckedTeams);
        }
        if (event.navigate != null) {
          dataProvider.initialPlayers();
        }
      }
    }
  }
}
