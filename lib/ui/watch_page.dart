
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/ui/watch_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchPage extends StatelessWidget{

  final List<Video> listVideo;

  const WatchPage({Key key, this.listVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
      ),
      body: ListView.builder(
        itemCount: listVideo.length,
        itemBuilder: (context, index) => ItemWatchVertical(video: listVideo[index],),
      ),
    );
  }

}