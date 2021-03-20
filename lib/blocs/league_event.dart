import 'package:equatable/equatable.dart';

class LeagueEvent extends Equatable{

  const LeagueEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];

}

class GetLeagues extends LeagueEvent{
  final int index;
  final String name;
  final bool navigate;

  GetLeagues({this.index, this.name, this.navigate});

  @override
  // TODO: implement props
  List<Object> get props => [name];
}


