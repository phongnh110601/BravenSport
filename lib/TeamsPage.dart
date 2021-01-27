import 'package:demo_180121/League.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo_180121/TeamsGridView.dart';
import 'LeagueGridView.dart';
import 'Teams.dart';

class TeamsPage extends StatefulWidget {
  final List<League> listLeague;

  const TeamsPage({Key key, this.listLeague}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {

  List<Teams> listTeams = new List();
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
                  TeamsGridView(listTeam: listTeams,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addData() {
    for(int i = 0; i < widget.listLeague.length; i++){
      for(int j = 0; j < widget.listLeague[i].teamList.length;j++){
        listTeams.add(widget.listLeague[i].teamList[j]);
      }
    }
  }
}
