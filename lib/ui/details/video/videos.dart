import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie.dart';
import 'package:movieapp/data/model/movie_videos.dart';
import 'package:movieapp/ui/items/video_item.dart';

import 'VideoBloc.dart';

class Videos extends StatefulWidget {
  final Movie movie;

  Videos({this.movie});

  @override
  _VideosState createState() => _VideosState(movie: movie);
}

class _VideosState extends State<Videos> {
  final Movie movie;

  _VideosState({this.movie});

  @override
  void initState() {
    videoBloc.getMovieVideos(movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<MovieVideos>(
        stream: videoBloc.movieVideosSubject.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.0),
              itemCount: snapshot.data.results.length,
              itemBuilder: (context, position) {
                return VideoItem(snapshot.data.results[position]);
              },
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("No Videos Found"),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }




  @override
  void dispose() {
    videoBloc.dispose();
    super.dispose();
  }
}
