
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hashtagable/hashtagable.dart';

class ItemSocial extends StatelessWidget {
  final Post post;

  const ItemSocial({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Divider(),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      children: [
                        HashTagText(
                          decorateAtSign: true,
                          maxLines: 3,
                            text: post.title,
                            basicStyle: TextStyle(
                                color: Color(0xFF202428),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            decoratedStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: post.socialNetwork.contains("instagram")
                                    ? Color(0xFF687684)
                                    : (post.socialNetwork.contains("facebook")
                                    ? Color(0xFF005CE5)
                                    : (post.socialNetwork
                                    .contains("twitter")
                                    ? Color(0xFF3FAEFF)
                                    : Color(0xFF202428))))),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              width: 21.83,
                              height: 21.83,
                              child: Image(
                                image: NetworkImage(post.socialNetworkLogo),
                                fit: BoxFit.cover,
                              ),
                            ),
                            HashTagText(
                              decorateAtSign: true,
                                text: post.author,
                                basicStyle: TextStyle(
                                    color: Color(0xFF202428),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                decoratedStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: post.socialNetwork.contains("instagram")
                                        ? Color(0xFF687684)
                                        : (post.socialNetwork.contains("facebook")
                                            ? Color(0xFF005CE5)
                                            : (post.socialNetwork
                                                    .contains("twitter")
                                                ? Color(0xFF3FAEFF)
                                                : Color(0xFF202428))))),
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFF687684),
                                size: 4,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  post.time,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF687684)),
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: NetworkImage(post.image),
                              fit: BoxFit.fill,
                            )),
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
