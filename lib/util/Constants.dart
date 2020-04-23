import 'package:url_launcher/url_launcher.dart';

class Constanst {
  static String API_KEY = "3f1cd7fa782a61778afe7e6ceb8d1765";
  static String BASE_URL = "https://api.themoviedb.org/3/movie/";
  static String BASE_POSTER_URL = "https://image.tmdb.org/t/p/w500/";
  static String YOUTUBE_THUMBMAIL = "http://img.youtube.com/vi/";

  static openYoutube(String key) async{

    String url="https://www.youtube.com/watch?v=$key";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
//https://api.themoviedb.org/3/movie/popular?api_key=3f1cd7fa782a61778afe7e6ceb8d1765


extension StringExtension on String {
  bool get isEmailValid {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}
