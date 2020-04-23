import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: Image.network("${Constanst.YOUTUBE_THUMBMAIL}${videos.key}/0.jpg"),
      ),
      onTap: (){
        Constanst.openYoutube(videos.key);
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
