import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/data/database/MovieModel.dart';
import 'package:movieapp/util/Constants.dart';

class FavItem extends StatelessWidget {
  final MovieDb movie;

  FavItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
                "${Constanst.BASE_POSTER_URL}${movie.poster_path}",
                fit: BoxFit.cover,width: 150.0,height: 150.0,),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
/*              Padding(
                child: Text(
                  movie.overview,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 10.0,
                  ),
                  textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 4,
                ),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
              ),*/
/*
              Container(child: Row(
                children: [
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
                      movie.release_data,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              ),),
*/
              SizedBox(height: 10),
              Padding(
                  child: FlutterRatingBarIndicator(
                    rating: movie.vote_overage,
                    itemCount: 10,
                    itemSize: 10.0,
                    emptyColor: Colors.amber.withAlpha(50),
                  ),
                  padding: EdgeInsets.only(left: 10.0, right: 10.0)),
            ],
          )
        ],
      ),
    );
  }
}
