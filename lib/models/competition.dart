
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/models/team.dart';

class Competition {
  List<Team> teamList;
  String name;
  String logo;
  List<Match> matchList;
  bool check;
  News news;
  Post post;

  Competition({this.teamList, this.name, this.logo, this.matchList, this.check, this.news, this.post});

  Competition.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}



