import 'package:demo_180121/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class ItemWatch extends StatefulWidget {
  final Video video;

  const ItemWatch({Key key, this.video}) : super(key: key);

  @override
  _ItemWatchState createState() {
    return _ItemWatchState();
  }
}

class _ItemWatchState extends State<ItemWatch> {
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.video.link);
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
                                  border: Border.all(color: Colors.white, width: 2),
                                  shape: BoxShape.circle),
                              child: FloatingActionButton(
                                heroTag: null,
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
