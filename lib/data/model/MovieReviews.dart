class MovieReviews {
    final int id;
    final int page;
    final List<Review> results;
    final int total_pages;
    final int total_results;

    MovieReviews({this.id, this.page, this.results, this.total_pages, this.total_results});

    factory MovieReviews.fromJson(Map<String, dynamic> json) {
        return MovieReviews(
            id: json['id'],
            page: json['page'],
            results: json['results'] != null ? (json['results'] as List).map((i) => Review.fromJson(i)).toList() : null,
            total_pages: json['total_pages'],
            total_results: json['total_results'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['page'] = this.page;
        data['total_pages'] = this.total_pages;
        data['total_results'] = this.total_results;
        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Review {
    final String author;
    final String content;
    final String id;
    final String url;

    Review({this.author, this.content, this.id, this.url});

    factory Review.fromJson(Map<String, dynamic> json) {
        return Review(
            author: json['author'],
            content: json['content'],
            id: json['id'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['author'] = this.author;
        data['content'] = this.content;
        data['id'] = this.id;
        data['url'] = this.url;
        return data;
    }
}