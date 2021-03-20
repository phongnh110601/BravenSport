import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'competitor_page.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _loadingPercent = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }



  void startTimer() {
    Timer.periodic(
      Duration(milliseconds: 3),
          (Timer timer) => setState(
            () {
          if (_loadingPercent > 1) {
            timer.cancel();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CompetitorPage()));
          } else {
            _loadingPercent += 0.0002;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 317, 0, 0),
            child: Stack(
              children: [
                SvgPicture.asset('assets/images/loading_image.svg'),
                Container(
                    margin: EdgeInsets.fromLTRB(5.67, 66.78, 79.84, 15.55),
                    child: SvgPicture.asset('assets/images/loading_image_2.svg'))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 247, 0, 0),
              child: Text(
                'BRAVEN SPORT',
                style: GoogleFonts.roboto(
                    color: Color(0xFF2D2D2D),
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            width: 200,
            height: 4,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              child: LinearProgressIndicator(
                value: _loadingPercent,
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
