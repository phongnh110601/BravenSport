
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/ui/item_social.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget{

  final List<Post> postList;

  const SocialPage({Key key, this.postList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social'),
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) => ItemSocial(post: postList[index],),
      ),
    );
  }

}