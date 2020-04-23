
import 'package:flutter/material.dart';
import 'package:movieapp/ui/details/review/ReviewBloc.dart';
import 'package:movieapp/data/model/MovieReviews.dart';
import 'package:movieapp/data/model/movie.dart';
import 'package:movieapp/ui/items/review_item.dart';

class Review extends StatefulWidget {
  final Movie movie;

  Review({this.movie});

  @override
  _ReviewState createState() => _ReviewState(movie: movie);
}

class _ReviewState extends State<Review> {
  final Movie movie;

  _ReviewState({this.movie});

  @override
  void initState() {
    reviewBloc.getMovieReviews(movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieReviews>(
      stream: reviewBloc.movieReviewsSubject.stream,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(5.0) ,
            itemCount: snapshot.data.results.length,
            itemBuilder: (context,position){
              return ReviewItem(snapshot.data.results[position]);
            },
          );
        }else if(snapshot.hasError){
          return Center(
            child: Text("No Review Found"),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  @override
  void dispose() {
    reviewBloc.dispose();
    super.dispose();
  }
}