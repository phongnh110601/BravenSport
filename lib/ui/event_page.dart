
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/ui/item_league_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget{

  final List<LeagueEvent> listLeagueEvent;

  const EventPage({Key key, this.listLeagueEvent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listLeagueEvent.length,
          itemBuilder: (context, index) => ItemLeagueEvent(
            leagueEvent: listLeagueEvent[index],
          ),
        ),
      )
    );
  }

}