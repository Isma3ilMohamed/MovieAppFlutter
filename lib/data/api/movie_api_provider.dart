import 'package:dio/dio.dart';
import 'package:movieapp/data/model/MovieReviews.dart';
import 'package:movieapp/data/model/movie_videos.dart';
import 'package:movieapp/data/model/movies_response.dart';
import 'package:movieapp/util/Constants.dart';

import 'LoggingInterceptor.dart';
class MovieApiProvider {
   Dio _dio ;


  MovieApiProvider(){
    BaseOptions options =
    BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());


  }
  Future<MoviesResponse> getPopularMovies() async {
    try {
      Response response=await _dio.get("${Constanst.BASE_URL}popular?api_key=${Constanst.API_KEY}");
      return MoviesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<MoviesResponse> getTopRatedMovies() async {
    try {
      Response response=await _dio.get("${Constanst.BASE_URL}top_rated?api_key=${Constanst.API_KEY}");
      return MoviesResponse.fromJson(response.data);
    } catch (error, stacktrace) {

      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }


  Future<MovieVideos> getMovieVideos(int movieId) async{
    try{
      Response response=await _dio.get("${Constanst.BASE_URL}${movieId}/videos?api_key=${Constanst.API_KEY}");
      return MovieVideos.fromJson(response.data);
    } catch (error, stacktrace) {

      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }


  Future<MovieReviews> getMovieReviews(int movieId) async{
      Response response=await _dio.get("${Constanst.BASE_URL}${movieId}/reviews?api_key=${Constanst.API_KEY}");
      if(response.statusCode!=200){
        throw Exception("");
      }
      return MovieReviews.fromJson(response.data);

  }

}



/*
* String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
*
* */