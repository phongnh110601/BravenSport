import 'package:demo_180121_bloc/models/team.dart';

class TeamState {
  const TeamState();
}

class GetTeamsInitial extends TeamState {}

class GetTeamsFailure extends TeamState {}

class GetTeamsSuccess extends TeamState {
  final List<Team> teamList;
  final int numberOfCheckedTeams;

  GetTeamsSuccess(this.teamList, this.numberOfCheckedTeams);
}
