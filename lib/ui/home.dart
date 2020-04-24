
import 'package:flutter/material.dart';
import 'package:movieapp/ui/Saved/history_movie.dart';
import 'package:movieapp/ui/MostPopular/popular_movie.dart';
import 'package:movieapp/ui/TopRated/top_rated_movie.dart';
import 'package:movieapp/util/DbHelper.dart';


DbHelper helper = DbHelper();


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedPage = 0;
  final _pageOption = [
    TopRatedMovies(),
    PopularMovies(),
    HistoryMovies(),
  ];

  @override
  void initState() {
    helper.initializeDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: _pageOption[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Top Rated")),
          BottomNavigationBarItem(icon: Icon(Icons.autorenew), title: Text("Popular")),
          BottomNavigationBarItem(icon: Icon(Icons.history), title: Text("History")),
        ],
      ),
    );
  }
}
