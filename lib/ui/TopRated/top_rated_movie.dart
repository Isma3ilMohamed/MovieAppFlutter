import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movies_response.dart';

import '../items/movie_item.dart';
import 'TopRatedBloc.dart';

class TopRatedMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TopRatedState();
}

class TopRatedState extends State<TopRatedMovies> {


  @override
  void initState() {
    super.initState();
    topRatedBloc.getTopRatedMovie();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MoviesResponse>(
      stream: topRatedBloc.topRatedSubject.stream,
      builder: (context,snapshot){
        if(snapshot.hasData){
            return Container(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(4),
                childAspectRatio: 1.0 / 1.0,
                children: snapshot.data.results.map((e) => MovieItem(e)).toList(),
              ),
            );
        }else if(snapshot.hasError){
          return Center(
            child: Text("No Movie Found"),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  @override
  void dispose() {
    topRatedBloc.dispose();
    super.dispose();
  }

}
