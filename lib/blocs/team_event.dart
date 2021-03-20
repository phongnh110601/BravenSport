import 'package:equatable/equatable.dart';

class TeamEvent extends Equatable{

  const TeamEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class GetTeams extends TeamEvent{
  final int index;
  final String name;
  final bool navigate;

  GetTeams({this.index, this.name, this.navigate});

  @override
  // TODO: implement props
  List<Object> get props => [name];
}