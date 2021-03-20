import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:demo_180121_bloc/models/competition_response.dart';
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/models/competition.dart';
import 'package:demo_180121_bloc/models/player.dart';
import 'package:demo_180121_bloc/models/player_response.dart';
import 'package:demo_180121_bloc/models/team.dart';
import 'package:demo_180121_bloc/utils/config.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static final DataProvider _dataProvider = DataProvider._internal();
  List<Competition> allLeagues = new List();
  List<Competition> filteredLeaguesByName = new List();
  List<Team> allTeams = new List();
  List<Team> filteredTeamsByName = new List();
  List<Player> allPlayers = new List();
  List<Player> filteredPlayersByName = new List();
  List<News> allNews = new List();
  List<Transfer> allTransfers = new List();
  List<Sponsor> allSponsors = new List();
  List<Video> allVideos = new List();
  List<Post> allPosts = new List();
  List<LeagueEvent> allLeagueEvents = new List();
  int numberOfCheckedLeagues = 0;
  int numberOfCheckedTeams = 0;
  int numberOfCheckedPlayer = 0;

  factory DataProvider() {
    return _dataProvider;
  }

  DataProvider._internal();

  Future<CompetitionResponse> fetchLeagueData(String competitionId) async {
    final response = await http.get(
        Uri.https(Config.BASE_URL, 'v2/competitions/$competitionId/teams'),
        headers: <String, String>{'X-Auth-Token': Config.API_KEY_2});

    if (response.statusCode == 200) {
      return CompetitionResponse.fromJson1(json.decode(response.body));
    } else {
      print("league status code = ${response.statusCode}");
      throw Exception('Fail to load data !');
    }
  }

  Future<PlayerResponse> fetchPlayers(String competitionId) async {
    final response = await http.get(
        Uri.https(Config.BASE_URL, 'v2/competitions/$competitionId/scorers'),
        headers: <String, String>{'X-Auth-Token': Config.API_KEY_3});
    if (response.statusCode == 200) {
      print(response.body);
      return PlayerResponse.fromJson(json.decode(response.body));
    } else {
      print("player status code = ${response.statusCode}");
      print(competitionId);
      throw Exception('Fail to load data !');
    }
  }

  List<Competition> getLeaguesByName(String name) {
    filteredLeaguesByName = allLeagues
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    return filteredLeaguesByName;
  }

  List<Competition> getUpdatedLeaguesOnTap(int index) {
    if (numberOfCheckedLeagues < 5 ||
        (numberOfCheckedLeagues >= 5 && filteredLeaguesByName[index].check)) {
      filteredLeaguesByName[index].check = !filteredLeaguesByName[index].check;
    }
    numberOfCheckedLeagues =
        filteredLeaguesByName.where((element) => element.check).toList().length;
    return filteredLeaguesByName;
  }

  List<LeagueEvent> getUpdateLeagueEventOnTap(int leagueIndex, int matchIndex) {
    allLeagueEvents[leagueIndex].matchList[matchIndex].notify =
        !allLeagueEvents[leagueIndex].matchList[matchIndex].notify;
    return allLeagueEvents;
  }


  List<Team> getTeamsByName(String name) {
    filteredTeamsByName = allTeams
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    return filteredTeamsByName;
  }

  List<Team> getUpdatedTeamsOnTap(int index) {
    if (numberOfCheckedTeams < 5 ||
        (numberOfCheckedTeams >= 5 && filteredTeamsByName[index].check)) {
      filteredTeamsByName[index].check = !filteredTeamsByName[index].check;
    }
    numberOfCheckedTeams =
        filteredTeamsByName.where((element) => element.check).toList().length;
    return filteredTeamsByName;
  }

  void initialTeams() {
    allTeams.clear();
    List<Competition> checkedLeaguesList =
        allLeagues.where((element) => element.check).toList();
    checkedLeaguesList.forEach((element) {
      allTeams += element.teamList;
    });
    filteredTeamsByName = allTeams;
  }

  List<Player> getPlayersByName(String name) {
    filteredPlayersByName = allPlayers
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    return filteredPlayersByName;
  }

  List<Player> getUpdatedPlayersOnTap(int index) {
    if (numberOfCheckedPlayer < 5 ||
        (numberOfCheckedPlayer >= 5 && filteredPlayersByName[index].check)) {
      filteredPlayersByName[index].check = !filteredPlayersByName[index].check;
    }
    numberOfCheckedPlayer =
        filteredPlayersByName.where((element) => element.check).toList().length;
    return filteredPlayersByName;
  }

  void initialPlayers() {
    allPlayers.clear();
    List<Team> checkedTeamsList =
        allTeams.where((element) => element.check).toList();
    checkedTeamsList.forEach((element) {
      allPlayers += element.playerList;
    });
    filteredPlayersByName = allPlayers;
  }

  void initialFeeds() {
    allLeagues.forEach((league) {
      if (league.check) {
        allNews.add(league.news);
      }
    });
    allTeams.forEach((team) {
      if (team.check) {
        allNews.add(team.news);
      }
    });
    allPlayers.forEach((player) {
      if (player.check) {
        allNews.add(player.news);
      }
    });

    for (int i = 0; i < allTeams.length; i++) {
      if (allTeams[i].check) {
        allTeams[i].playerList.forEach((player) {
          if (player.transfer) {
            allTransfers.add(new Transfer(
                buyTeamLogo: allTeams[allTeams.length -
                    1 -
                    Random().nextInt(allTeams.length - 1)]
                    .logo,
                sellTeamLogo: allTeams[i].logo,
                playerImage: player.image,
                price: player.price,
                playerName: player.name));
          }
        });
      }
    }

    allSponsors.add(new Sponsor(
        image:
        'https://guongotogiagoc.com/wp-content/uploads/2020/07/audi-GuongOtoGiaGoc.com_.png',
        link: 'https://www.audi.com/en.html'));
    allSponsors.add(new Sponsor(
        image:
        'https://1000logos.net/wp-content/uploads/2018/04/Mercedes-Logo.png',
        link: 'https://www.mercedes-benz.com/en/'));
    allSponsors.add(new Sponsor(
        image: 'http://pngimg.com/uploads/bmw_logo/bmw_logo_PNG19707.png',
        link: 'https://www.bmw.com/en/index.html'));
    allSponsors.add(new Sponsor(
        image:
        'https://logos-download.com/wp-content/uploads/2016/02/Jaguar_logo_transparent_png.png',
        link: 'https://www.jaguar.com/index.html'));
    allSponsors.add(new Sponsor(
        image: 'https://pngimg.com/uploads/bentley/bentley_PNG34.png',
        link: 'https://www.bentleymotors.com/en.html'));
    allSponsors.add(new Sponsor(
        image: 'https://pngimg.com/uploads/rolls_royce/rolls_royce_PNG34.png',
        link: 'https://www.rolls-roycemotorcars.com/en_GB/home.html'));

    print('sponsor list: ${allSponsors.length}');

    allPlayers.forEach((element) {
      if (element.check) {
        allVideos.add(element.video);
      }
    });

    allLeagues.forEach((element) {
      if (element.check) {
        allPosts.add(element.post);
      }
    });

    allTeams.forEach((element) {
      if (element.check) {
        allPosts.add(element.post);
      }
    });

    allPlayers.forEach((element) {
      if (element.check) {
        allPosts.add(element.post);
      }
    });

    allLeagues.forEach((element) {
      if (element.check) {
        allLeagueEvents.add(new LeagueEvent(
            leagueLogo: element.logo,
            leagueName: element.name,
            matchList: element.matchList));
      }
    });

  }

  Future<void> initialLeagues() async {

    List<Competition> leaguesList = new List();
    for (int i = 0; i < 22; i++) {

      leaguesList.add(new Competition(
          name: 'League $i' 'th',
          logo:
              'https://media.api-football.com/leagues/${i + 1}.png',
          check: false,
          ));
      CompetitionResponse competitionResponse;
      PlayerResponse playerResponse;
      if (i < 10) {
        competitionResponse = await this.fetchLeagueData(Config.COMPETITIONS[i]);
        playerResponse = await this.fetchPlayers(Config.COMPETITIONS[i]);
        leaguesList[i].name = competitionResponse.competition.name;
      } else {
        leaguesList[i].name = leaguesList[i - 10].name;
      }
      leaguesList[i].post = new Post(
        image:
        'http://webthethao.mediacdn.vn/2018/7/11/3695619318519306682067811312889159274201088n-15312989135021022494193-0-0-449-800-crop-1531298920717814254757.png',
        title: 'A new record for league #${leaguesList[i].name.split(" ")[0]} in the round $i last night !',
        socialNetwork: (i % 3 == 0)
            ? 'twitter'
            : (i % 3 == 1)
            ? 'facebook'
            : 'instagram',
        time: '${Random().nextInt(22) + 1}h',
        author: '@${leaguesList[i].name.split(" ")[0]}',
        socialNetworkLogo: (i % 3 == 0)
            ? 'https://upload.wikimedia.org/wikipedia/vi/thumb/9/9f/Twitter_bird_logo_2012.svg/1200px-Twitter_bird_logo_2012.svg.png'
            : (i % 3 == 1)
            ? 'https://icons-for-free.com/iconfiles/png/512/fb+logo+social+social+media+social+network+icon-1320191784115198611.png'
            : 'https://www.pngkit.com/png/full/107-1072165_instagram-clipart-instagram-facebook-facebook-and-instagram-icon.png',
      );
      leaguesList[i].news = new News(
        image:
        'http://webthethao.mediacdn.vn/2018/7/11/3695619318519306682067811312889159274201088n-15312989135021022494193-0-0-449-800-crop-1531298920717814254757.png',
        title:
        'Fetch football club has joined ${leaguesList[i].name} next season !',
        pageLogo:
        'https://play-lh.googleusercontent.com/5sbk5YKQdIxkbBlBPsafP0nYMNg4kMeeanRaZaUPDUVL8B5xhX8FgSYaWjCP-2t3KKM',
        pageName: 'Daily Mail',
        time: '$i mins',
      );
      leaguesList[i].teamList = new List();

      for (int j = 0; j < 22; j++) {
        leaguesList[i].teamList.add(new Team(
            check: false,
            name: 'Team $i' 'th',
            logo: (j % 3 == 0)
                ? 'https://crests.football-data.org/4.svg'
                : (j % 3 == 1)
                    ? 'https://crests.football-data.org/5.svg'
                    : 'https://crests.football-data.org/64.svg'));

        if (i < 10) {
          int teamIndex = (j < competitionResponse.competition.teamList.length)
              ? j
              : (j - competitionResponse.competition.teamList.length);
          leaguesList[i].teamList[j].name =
              competitionResponse.competition.teamList[teamIndex].name;
          leaguesList[i].teamList[j].logo =
              competitionResponse.competition.teamList[teamIndex].logo;
        } else {
          leaguesList[i].teamList[j].name =
              leaguesList[i - 10].teamList[j].name;
          leaguesList[i].teamList[j].logo =
              leaguesList[i - 10].teamList[j].logo;
        }
        leaguesList[i].teamList[j].post = new Post(
          image:
          'https://cdnmedia.thethaovanhoa.vn/Upload/HtvXz5LF7F7RfWlZklzQ/files/2020/06/13/skysports-manchester-city-celebration_4273038.jpg',
          title: 'An impressive win of #${leaguesList[i].teamList[j].name.split(" ")[0]} in the match last night !',
          socialNetwork: (j % 3 == 0)
              ? 'twitter'
              : (j % 3 == 1)
              ? 'facebook'
              : 'instagram',
          time: '$j''h',
          author: '@${leaguesList[i].teamList[j].name.split(" ")[0]}',
          socialNetworkLogo: (j % 3 == 0)
              ? 'https://upload.wikimedia.org/wikipedia/vi/thumb/9/9f/Twitter_bird_logo_2012.svg/1200px-Twitter_bird_logo_2012.svg.png'
              : (j % 3 == 1)
              ? 'https://icons-for-free.com/iconfiles/png/512/fb+logo+social+social+media+social+network+icon-1320191784115198611.png'
              : 'https://www.pngkit.com/png/full/107-1072165_instagram-clipart-instagram-facebook-facebook-and-instagram-icon.png',
        );
        leaguesList[i].teamList[j].news = new News(
          image:
          'https://cdnmedia.thethaovanhoa.vn/Upload/HtvXz5LF7F7RfWlZklzQ/files/2020/06/13/skysports-manchester-city-celebration_4273038.jpg',
          title: '${leaguesList[i].teamList[j].name} has moved to Vietnam to play with Fetch football club !',
          pageLogo:
          'https://play-lh.googleusercontent.com/5sbk5YKQdIxkbBlBPsafP0nYMNg4kMeeanRaZaUPDUVL8B5xhX8FgSYaWjCP-2t3KKM',
          pageName: 'Daily Mail',
          time: '$j mins',
        );
        leaguesList[i].teamList[j].playerList = new List();

        for (int k = 0; k < 22; k++) {
          leaguesList[i].teamList[j].playerList.add(new Player(
                name: 'Player $k' 'th',
                image:
                (k % 3 == 0)
                    ? 'https://www.pngarts.com/files/5/Cristiano-Ronaldo-PNG-Image.png'
                    : (k % 3 == 1)
                        ? 'https://assets.laliga.com/squad/2020/t178/p19054/2048x2225/p19054_t178_2020_1_001_000.png'
                        : 'https://s.yimg.com/xe/i/us/sp/v/soccer/wc/players/372885.3.png',
                check: false,
                transfer: Random().nextBool(),
                price: '${10 + Random().nextInt(140)}m',
              ));
          if (i < 10) {
            if (k < playerResponse.scorerList.length) {
              leaguesList[i].teamList[j].playerList[k].name =
                  playerResponse.scorerList[k].player.name;
            } else {
              leaguesList[i].teamList[j].playerList[k].name =
                  leaguesList[i].teamList[j].playerList[k - playerResponse.scorerList.length].name;
            }
          } else {
            leaguesList[i].teamList[j].playerList[k].name =
                leaguesList[i - 10].teamList[j].playerList[k].name;
          }

          leaguesList[i].teamList[j].playerList[k].video = new Video(
            url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            title: 'A goal an an assist for ${leaguesList[i].teamList[j].playerList[k].name} in the match last night !',
            detail: 'The goal was score in $k minutes',
          );

          leaguesList[i].teamList[j].playerList[k].post = new Post(
            image:
            'https://baolongan.vn/image/news/2020/20200604/images/bruno_fernandes_hao_huc_da_cap_pogba_trong_doi_hinh_mu_kubs.jpg',
            title: 'A goal an an assist for #${leaguesList[i].teamList[j].playerList[k].name.split(" ")[0]} in the match last night !',
            socialNetwork: (k % 3 == 0)
                ? 'twitter'
                : (k % 3 == 1)
                ? 'facebook'
                : 'instagram',
            time: '$k''h',
            author: '@${leaguesList[i].teamList[j].playerList[k].name.split(" ")[0]}',
            socialNetworkLogo: (k % 3 == 0)
                ? 'https://upload.wikimedia.org/wikipedia/vi/thumb/9/9f/Twitter_bird_logo_2012.svg/1200px-Twitter_bird_logo_2012.svg.png'
                : (k % 3 == 1)
                ? 'https://icons-for-free.com/iconfiles/png/512/fb+logo+social+social+media+social+network+icon-1320191784115198611.png'
                : 'https://www.pngkit.com/png/full/107-1072165_instagram-clipart-instagram-facebook-facebook-and-instagram-icon.png',
          );

          leaguesList[i].teamList[j].playerList[k].news = new News(
            image:
            'https://baolongan.vn/image/news/2020/20200604/images/bruno_fernandes_hao_huc_da_cap_pogba_trong_doi_hinh_mu_kubs.jpg',
            title: '${leaguesList[i].teamList[j].playerList[k].name} has moved to Vietnam to join Fetch football club !',
            pageLogo:
            'https://img.apksum.com/57/de.sky.sportnews/1.7.0/icon.png',
            pageName: 'Skysports.com',
            time: '$k mins',
          );

        }
      }


      leaguesList[i].matchList = new List();
      for (int j = 0; j < 22; j += 2) {
        leaguesList[i].matchList.add(new Match(
              teamA: leaguesList[i].teamList[j],
              teamB: leaguesList[i].teamList[j + 1],
              teamAScore: Random().nextInt(5),
              teamBScore: Random().nextInt(5),
              time: '${Random().nextInt(24)}:${Random().nextInt(60)}',
              notify: (j % 3 == 0) ? true : false,
              playing: (j % 4 == 0) ? true : false,
              minutes: (j % 4 == 0) ? Random().nextInt(90) : null,
            ));
      }
      allLeagues = leaguesList;
      filteredLeaguesByName = allLeagues;
    }


  }
}
