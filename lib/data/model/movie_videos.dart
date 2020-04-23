import 'package:movieapp/data/model/Video.dart';
class MovieVideos {
    final int id;
    final List<Video> results;

    MovieVideos({this.id, this.results});

    factory MovieVideos.fromJson(Map<String, dynamic> json) {
        return MovieVideos(
            id: json['id'], 
            results: json['results'] != null ? (json['results'] as List).map((i) => Video.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}