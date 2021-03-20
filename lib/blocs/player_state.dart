import 'package:demo_180121_bloc/models/player.dart';

class PlayerState {
  const PlayerState();
}

class GetPlayersInitial extends PlayerState{}

class GetPlayersFailure extends PlayerState{}

class GetPlayersSuccess extends PlayerState{
  final List<Player> playersList;
  final int numberOfCheckedPlayer;

  GetPlayersSuccess(this.playersList, this.numberOfCheckedPlayer);
}
