import 'package:demo_180121_bloc/models/competition.dart';

class LeagueState{
  const LeagueState();

}

class GetLeaguesInitial extends LeagueState {}

class GetLeaguesFailure extends LeagueState {}

class GetLeaguesSuccess extends LeagueState {

  final List<Competition> leagueList;
  final int numberOfCheckedLeagues;

  GetLeaguesSuccess(this.leagueList, this.numberOfCheckedLeagues);

}

