import 'package:demo_180121_bloc/models/team.dart';

class News{
  final String title;
  final String pageName;
  final String pageLogo;
  final String time;
  final String image;

  News({this.title, this.pageName, this.pageLogo, this.time, this.image});
}

class Post{
  final String image;
  final String title;
  final String time;
  final String socialNetworkLogo;
  final String socialNetwork;
  final String author;

  Post({this.image, this.title, this.time, this.socialNetworkLogo,
    this.socialNetwork, this.author});
}

class Transfer{
  final String buyTeamLogo;
  final String sellTeamLogo;
  final String playerImage;
  final String price;
  final String playerName;

  const Transfer({this.buyTeamLogo, this.sellTeamLogo, this.playerImage, this.price,
      this.playerName});
}

class Video{
  final String url;
  final String title;
  final String detail;

  Video({this.url, this.title, this.detail});
}

class Match {
  final Team teamA;
  final Team teamB;
  final int teamAScore;
  final int teamBScore;
  final String time;
  bool notify;
  final bool playing;
  final int minutes;

  Match({this.teamA, this.teamB, this.teamAScore, this.teamBScore, this.time,
    this.notify, this.playing, this.minutes});
}

class LeagueEvent{
  final String leagueLogo;
  final String leagueName;
  final List<Match> matchList;

  LeagueEvent({this.leagueLogo, this.leagueName, this.matchList});
}

class Sponsor {
  final String link;
  final String image;

  Sponsor({this.link, this.image});
}
