import 'package:movieapp/data/model/movies_response.dart';
import 'package:movieapp/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class MostPopularBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MoviesResponse> _mostPopularSubject= BehaviorSubject<MoviesResponse>();

  BehaviorSubject<MoviesResponse> get mostPopularSubject => _mostPopularSubject;



  getPopularMovies() async{
    _mostPopularSubject.sink.add(await _movieRepository.getPopularMovie());
  }


  dispose(){
    _mostPopularSubject.close();
  }


}

final mostPopularBloc = MostPopularBloc();
