

import 'package:movieapp/data/api/movie_api_provider.dart';
import 'package:movieapp/data/model/MovieReviews.dart';
import 'package:movieapp/data/model/movie_videos.dart';
import 'model/movies_response.dart';

class MovieRepository{
  MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<MoviesResponse> getPopularMovie() async{
    return _movieApiProvider.getPopularMovies();
  }

  Future<MoviesResponse> getTopRatedMovies() async{
    return _movieApiProvider.getTopRatedMovies();
  }


  Future<MovieVideos> getMovieVideos(int movieId)async{
    return _movieApiProvider.getMovieVideos(movieId);
  }


  Future<MovieReviews> getMovieReviews(int movieId) async{
    return _movieApiProvider.getMovieReviews(movieId);
  }
}