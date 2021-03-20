import 'package:demo_180121_bloc/blocs/league_bloc.dart';
import 'package:demo_180121_bloc/blocs/league_event.dart';
import 'package:demo_180121_bloc/blocs/league_state.dart';
import 'package:demo_180121_bloc/blocs/team_bloc.dart';
import 'package:demo_180121_bloc/blocs/team_event.dart';
import 'package:demo_180121_bloc/ui/teams_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_card.dart';

class CompetitorPage extends StatefulWidget {
  @override
  _CompetitorPageState createState() => _CompetitorPageState();
}

class _CompetitorPageState extends State<CompetitorPage> {
  LeagueBloc _leagueBloc;

  final _leagueController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _leagueBloc = BlocProvider.of<LeagueBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueBloc, LeagueState>(builder: (context, state) {
      if (state is GetLeaguesSuccess) {
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
                      onChanged: (text) {
                        print(text);
                        _leagueBloc.add(GetLeagues(name: text));
                      },
                      controller: _leagueController,
                      decoration: InputDecoration(
                          hintText: 'Search your favorite leagues',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xFF6E7E8C)),
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFF6E7E8C)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6E7E8C)),
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
                                    itemCount: state.leagueList.length,
                                    crossAxisCount: 5,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                          onTap: () {
                                            print("index: $index");
                                            _leagueBloc
                                                .add(GetLeagues(index: index));
                                            print(state.numberOfCheckedLeagues);
                                          },
                                          child: ItemCard(
                                            imageType: 'png',
                                            name: state.leagueList[index].name,
                                            image: state.leagueList[index].logo,
                                            check:
                                                state.leagueList[index].check,
                                            size:
                                                (index % 18 == 0 && index != 0)
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
                                if (state.numberOfCheckedLeagues > 0)
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFF0073D8),
                                                width: 2),
                                            shape: BoxShape.circle),
                                        child: FloatingActionButton(
                                          elevation: 0,
                                          backgroundColor: Color(0xFF0073D8),
                                          child: Icon(
                                            Icons.navigate_next_sharp,
                                            size: 40,
                                          ),
                                          onPressed: () {
                                            _leagueBloc.add(
                                                GetLeagues(navigate: true));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BlocProvider(
                                                            create: (BuildContext
                                                                    context) =>
                                                                TeamBloc()
                                                                  ..add(
                                                                      GetTeams()),
                                                            child:
                                                                TeamsPage())));
                                          },
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
      } else {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
