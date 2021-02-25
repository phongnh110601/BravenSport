import 'package:demo_180121/PlayerPage.dart';
import 'package:demo_180121/TeamsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'ItemCard.dart';
import 'League.dart';
import 'Teams.dart';

class TeamsGridView extends StatefulWidget {
  final List<Teams> listTeam;

  const TeamsGridView({Key key, this.listTeam}) : super(key: key);

  @override
  _TeamsGridViewState createState() => _TeamsGridViewState();
}

class _TeamsGridViewState extends State<TeamsGridView> {
  int _count = 0;
  List<Teams> listTeamChecked = new List();

  void reload(int index) {
    setState(() {
      if (_count < 5 || (_count >= 5 && widget.listTeam[index].isChecked)) {
        widget.listTeam[index].isChecked = !widget.listTeam[index].isChecked;
      }
      _count = 0;
      listTeamChecked.clear();
      for (int i = 0; i < widget.listTeam.length; i++) {
        if (widget.listTeam[i].isChecked) {
          _count++;
          listTeamChecked.add(widget.listTeam[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              StaggeredGridView.countBuilder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.listTeam.length,
                  crossAxisCount: 5,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          print("index: $index");
                          reload(index);
                        },
                        child: ItemCard(
                          name: widget.listTeam[index].name,
                          image: widget.listTeam[index].logo,
                          isChecked: widget.listTeam[index].isChecked,
                        ),
                      ),
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      (index % 18 == 0 && index != 0) ? 3 :((index == 0) ? 2 : ((index % 5 == 4) ? 2 : 1)),
                      (index % 18 == 0 && index != 0) ? 3 :((index == 0) ? 2 : ((index % 5 == 4) ? 2 : 1)))),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(20, 200, 0, 20),
                    alignment: Alignment.bottomLeft,
                    child: Stack(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Color(0xFF0073D8),
                          size: 80,
                        ),
                        Icon(
                          Icons.navigate_before_sharp,
                          color: Color(0xFFFFFFFF),
                          size: 80,
                        ),
                      ],
                    )),
              ),
              if (_count > 0)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerPage(
                                  listTeams: listTeamChecked,
                                )));
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 200, 20, 20),
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFF0073D8),
                            size: 80,
                          ),
                          Icon(
                            Icons.navigate_next_sharp,
                            color: Color(0xFFFFFFFF),
                            size: 80,
                          ),
                        ],
                      )),
                )
              else
                Container()
            ],
          )),
    );
  }
}
