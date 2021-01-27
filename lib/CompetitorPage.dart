import 'package:demo_180121/League.dart';
import 'package:demo_180121/Player.dart';
import 'package:demo_180121/Teams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LeagueGridView.dart';

class CompetitorPage extends StatefulWidget {
  final String title;

  const CompetitorPage({Key key, this.title}) : super(key: key);

  @override
  _CompetitorPageState createState() => _CompetitorPageState();
}

class _CompetitorPageState extends State<CompetitorPage> {
  List<League> listLeague = new List();

  @override
  void initState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                alignment: Alignment.center,
                child: Text(
                  'Select your favorite leagues',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFF202428)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: Color(0xFF6E7E8C))),
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xFF6E7E8C),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search your favorite leagues',
                      style: GoogleFonts.roboto(
                          color: Color(0xFF6E7E8C), fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Stack(
                children: [
                  LeagueGridView(listLeague: listLeague),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addData() {
    Player degea = new Player('degea', 'assets/vectors/path56 1.svg', false);
    Player vidic = new Player('vidic', 'assets/vectors/path56 1.svg', false);
    Player evra = new Player('evra', 'assets/vectors/path56 1.svg', false);
    Player scholes = new Player('scholes', 'assets/vectors/path56 1.svg', false);
    Player ronaldo = new Player('ronaldo', 'assets/vectors/path56 1.svg', false);
    Player beckham = new Player('beckham', 'assets/vectors/path56 1.svg', false);
    Player giggs = new Player('giggs', 'assets/vectors/path56 1.svg', false);
    Player carrick = new Player('carrick', 'assets/vectors/path56 1.svg', false);
    Player rooney = new Player('rooney', 'assets/vectors/path56 1.svg', false);
    Player nani = new Player('nani', 'assets/vectors/path56 1.svg', false);
    Player tevez = new Player('tevez', 'assets/vectors/path56 1.svg', false);
    Player cantona = new Player('cantona', 'assets/vectors/path56 1.svg', false);
    Player fletcher = new Player('fletcher', 'assets/vectors/path56 1.svg', false);
    List<Player> listPlayer = new List();
    List<Player> listPlayerMc = new List();
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayerMc.add(new Player('ederson', 'assets/vectors/path56 1.svg', false));
    listPlayer.add(degea);
    listPlayer.add(vidic);
    listPlayer.add(evra);
    listPlayer.add(scholes);
    listPlayer.add(ronaldo);
    listPlayer.add(beckham);
    listPlayer.add(giggs);
    listPlayer.add(carrick);
    listPlayer.add(nani);
    listPlayer.add(tevez);
    listPlayer.add(fletcher);
    listPlayer.add(cantona);
    listPlayer.add(rooney);
    Teams mu = new Teams('manchester united', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams mc = new Teams('manchester city', listPlayerMc, 'assets/vectors/path56 1.svg', false);
    Teams arsenal = new Teams('arsenal', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams liverpool = new Teams('liverpool', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams chelsea = new Teams('chelsea', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams tottenham = new Teams('tottenham hotspur', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams newcastle = new Teams('newcastle united', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams everton = new Teams('everton', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams cardiff = new Teams('cardiff city', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams fullham = new Teams('fullham', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams norwich = new Teams('norwich city', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams stoke = new Teams('stoke city', listPlayer, 'assets/vectors/path56 1.svg', false);
    Teams leicester = new Teams('leicester city', listPlayer, 'assets/vectors/path56 1.svg', false);
    List<Teams> listTeam = new List();
    listTeam.add(mu);
    listTeam.add(mc);
    listTeam.add(arsenal);
    listTeam.add(liverpool);
    listTeam.add(chelsea);
    listTeam.add(tottenham);
    listTeam.add(newcastle);
    listTeam.add(everton);
    listTeam.add(cardiff);
    listTeam.add(fullham);
    listTeam.add(norwich);
    listTeam.add(stoke);
    listTeam.add(leicester);
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('la liga', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('champions League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('Europa League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('Ligue 1', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('Serie A', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
    listLeague.add(new League('premier League', 'assets/vectors/path56 1.svg', false, listTeam));
  }
}


