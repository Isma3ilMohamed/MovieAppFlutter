import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/data/model/Video.dart';
import 'package:movieapp/data/model/movie_videos.dart';
import 'package:movieapp/util/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoItem extends StatefulWidget {
  final Video videos;

  VideoItem(this.videos);

  @override
  _VideoItemState createState() => _VideoItemState(videos);
}

class _VideoItemState extends State<VideoItem> {
  final Video videos;

  _VideoItemState(this.videos);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                    "${Constanst.YOUTUBE_THUMBMAIL}${videos.key}/0.jpg",
                    fit: BoxFit.cover)),
            Positioned(
              top: 100,
              bottom: 100,
              left: 100,
              right: 100,
              child: Image.asset(
                "images/logotype.png",
                width: 20,
                height: 20,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Constanst.openYoutube(videos.key);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
