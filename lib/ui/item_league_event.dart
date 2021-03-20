import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ItemLeagueEvent extends StatelessWidget {
  final LeagueEvent leagueEvent;

  const ItemLeagueEvent({Key key, this.leagueEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: SvgPicture.network(leagueEvent.leagueLogo,
                    fit: BoxFit.fill,),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  leagueEvent.leagueName,
                  style: GoogleFonts.roboto(
                      color: Color(0xFFADAEAD),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  maxLines: 1,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: leagueEvent.matchList.length >= 3
                  ? 3
                  : leagueEvent.matchList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.network(leagueEvent.matchList[index].teamB.logo,
                                  fit: BoxFit.fill,),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.network(leagueEvent.matchList[index].teamA.logo,
                                    fit: BoxFit.fill,),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  leagueEvent.matchList[index].teamA.name,
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF373737),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                                Text(
                                  leagueEvent.matchList[index].teamB.name,
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF373737),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: leagueEvent.matchList[index].playing
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        leagueEvent.matchList[index].teamAScore
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF373737),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        leagueEvent.matchList[index].teamBScore
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF373737),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                      )
                                    ],
                                  )
                                : Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Transform.rotate(
                                    angle: -math.pi / 6,
                                    child: Icon(
                                      Icons.notifications,
                                      color: leagueEvent.matchList[index].notify
                                          ? Color(0xFF0073D8)
                                          : Color(0xFFC4C4C4),
                                    ),
                                  ),
                                ),
                                leagueEvent.matchList[index].playing
                                    ? Container(
                                        width: 40,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFF4343),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Text(
                                          leagueEvent.matchList[index].minutes
                                                  .toString() +
                                              "'",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                      )
                                    : Text(
                                        leagueEvent.matchList[index].time,
                                        style: GoogleFonts.roboto(
                                          color: Color(0xFF373737),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 20, 10, 0),
                      child: Divider(),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
