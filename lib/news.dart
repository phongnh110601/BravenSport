import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String title;
  final String pageLogo;
  final String page;
  final String image;
  final String time;

  const News(
      {Key key, this.title, this.image, this.pageLogo, this.page, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    this.title,
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
                          image: NetworkImage(this.pageLogo),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          this.page,
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
                            this.time,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF687684)),
                          ))
                    ],
                  )
                ],
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
                          image: NetworkImage(this.image),
                          fit: BoxFit.fill,
                        )),
                  )))
        ],
      ),
    );
  }
}