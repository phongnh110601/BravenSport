import 'package:demo_180121/League.dart';
import 'package:demo_180121/Player.dart';
import 'package:demo_180121/PlayerGridView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo_180121/TeamsGridView.dart';
import 'LeagueGridView.dart';
import 'Teams.dart';

class PlayerPage extends StatefulWidget {
  final List<Teams> listTeams;

  const PlayerPage({Key key, this.listTeams}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  final _playerController = TextEditingController();
  List<Player> filteredList = new List();
  List<Player> listPlayer = new List();
  @override
  void initState() {
    super.initState();
    addData();
    filteredList = listPlayer;
  }

  void _filtered(String text){
    filteredList = listPlayer.where((player) => player.name.toUpperCase().contains(text.toUpperCase())).toList();
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
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  onChanged:(text){
                    print("text: $text");
                    _filtered(text);
                  },
                  controller: _playerController,
                  decoration: InputDecoration(
                      hintText: 'Search your favorite players',
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF6E7E8C)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF6E7E8C)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF6E7E8C)
                          ),
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Stack(
                children: [
                  PlayerGridView(listPlayer: filteredList,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addData() {
    for(int i = 0; i < widget.listTeams.length; i++){
      for(int j = 0; j < widget.listTeams[i].playerList.length;j++){
        listPlayer.add(widget.listTeams[i].playerList[j]);
      }
    }
  }
}
