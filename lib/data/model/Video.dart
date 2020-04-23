class Video {
    final String id;
    final String iso_3166_1;
    final String iso_639_1;
    final String key;
    final String name;
    final String site;
    final int size;
    final String type;

    Video({this.id, this.iso_3166_1, this.iso_639_1, this.key, this.name, this.site, this.size, this.type});

    factory Video.fromJson(Map<String, dynamic> json) {
        return Video(
            id: json['id'], 
            iso_3166_1: json['iso_3166_1'], 
            iso_639_1: json['iso_639_1'], 
            key: json['key'], 
            name: json['name'], 
            site: json['site'], 
            size: json['size'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['iso_3166_1'] = this.iso_3166_1;
        data['iso_639_1'] = this.iso_639_1;
        data['key'] = this.key;
        data['name'] = this.name;
        data['site'] = this.site;
        data['size'] = this.size;
        data['type'] = this.type;
        return data;
    }
}