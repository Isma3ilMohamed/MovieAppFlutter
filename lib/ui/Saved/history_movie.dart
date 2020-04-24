import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/data/database/MovieModel.dart';
import 'package:movieapp/ui/items/fav_item.dart';
import 'package:movieapp/util/DbHelper.dart';

DbHelper helper = DbHelper();

class HistoryMovies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryState();
}

class HistoryState extends State<HistoryMovies> {
  List<MovieDb> movies;


  @override
  void initState() {
    if (movies == null) {
      movies = List<MovieDb>();
      _getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: _isAnyItems()
            ? _buildListView()
            : Text(
                "You don't have any saved Movie",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title,
              ),
      ),
    );
  }

  bool _isAnyItems() => movies.length != 0;

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (context, position) {
        return FavItem(
          movie: this.movies[position],
        );
      },
      itemCount: movies.length,
      padding: EdgeInsets.all(5.0),
    );
  }

  void _getData() async {
    var result = await helper.getMovies();
    setState(()  {
      movies = result;
    });
  }
}
