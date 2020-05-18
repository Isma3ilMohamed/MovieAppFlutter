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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetails(
                  movie: movie,
                )));
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                "${Constanst.BASE_POSTER_URL}${movie.poster_path}",
                fit: BoxFit.cover, width: 200.0,
                height: 220.0,
              ),
            ),
            Positioned(
                left: 1,
                right: 1,
                bottom: 1,
                child: Container(
                  constraints: BoxConstraints(maxHeight: 100),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.title,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent[400],
                          fontSize: 10.0,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Release Data :",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            movie.release_date,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FlutterRatingBarIndicator(
                        rating: movie.vote_average.toDouble(),
                        itemCount: 10,
                        itemSize: 10.0,
                        emptyColor: Colors.amber.withAlpha(50),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
