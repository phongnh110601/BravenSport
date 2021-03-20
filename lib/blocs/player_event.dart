import 'package:equatable/equatable.dart';

class PlayerEvent extends Equatable{

  const PlayerEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class GetPlayers extends PlayerEvent{
  final int index;
  final String name;
  final bool navigate;

  GetPlayers({this.index, this.name, this.navigate});
}