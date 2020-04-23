import 'package:movieapp/data/model/movies_response.dart';
import 'package:movieapp/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class TopRatedBloc {
  final MovieRepository _repository = MovieRepository();

  final BehaviorSubject<MoviesResponse> _topRatedSubject=BehaviorSubject<MoviesResponse>();


  BehaviorSubject<MoviesResponse> get topRatedSubject => _topRatedSubject;


  getTopRatedMovie() async{
    _topRatedSubject.sink.add(await _repository.getTopRatedMovies());
  }

  dispose(){
    _topRatedSubject.close();
  }
}

final topRatedBloc = TopRatedBloc();