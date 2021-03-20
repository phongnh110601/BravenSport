import 'package:demo_180121_bloc/blocs/player_bloc.dart';
import 'package:demo_180121_bloc/blocs/player_event.dart';
import 'package:demo_180121_bloc/blocs/team_bloc.dart';
import 'package:demo_180121_bloc/blocs/team_event.dart';
import 'package:demo_180121_bloc/blocs/team_state.dart';
import 'package:demo_180121_bloc/models/team.dart';
import 'package:demo_180121_bloc/ui/players_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'item_card.dart';

class TeamsPage extends StatefulWidget {
  final List<Team> teamList;

  const TeamsPage({Key key, this.teamList}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  TeamBloc _teamBloc;
  final _teamsController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _teamBloc = BlocProvider.of<TeamBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (BuildContext context, state) {
        if (state is GetTeamsSuccess) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xFFE5E5E5),
              body: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      alignment: Alignment.center,
                      child: Text(
                        'Select your favorite \nteams',
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
                        onChanged: (text) {
                          print("text: $text");
                          _teamBloc.add(GetTeams(name: text));
                        },
                        controller: _teamsController,
                        decoration: InputDecoration(
                            hintText: 'Search your favorite teams',
                            hintStyle: TextStyle(
                                fontSize: 14, color: Color(0xFF6E7E8C)),
                            prefixIcon:
                                Icon(Icons.search, color: Color(0xFF6E7E8C)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6E7E8C)),
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  StaggeredGridView.countBuilder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.teamList.length,
                                      crossAxisCount: 5,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              print("index: $index");
                                              _teamBloc
                                                  .add(GetTeams(index: index));
                                            },
                                            child: ItemCard(
                                              imageType: 'svg',
                                              name: state.teamList[index].name,
                                              image: state.teamList[index].logo,
                                              check:
                                                  state.teamList[index].check,
                                              size: (index % 18 == 0 &&
                                                      index != 0)
                                                  ? 3
                                                  : ((index == 0)
                                                      ? 2
                                                      : ((index % 5 == 4)
                                                          ? 2
                                                          : 1)),
                                            ),
                                          ),
                                      staggeredTileBuilder: (index) =>
                                          StaggeredTile.count(
                                              (index % 18 == 0 && index != 0)
                                                  ? 3
                                                  : ((index == 0)
                                                      ? 2
                                                      : ((index % 5 == 4)
                                                          ? 2
                                                          : 1)),
                                              (index % 18 == 0 && index != 0)
                                                  ? 3
                                                  : ((index == 0)
                                                      ? 2
                                                      : ((index % 5 == 4)
                                                          ? 2
                                                          : 1)))),
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 200, 0, 20),
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFF6E7E8C),
                                                width: 2),
                                            shape: BoxShape.circle),
                                        child: FloatingActionButton(
                                          backgroundColor:
                                              Colors.white.withOpacity(0),
                                          heroTag: null,
                                          child: Icon(
                                            Icons.navigate_before_sharp,
                                            size: 40,
                                            color: Color(0xFF6E7E8C),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          elevation: 0,
                                        ),
                                      )),
                                  if (state.numberOfCheckedTeams > 0)
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 200, 20, 20),
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xFF0073D8),
                                                  width: 2),
                                              shape: BoxShape.circle),
                                          child: FloatingActionButton(
                                            elevation: 0,
                                            heroTag: null,
                                            backgroundColor: Color(0xFF0073D8),
                                            onPressed: () {
                                              _teamBloc.add(
                                                  GetTeams(navigate: true));
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => BlocProvider(
                                                          create: (BuildContext
                                                                  context) =>
                                                              PlayerBloc()
                                                                ..add(
                                                                    GetPlayers()),
                                                          child:
                                                              PlayersPage())));
                                            },
                                            child: Icon(
                                              Icons.navigate_next_sharp,
                                              size: 40,
                                            ),
                                          ),
                                        ))
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is GetTeamsInitial) {
          return CircularProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
