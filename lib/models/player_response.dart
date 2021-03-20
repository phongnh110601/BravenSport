import 'package:demo_180121_bloc/models/player.dart';

class PlayerResponse {
  List<Scorers> scorerList;

  PlayerResponse({this.scorerList});

  PlayerResponse.fromJson(Map<String, dynamic> json) {
    if (json['scorers'] != null) {
      scorerList = new List();
      json['scorers'].forEach((v) {
        scorerList.add(new Scorers.fromJson(v));
      });
    }
  }
}

class Scorers {
  Player player;

  Scorers({this.player});

  Scorers.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }
}
