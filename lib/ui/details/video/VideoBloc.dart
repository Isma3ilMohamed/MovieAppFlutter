


import 'package:movieapp/data/model/movie_videos.dart';
import 'package:movieapp/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class VideoBloc{

  final MovieRepository _repository = MovieRepository();


  final BehaviorSubject<MovieVideos> _movieVideosSubject=BehaviorSubject<MovieVideos>();


  BehaviorSubject<MovieVideos> get movieVideosSubject => _movieVideosSubject;

  getMovieVideos(int movieId) async{
    _movieVideosSubject.sink.add(await _repository.getMovieVideos(movieId));
  }


  dispose(){
    _movieVideosSubject.close();
  }
}

final videoBloc = VideoBloc();