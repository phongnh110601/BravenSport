import 'package:demo_180121_bloc/blocs/feeds_bloc.dart';
import 'package:demo_180121_bloc/blocs/feeds_event.dart';
import 'package:demo_180121_bloc/blocs/feeds_state.dart';
import 'package:demo_180121_bloc/ui/SponsorPage.dart';
import 'package:demo_180121_bloc/ui/event_page.dart';
import 'package:demo_180121_bloc/ui/item_news.dart';
import 'package:demo_180121_bloc/ui/item_social.dart';
import 'package:demo_180121_bloc/ui/item_transfer.dart';
import 'package:demo_180121_bloc/ui/news_page.dart';
import 'package:demo_180121_bloc/ui/social_page.dart';
import 'package:demo_180121_bloc/ui/transfer_page.dart';
import 'package:demo_180121_bloc/ui/watch_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:webview_flutter/webview_flutter.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _feedController = TextEditingController();
  FeedsBloc _feedsBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _feedsBloc = BlocProvider.of<FeedsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  async => false,
      child: BlocBuilder<FeedsBloc, FeedsState>(
        builder: (BuildContext context, state) {
          if (state is GetFeedsSuccess) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                flexibleSpace: Container(
                  height: 50,
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: TextFormField(
                    onChanged: (text) {},
                    controller: _feedController,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xFF6E7E8C)),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF6E7E8C)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6E7E8C)),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(80.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Feed',
                            style: GoogleFonts.roboto(
                                color: Color(0xFF202428),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: TabBar(
                                labelStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                                controller: _tabController,
                                labelColor: Color(0xFF0073D8),
                                unselectedLabelColor: Color(0xFF6E7E8C),
                                tabs: [
                                  Tab(child: Text('Following')),
                                  Tab(child: Text('All')),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(color: Colors.black12),
                      ),
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: double.infinity),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'News',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF6E7E8C),
                                                fontSize: 14),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(listNews: state.newsList,)));
                                            },
                                            child: Text(
                                              'More',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF6E7E8C),
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 2 / 1,
                                            child: Image(
                                              image: NetworkImage(
                                                  state.newsList[0].image),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 20, 20, 20),
                                            child: Text(
                                              state.newsList[0].title,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF373737)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 0, 20, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 18,
                                                  height: 18,
                                                  child: Image(
                                                    image: NetworkImage(state
                                                        .newsList[0].pageLogo),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                                  child: Text(
                                                    state.newsList[0].pageName,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color(0xFF687684),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: Color(0xFF687684),
                                                    size: 4,
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        8, 0, 0, 0),
                                                    child: Text(
                                                      state.newsList[0].time,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Color(0xFF687684),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return ItemNews(
                                              news: state.newsList[index + 1],
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 20, 20, 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Transfer',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF6E7E8C),
                                                fontSize: 14),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => TransferPage(listTransfer: state.transferList,)));
                                            },
                                            child: Text(
                                              'More',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF6E7E8C),
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          print(
                                              'transfer list: ${state.transferList.length}');
                                          return ItemTransfer(
                                            transfer: state.transferList[index],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(13, 0, 0, 3),
                                    child: Text(
                                      'Sponsor',
                                      style: GoogleFonts.roboto(
                                          color: Color(0xFF6E7E8C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        1 /
                                        4,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.sponsorList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration:
                                              BoxDecoration(color: Colors.white),
                                          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                          width:
                                              MediaQuery.of(context).size.height *
                                                  3 /
                                                  8,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  1 /
                                                  4,
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => SponsorPage(
                                                initialUrl: state.sponsorList[index].link,
                                              )));
                                            },
                                            child: AspectRatio(
                                              aspectRatio: 3 / 2,
                                              child: Image(
                                                image: NetworkImage(
                                                    state.sponsorList[index].image),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                              WatchLayxout(listVideos: state.videoList,),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Social',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF6E7E8C),
                                                fontSize: 14),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => SocialPage(postList: state.postList,)));
                                            },
                                            child: Text(
                                              'More',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF6E7E8C),
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: state.postList.length >= 3
                                            ? 3
                                            : state.postList.length,
                                        itemBuilder: (context, index) =>
                                            ItemSocial(
                                          post: state.postList[index],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Event',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFADAEAD),
                                                fontSize: 14),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(listLeagueEvent: state.leagueEventList,)));
                                            },
                                            child: Text(
                                              'See All',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFADAEAD),
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                      child: Divider(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            state.leagueEventList.length >= 2
                                                ? 2
                                                : state.leagueEventList.length,
                                        itemBuilder: (context, leagueIndex) {
                                          return Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 10, 0, 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: AspectRatio(
                                                        aspectRatio: 1 / 1,
                                                        child: Image(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(state
                                                              .leagueEventList[
                                                                  leagueIndex]
                                                              .leagueLogo),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        state
                                                            .leagueEventList[
                                                                leagueIndex]
                                                            .leagueName,
                                                        style: GoogleFonts.roboto(
                                                            color:
                                                                Color(0xFFADAEAD),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14),
                                                        maxLines: 1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 15, 0, 0),
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: state
                                                                .leagueEventList[
                                                                    leagueIndex]
                                                                .matchList
                                                                .length >=
                                                            3
                                                        ? 3
                                                        : state
                                                            .leagueEventList[
                                                                leagueIndex]
                                                            .matchList
                                                            .length,
                                                    itemBuilder:
                                                        (context, matchIndex) {
                                                      return Column(
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 15, 0, 0),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Stack(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets
                                                                            .fromLTRB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                0),
                                                                        width: 30,
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            SvgPicture.network(state
                                                                                .leagueEventList[leagueIndex]
                                                                                .matchList[matchIndex]
                                                                                .teamB
                                                                                .logo, fit: BoxFit.fill,),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets
                                                                            .fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                20),
                                                                        width: 30,
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            SvgPicture.network(state
                                                                                .leagueEventList[leagueIndex]
                                                                                .matchList[matchIndex]
                                                                                .teamA
                                                                                .logo, fit: BoxFit.fill,),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 4,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: [
                                                                      Text(
                                                                        state
                                                                            .leagueEventList[
                                                                                leagueIndex]
                                                                            .matchList[
                                                                                matchIndex]
                                                                            .teamA
                                                                            .name,
                                                                        style: GoogleFonts
                                                                            .roboto(
                                                                          color: Color(
                                                                              0xFF373737),
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .start,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                      Text(
                                                                        state
                                                                            .leagueEventList[
                                                                                leagueIndex]
                                                                            .matchList[
                                                                                matchIndex]
                                                                            .teamB
                                                                            .name,
                                                                        style: GoogleFonts
                                                                            .roboto(
                                                                          color: Color(
                                                                              0xFF373737),
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .start,
                                                                        maxLines:
                                                                            1,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: state
                                                                          .leagueEventList[
                                                                              leagueIndex]
                                                                          .matchList[
                                                                              matchIndex]
                                                                          .playing
                                                                      ? Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              state.leagueEventList[leagueIndex].matchList[matchIndex].teamAScore.toString(),
                                                                              style:
                                                                                  GoogleFonts.roboto(
                                                                                color: Color(0xFF373737),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 18,
                                                                              ),
                                                                              textAlign:
                                                                                  TextAlign.start,
                                                                              maxLines:
                                                                                  1,
                                                                            ),
                                                                            Text(
                                                                              state.leagueEventList[leagueIndex].matchList[matchIndex].teamBScore.toString(),
                                                                              style:
                                                                                  GoogleFonts.roboto(
                                                                                color: Color(0xFF373737),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 18,
                                                                              ),
                                                                              textAlign:
                                                                                  TextAlign.start,
                                                                              maxLines:
                                                                                  1,
                                                                            )
                                                                          ],
                                                                        )
                                                                      : Container(),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          _feedsBloc.add(GetFeedsDataByType(
                                                                              leagueIndex:
                                                                                  leagueIndex,
                                                                              matchIndex:
                                                                                  matchIndex));
                                                                        },
                                                                        child: Transform
                                                                            .rotate(
                                                                          angle:
                                                                              -math.pi /
                                                                                  6,
                                                                          child:
                                                                              Icon(
                                                                            Icons
                                                                                .notifications,
                                                                            color: state.leagueEventList[leagueIndex].matchList[matchIndex].notify
                                                                                ? Color(0xFF0073D8)
                                                                                : Color(0xFFC4C4C4),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      state
                                                                              .leagueEventList[leagueIndex]
                                                                              .matchList[matchIndex]
                                                                              .playing
                                                                          ? Container(
                                                                              width:
                                                                                  40,
                                                                              height:
                                                                                  20,
                                                                              decoration:
                                                                                  BoxDecoration(color: Color(0xFFFF4343), borderRadius: BorderRadius.circular(4)),
                                                                              child:
                                                                                  Text(
                                                                                state.leagueEventList[leagueIndex].matchList[matchIndex].minutes.toString() + "'",
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
                                                                              state.leagueEventList[leagueIndex].matchList[matchIndex].time,
                                                                              style:
                                                                                  GoogleFonts.roboto(
                                                                                color: Color(0xFF373737),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 14,
                                                                              ),
                                                                              textAlign:
                                                                                  TextAlign.center,
                                                                              maxLines:
                                                                                  1,
                                                                            )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(60, 20,
                                                                    10, 0),
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
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Scaffold(),
                ],
              ),
            );
          }
          if (state is GetFeedsInitial) {
            return CircularProgressIndicator();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
