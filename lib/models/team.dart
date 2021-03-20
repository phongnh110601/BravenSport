import 'package:demo_180121_bloc/models/player.dart';

import 'feeds_models.dart';

class Team {
  List<Player> playerList;
  String logo;
  String name;
  bool check;
  News news;
  Post post;

  Team({this.logo, this.name, this.check, this.playerList, this.news, this.post});

  Team.fromJson(Map<String, dynamic> json){
    name = json['name'];
    logo = json['crestUrl'] != null ? json['crestUrl'] : "";
  }
}
