
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/ui/item_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NewsPage extends StatelessWidget{
  final List<News> listNews;

  const NewsPage({Key key, this.listNews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: listNews.length,
        itemBuilder: (context, index){
          return ItemNews(
            news: listNews[index],
          );
        },
      ),
    );
  }

}