import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie.dart';
import 'package:movieapp/ui/details/review/review.dart';
import 'package:movieapp/ui/details/video/videos.dart';
import 'package:movieapp/util/Constants.dart';

import 'info.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  MovieDetails({this.movie});

  @override
  State<StatefulWidget> createState() => _MovieDetailsState(movie: movie);
}

class _MovieDetailsState extends State<MovieDetails>
    with SingleTickerProviderStateMixin {
  Movie movie;

  _MovieDetailsState({this.movie});

  TabController _tabController;

  @override
  void initState() {
    super.initState();

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
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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


