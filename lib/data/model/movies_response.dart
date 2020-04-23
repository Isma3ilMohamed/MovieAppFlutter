import 'package:movieapp/data/model/movie.dart';
import 'dart:convert';

class MoviesResponse {
    final int page;
    final int total_pages;
    final int total_results;
    final List<Movie> results;

    MoviesResponse({this.page, this.total_pages, this.total_results, this.results});


    factory MoviesResponse.fromRawJson(String str) => MoviesResponse.fromJson(json.decode(str));

    factory MoviesResponse.fromJson(Map<String, dynamic> json) {
        return MoviesResponse(
            page: json['page'],
            total_pages: json['total_pages'],
            total_results: json['total_results'],
            results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x)))
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['page'] = this.page;
        data['total_pages'] = this.total_pages;
        data['total_results'] = this.total_results;
        data['results'] = List<dynamic>.from(results.map((e) => e.toJson()));
        return data;
    }
}