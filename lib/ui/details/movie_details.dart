import 'package:flutter/material.dart';
import 'package:movieapp/data/database/MovieModel.dart';
import 'package:movieapp/data/model/movie.dart';
import 'package:movieapp/ui/details/review/review.dart';
import 'package:movieapp/ui/details/video/videos.dart';
import 'package:movieapp/util/Constants.dart';
import 'package:movieapp/util/DbHelper.dart';

import 'info.dart';


DbHelper helper = DbHelper();


class MovieDetails extends StatefulWidget {
  final Movie movie;

  MovieDetails({this.movie});

  @override
  State<StatefulWidget> createState() => _MovieDetailsState(movie: movie);
}

class _MovieDetailsState extends State<MovieDetails>
    with SingleTickerProviderStateMixin {

  _MovieDetailsState({this.movie});

  TabController _tabController;

  Movie movie;
  Icon favIcon=Icon(Icons.favorite_border,color: Colors.white,);
  bool isFav=false;


  @override
  void initState() {
    super.initState();
    checkIfMovieIsFavoriteOrNOt();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("${movie.title}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "${Constanst.BASE_POSTER_URL}${movie.poster_path}",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Info"),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "Reviews"),
                      Tab(icon: Icon(Icons.ondemand_video), text: "Videos"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: TabBarView(

              children: [
                Info(
                  movie: movie,
                ),
                Review(
                  movie: movie,
                ),
                Videos(
                  movie: movie,
                )
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: favIcon,
        onPressed: (){
          addOrRemoveFromFavorite();
        },
      ),

    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void checkIfMovieIsFavoriteOrNOt() async {
    MovieDb result= await helper.getMovie(movie.id);
    setState(() {
      isFav =  result!=null;
      result == null ? favIcon=Icon(Icons.favorite_border,color: Colors.white,) :favIcon =Icon(Icons.favorite,color: Colors.white,);
    });
  }

  void addOrRemoveFromFavorite() async {
    if(isFav){
      //Remove from favorite
      int result = await helper.deleteMovie(movie.id);
      setState(() {
        isFav=false;
        favIcon=Icon(Icons.favorite_border,color: Colors.white,);
      });

    }else{
      //Add to Favorite
      int result = await helper.insertMovie(MovieDb(movie.id, movie.title, movie.overview,
          movie.release_date, movie.vote_count, movie.vote_average, movie.poster_path));

      setState(() {
        isFav=true;
        favIcon=Icon(Icons.favorite,color: Colors.white,);
      });
    }
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
