import 'package:demo_180121/FeedPage.dart';
import 'package:demo_180121/Player.dart';
import 'package:demo_180121/TeamsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'ItemCard.dart';
import 'League.dart';
import 'Teams.dart';

class PlayerGridView extends StatefulWidget {
  final List<Player> listPlayer;

  const PlayerGridView({Key key, this.listPlayer}) : super(key: key);

  @override
  _PlayerGridViewState createState() => _PlayerGridViewState();
}

class _PlayerGridViewState extends State<PlayerGridView> {
  int _count = 0;
  List<Player> listPlayerChecked = new List();

  void reload(int index) {
    setState(() {
      if (_count < 5 || (_count >= 5 && widget.listPlayer[index].isChecked)) {
        widget.listPlayer[index].isChecked =
            !widget.listPlayer[index].isChecked;
      }
      _count = 0;
      listPlayerChecked.clear();
      for (int i = 0; i < widget.listPlayer.length; i++) {
        if (widget.listPlayer[i].isChecked) {
          _count++;
          listPlayerChecked.add(widget.listPlayer[i]);
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
                  itemCount: widget.listPlayer.length,
                  crossAxisCount: 5,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          print("index: $index");
                          reload(index);
                        },
                        child: ItemCard(
                          name: widget.listPlayer[index].name,
                          image: widget.listPlayer[index].image,
                          isChecked: widget.listPlayer[index].isChecked,
                        ),
                      ),
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      (index % 18 == 0 && index != 0) ? 3 :((index == 0) ? 2 : ((index % 5 == 4) ? 2 : 1)),
                      (index % 18 == 0 && index != 0) ? 3 :((index == 0) ? 2 : ((index % 5 == 4) ? 2 : 1)))),
              GestureDetector(
                onTap: () {
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
                Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: FlatButton(
                      height: 70,
                      minWidth: 200,
                      color: Color(0xFF0073D8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedsPage()));
                      },
                      child: Text(
                        'GO',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ))
              else
                Container()
            ],
          )),
    );
  }
}
