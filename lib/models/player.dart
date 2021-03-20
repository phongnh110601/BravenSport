
import 'feeds_models.dart';

class Player {
  String name;
  String image;
  News news;
  Video video;
  Post post;
  bool check;
  bool transfer;
  String price;

  Player(
      {this.name,
      this.image,
      this.news,
      this.video,
      this.post,
      this.check,
      this.transfer,
      this.price});

  Player.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}
