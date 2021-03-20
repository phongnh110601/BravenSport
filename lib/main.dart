import 'package:demo_180121_bloc/blocs/feeds_bloc.dart';
import 'package:demo_180121_bloc/blocs/feeds_event.dart';
import 'package:demo_180121_bloc/blocs/league_bloc.dart';
import 'package:demo_180121_bloc/blocs/player_bloc.dart';
import 'package:demo_180121_bloc/blocs/player_event.dart';
import 'package:demo_180121_bloc/blocs/team_bloc.dart';
import 'package:demo_180121_bloc/blocs/team_event.dart';
import 'package:demo_180121_bloc/repositories/data_provider.dart';
import 'package:demo_180121_bloc/ui/competitor_page.dart';
import 'package:demo_180121_bloc/ui/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/league_event.dart';

void main() {
  DataProvider().initialLeagues();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LeagueBloc>(
          create: (context) => LeagueBloc()..add(GetLeagues()),

        ),
        BlocProvider<TeamBloc>(
          create: (context) => TeamBloc()..add(GetTeams()),

        ),
        BlocProvider<PlayerBloc>(
          create: (context) => PlayerBloc()..add(GetPlayers()),
        ),
        BlocProvider<FeedsBloc>(
            create: (context) => FeedsBloc()..add(GetFeedsData()))
      ],
      child: MaterialApp(
        home: LoadingPage(),
      ),
    );
  }
}


