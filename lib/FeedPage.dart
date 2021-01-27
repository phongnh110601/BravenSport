import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'News.dart';

class FeedsPage extends StatefulWidget {

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
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
              Container(
                decoration: BoxDecoration(color: Colors.black12),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: Colors.white),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'News',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF6E7E8C),
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'More',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF6E7E8C),
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Container(
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 2 / 1,
                                      child: Image(
                                        image: NetworkImage(
                                            'https://baolongan.vn/image/news/2020/20200604/images/bruno_fernandes_hao_huc_da_cap_pogba_trong_doi_hinh_mu_kubs.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child: Text(
                                        'Manchester United boss Ole Gunnar Solskjaer relishing Paul Pogba-Bruno Fernandes prospect.',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF373737)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 18,
                                            height: 18,
                                            child: Image(
                                              image: NetworkImage(
                                                  'https://img.apksum.com/57/de.sky.sportnews/1.7.0/icon.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                            child: Text(
                                              'Skysports.com',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF687684),
                                                  fontWeight: FontWeight.w500),
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
                                              margin:
                                              EdgeInsets.fromLTRB(8, 0, 0, 0),
                                              child: Text(
                                                '15 mins',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFF687684),
                                                    fontWeight: FontWeight.w500),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      height: 0.5,
                                      decoration:
                                      BoxDecoration(color: Color(0xFFCDD6DF)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 7,
                              child: ListView(
                                children: [
                                  News(
                                    title:
                                    "Antoine Griezmann has no regrets over Barcelona snub",
                                    image:
                                    "https://www.thesun.co.uk/wp-content/uploads/2019/11/NINTCHDBPICT000538438179-e1574177543574.jpg",
                                    page: "Daily Mail",
                                    pageLogo:
                                    "https://image.winudf.com/v2/image1/Y29tLmRhaWx5bWFpbC5vbmxpbmVfaWNvbl8xNTYwNDI1MzkwXzA4NA/icon.png?w=170&fakeurl=1",
                                    time: "27 min",
                                  ),
                                  Divider(),
                                  News(
                                    title:
                                    "Antoine Griezmann has no regrets over Barcelona snub",
                                    image:
                                    "https://www.thesun.co.uk/wp-content/uploads/2019/11/NINTCHDBPICT000538438179-e1574177543574.jpg",
                                    page: "Daily Mail",
                                    pageLogo:
                                    "https://image.winudf.com/v2/image1/Y29tLmRhaWx5bWFpbC5vbmxpbmVfaWNvbl8xNTYwNDI1MzkwXzA4NA/icon.png?w=170&fakeurl=1",
                                    time: "27 min",
                                  ),
                                  Divider(),
                                  News(
                                    title:
                                    "Antoine Griezmann has no regrets over Barcelona snub",
                                    image:
                                    "https://www.thesun.co.uk/wp-content/uploads/2019/11/NINTCHDBPICT000538438179-e1574177543574.jpg",
                                    page: "Daily Mail",
                                    pageLogo:
                                    "https://image.winudf.com/v2/image1/Y29tLmRhaWx5bWFpbC5vbmxpbmVfaWNvbl8xNTYwNDI1MzkwXzA4NA/icon.png?w=170&fakeurl=1",
                                    time: "27 min",
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Scaffold(
                body: Column(),
              ),
            ],
          ),
        ));
  }
}

