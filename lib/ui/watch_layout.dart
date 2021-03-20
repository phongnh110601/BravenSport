import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/ui/watch_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class WatchLayout extends StatefulWidget {
  final List<Video> listVideos;

  const WatchLayout({Key key, this.listVideos}) : super(key: key);

  @override
  _WatchLayoutState createState() => _WatchLayoutState();
}

class _WatchLayoutState extends State<WatchLayout> {
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(widget.listVideos[0].url);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Watch',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6E7E8C),
                      fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WatchPage(listVideo: widget.listVideos,)));
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6E7E8C),
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(_videoPlayerController),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle),
                          child: FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  if (_videoPlayerController.value.isPlaying) {
                                    _videoPlayerController.pause();
                                  } else {
                                    _videoPlayerController.play();
                                  }
                                });
                              },
                              child: Icon(_videoPlayerController.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow)),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.width / 2,
                );
              }
            },
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    child: Text(
                  widget.listVideos[0].title,
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF202428)),
                  textAlign: TextAlign.start,
                )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      widget.listVideos[0].detail,
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6E7E8C)),
                      textAlign: TextAlign.start,
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 20, 15),
                  child: Divider(),
                ),
              ],
            ),
          ),
          if (widget.listVideos.length >= 4)
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              height: MediaQuery.of(context).size.width / 2,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) =>
                    ItemWatchHorizontal(video: widget.listVideos[index + 1]),
              ),
            )
        ],
      ),
    );
  }
}

class ItemWatchHorizontal extends StatefulWidget {
  final Video video;

  const ItemWatchHorizontal({Key key, this.video}) : super(key: key);

  @override
  _ItemWatchHorizontalState createState() {
    return _ItemWatchHorizontalState();
  }
}

class _ItemWatchHorizontalState extends State<ItemWatchHorizontal> {
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.video.url);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: VideoPlayer(_videoPlayerController)),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  shape: BoxShape.circle),
                              child: FloatingActionButton(
                                  heroTag: null,
                                  backgroundColor: Colors.white.withOpacity(0),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return VideoAlertDialog(
                                            video: widget.video,
                                          );
                                        });
                                  },
                                  child: Icon(Icons.play_arrow)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                  );
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                widget.video.title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF202428),
                ),
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemWatchVertical extends StatefulWidget {
  final Video video;

  const ItemWatchVertical({Key key, this.video}) : super(key: key);

  _ItemWatchVerticalState createState() => _ItemWatchVerticalState();
}

class _ItemWatchVerticalState extends State<ItemWatchVertical> {
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController = VideoPlayerController.network(widget.video.url);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_videoPlayerController),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle),
                        child: FloatingActionButton(
                            backgroundColor: Colors.white.withOpacity(0),
                            onPressed: () {
                              setState(() {
                                if (_videoPlayerController.value.isPlaying) {
                                  _videoPlayerController.pause();
                                } else {
                                  _videoPlayerController.play();
                                }
                              });
                            },
                            child: Icon(_videoPlayerController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow)),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.width / 2,
              );
            }
          },
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  child: Text(
                widget.video.title,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF202428)),
                textAlign: TextAlign.start,
              )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    widget.video.detail,
                    style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6E7E8C)),
                    textAlign: TextAlign.start,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 20, 15),
                child: Divider(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class VideoAlertDialog extends StatefulWidget {
  final Video video;

  const VideoAlertDialog({Key key, this.video}) : super(key: key);

  @override
  _VideoAlertDialogState createState() => _VideoAlertDialogState();
}

class _VideoAlertDialogState extends State<VideoAlertDialog> {
  VideoPlayerController _popupVideoPlayerController;
  Future<void> _initializePopupVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    _popupVideoPlayerController =
        VideoPlayerController.network(widget.video.url);
    _initializePopupVideoPlayerFuture =
        _popupVideoPlayerController.initialize();
    _popupVideoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializePopupVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AlertDialog(
            content: AspectRatio(
              aspectRatio: _popupVideoPlayerController.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_popupVideoPlayerController),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle),
                      child: FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.white.withOpacity(0),
                        onPressed: () {
                          setState(() {
                            if (_popupVideoPlayerController.value.isPlaying) {
                              _popupVideoPlayerController.pause();
                            } else {
                              _popupVideoPlayerController.play();
                            }
                          });
                        },
                        child: Icon(_popupVideoPlayerController.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return AlertDialog();
        }
      },
    );
  }
}
