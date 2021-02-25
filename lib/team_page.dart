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

  final _teamController = TextEditingController();
  List<Teams> listTeams = new List();
  List<Teams> filteredList = new List();
  @override
  void initState() {
    super.initState();
    addData();
    filteredList = listTeams;
  }

  void _filtered(String text){
    setState(() {
      filteredList = listTeams.where((team) => team.name.toUpperCase().contains(text.toUpperCase())).toList();
    });
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
                  'Select your favorite teams',
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
                  controller: _teamController,
                  decoration: InputDecoration(
                      hintText: 'Search your favorite leagues',
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
                  TeamsGridView(listTeam: filteredList,)
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
