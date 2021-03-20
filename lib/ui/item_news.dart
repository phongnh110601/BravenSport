
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:flutter/material.dart';

class ItemNews extends StatelessWidget {
  final News news;

  const ItemNews({Key key, this.news}) : super(key: key);

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
                        Text(
                          news.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF373737)),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 21.83,
                              height: 21.83,
                              child: Image(
                                image: NetworkImage(news.pageLogo),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                news.pageName,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF687684)),
                              ),
                            ),
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
                                  news.time,
                                  style: TextStyle(
                                      fontSize: 13,
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
                              image: NetworkImage(news.image),
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
