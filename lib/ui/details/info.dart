import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/data/model/movie.dart';

class Info extends StatelessWidget {
  final Movie movie;

  Info({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
            child: Text(
              "Overview:",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
            child: Text(
              movie.overview,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: Text(
                  "Release Data :",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                padding: EdgeInsets.only( left: 8.0, right: 8.0),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                movie.release_date,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Vote Count:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                "${movie.vote_count}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Rating:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              FlutterRatingBarIndicator(
                rating: movie.vote_average.toDouble(),
                itemCount: 10,
                itemSize: 10.0,
                emptyColor: Colors.amber.withAlpha(50),
              )
            ],
          ),
        ],
      ),
    );
  }
}
