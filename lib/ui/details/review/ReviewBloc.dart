
import 'package:movieapp/data/model/MovieReviews.dart';
import 'package:movieapp/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc{
  final MovieRepository _repository = MovieRepository();

  final BehaviorSubject<MovieReviews> _movieReviewsSubject=BehaviorSubject<MovieReviews>();
  BehaviorSubject<MovieReviews> get movieReviewsSubject => _movieReviewsSubject;


  getMovieReviews(int movieId) async{
    return _movieReviewsSubject.sink.add(await _repository.getMovieReviews(movieId));
  }

  dispose(){
    _movieReviewsSubject.close();
  }


}

final reviewBloc = ReviewBloc();