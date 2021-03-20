import 'package:demo_180121_bloc/models/competition.dart';
import 'package:demo_180121_bloc/models/team.dart';

class CompetitionResponse {
  Competition competition;

  CompetitionResponse({this.competition});

  CompetitionResponse.fromJson1(Map<String, dynamic> json) {
    competition = json['competition'] != null ? new Competition.fromJson(json['competition']) : new Competition();
    if (json['teams'] != null) {
      competition.teamList = new List();
      json['teams'].forEach((v) { competition.teamList.add(new Team.fromJson(v)); });
    }
  }

  CompetitionResponse.fromJson2(Map<String, dynamic> json){
    competition = new Competition();
    competition.logo = json['emblemUrl'];
  }
}