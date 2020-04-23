import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movies_response.dart';
import 'package:movieapp/ui/items/movie_item.dart';


import 'MostPopularBloc.dart';
class PopularMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PopularState();
}

class PopularState extends State<PopularMovies> {
  @override
  void initState() {
    super.initState();
    mostPopularBloc.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MoviesResponse>(
      stream: mostPopularBloc.mostPopularSubject.stream,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Container(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(4),
              childAspectRatio: 8.0 / 9.0,
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

}
