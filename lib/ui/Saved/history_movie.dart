import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
        /* return Dismissible(
          key: Key(movies[position].id.toString()),
          child: FavItem(
            movie: this.movies[position],
          ),
          onDismissed: (direction){

          },
          background: Container(color: Colors.red,),
          secondaryBackground: Container(color: Colors.green,),
          direction: DismissDirection.endToStart,

        );*/
        return Slidable(
          direction: Axis.horizontal,
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: FavItem(
            movie: this.movies[position],
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                removeMovieFromFavorite(position);

              },
            )
          ],
        );
      },
      itemCount: movies.length,
      padding: EdgeInsets.all(5.0),
    );
  }

  void _getData() async {
    var result = await helper.getMovies();
    setState(() {
      movies = result;
    });
  }

  void removeMovieFromFavorite(int position) {
    helper.deleteMovie(movies[position].id).then((result) {
      setState(() {
        movies.removeAt(position);
      });
    });
  }
}
