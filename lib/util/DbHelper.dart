import 'dart:io';

import 'package:movieapp/data/database/MovieModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  /*
  * For Singleton purpose
  * */

  static final DbHelper _dbHelper = DbHelper.internal();

  DbHelper.internal();

  factory DbHelper() => _dbHelper;

  /*Table info*/
  String tblName = "movie";
  String colId = "id";
  String colTitle = "title";
  String colOverview = "overview";
  String colReleaseData = "release_data";
  String colVoteCount = "vote_count";
  String colVoteAverage = "vote_average";
  String colPosterPath = "poster_path";

  /*Database Creation and initialization*/
  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDatabase();
    }
    return _db;
  }

  Future<Database> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "movie.db";
    var dbMovie = await openDatabase(
        path, version: 1, onCreate: _createDatabase);

    return dbMovie;
  }

  void _createDatabase(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblName($colId INTEGER PRIMARY KEY, $colTitle TEXT, " +
            "$colOverview TEXT, $colReleaseData TEXT, $colVoteCount INTEGER,"
                " $colVoteAverage DOUBLE, $colPosterPath TEXT)");
  }


  /*Recommended functionality*/

  Future<int> insertMovie(MovieDb movie) async {
    Database db = await this.db;
    return await db.insert(tblName, movie.toMap());
  }

  Future<List<MovieDb>> getMovies() async {
    Database db = await this.db;
    var result= await db.rawQuery("SELECT * FROM $tblName");
    List<MovieDb> movies =  List<MovieDb>();
    result.forEach((f) => movies.add(MovieDb.fromObject(f)));
    return movies;
  }

  Future<MovieDb> getMovie(int id) async {
    Database db = await this.db;
    List<Map> maps = await db.query(
        tblName,
        columns: [colId],
        where: '$colId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return MovieDb.fromObject(maps.first);
    }
    return null;
  }

  Future<int> deleteMovie(int id) async{
    Database db = await this.db;
    return db.delete(tblName,where: '$colId = ?',whereArgs: [id]);
  }


}
