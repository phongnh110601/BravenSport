import 'package:demo_180121/TeamsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'ItemCard.dart';
import 'League.dart';

class LeagueGridView extends StatefulWidget {
  final List<League> listLeague;

  const LeagueGridView({Key key, this.listLeague}) : super(key: key);

  @override
  _LeagueGridViewState createState() => _LeagueGridViewState();
}

class _LeagueGridViewState extends State<LeagueGridView> {
  int _count = 0;
  List<League> lisLeagueChecked = new List();

  void reload(int index) {
    setState(() {
      if (_count < 5 || (_count >= 5 && widget.listLeague[index].isChecked)) {
        widget.listLeague[index].isChecked =
            !widget.listLeague[index].isChecked;
      }
      _count = 0;
      lisLeagueChecked.clear();
      for (int i = 0; i < widget.listLeague.length; i++) {
        if (widget.listLeague[i].isChecked) {
          _count++;
          lisLeagueChecked.add(widget.listLeague[i]);
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
                  itemCount: widget.listLeague.length,
                  crossAxisCount: 5,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          print("index: $index");
                          reload(index);
                        },
                        child: ItemCard(
                          name: widget.listLeague[index].name,
                          image: widget.listLeague[index].logo,
                          isChecked: widget.listLeague[index].isChecked,
                        ),
                      ),
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      (index % 18 == 0 && index != 0) ? 3 :((index == 0) ? 2 : ((index % 5 == 4) ? 2 : 1)),
                      (index % 18 == 0 && index != 0) ? 3 :((index == 0) ? 2 : ((index % 5 == 4) ? 2 : 1)))),
              if (_count > 0)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamsPage(
                                  listLeague: lisLeagueChecked,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFF0073D8),
                            size: 80,
                          ),
                          Icon(
                            Icons.navigate_next_outlined,
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
