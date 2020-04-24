class MovieDb{
  int _id;
  String _title;
  String _overview;
  String _release_data;
  int _vote_count;
  double _vote_overage;
  String _poster_path;

  MovieDb(this._id, this._title, this._overview, this._release_data,
      this._vote_count, this._vote_overage, this._poster_path);

  String get poster_path => _poster_path;

  set poster_path(String value) {
    _poster_path = value;
  }

  double get vote_overage => _vote_overage;

  set vote_overage(double value) {
    _vote_overage = value;
  }

  int get vote_count => _vote_count;

  set vote_count(int value) {
    _vote_count = value;
  }

  String get release_data => _release_data;

  set release_data(String value) {
    _release_data = value;
  }

  String get overview => _overview;

  set overview(String value) {
    _overview = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;


  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["id"]=_id;
    map["title"]=_title;
    map["overview"]=_overview;
    map["release_data"]=_release_data;
    map["vote_count"]=_vote_count;
    map["vote_average"]=_vote_overage;
    map["poster_path"]=_poster_path;
    return map;
  }

  MovieDb.fromObject(dynamic o){
    this._id=o["id"];
    this._title=o["title"];
    this._overview=o["overview"];
    this._release_data=o["release_data"];
    this._vote_count=o["vote_count"];
    this._vote_overage=o["vote_average"];
    this._poster_path=o["poster_path"];
  }

}