import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/data/model/movie.dart';
import 'file:///D:/Flutter/movie_app/lib/ui/details/movie_details.dart';
import 'package:movieapp/util/Constants.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> MovieDetails(movie: movie,))
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: Image.network(
                      "${Constanst.BASE_POSTER_URL}${movie.poster_path}",
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              child: Text(
                movie.title,
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            SizedBox(height: 10),
            Padding(
                child: FlutterRatingBarIndicator(
                  rating: movie.vote_average.toDouble(),
                  itemCount: 5,
                  itemSize: 10.0,
                  emptyColor: Colors.amber.withAlpha(50),
                ),
                padding: EdgeInsets.only(left: 10.0, right: 10.0)),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Release Data",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    movie.release_date,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
