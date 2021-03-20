import 'package:demo_180121_bloc/blocs/player_event.dart';
import 'package:demo_180121_bloc/blocs/player_state.dart';
import 'package:demo_180121_bloc/repositories/data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState>{

  final dataProvider = DataProvider();
  PlayerBloc() : super(GetPlayersInitial());

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    final currentState = state;
    if(event is GetPlayers){
      if(currentState is GetPlayersInitial){
        yield GetPlayersSuccess(dataProvider.allPlayers, dataProvider.numberOfCheckedTeams);
      }
      if(currentState is GetPlayersSuccess){
        if(event.name != null){
          yield GetPlayersSuccess(dataProvider.getPlayersByName(event.name), dataProvider.numberOfCheckedPlayer);
        }
        if(event.index != null){
          yield GetPlayersSuccess(dataProvider.getUpdatedPlayersOnTap(event.index), dataProvider.numberOfCheckedPlayer);
        }
        if(event.navigate != null){
          dataProvider.initialFeeds();
        }
      }
    }
  }

}