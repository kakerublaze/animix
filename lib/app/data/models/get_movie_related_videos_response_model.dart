class GetMovieRelatedVideosResponseModel {
  int? id;
  List<MovieRelatedVideos>? movieRelatedVideos;

  GetMovieRelatedVideosResponseModel({this.id, this.movieRelatedVideos});

  GetMovieRelatedVideosResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      movieRelatedVideos = <MovieRelatedVideos>[];
      json['results'].forEach((v) {
        movieRelatedVideos!.add(new MovieRelatedVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.movieRelatedVideos != null) {
      data['results'] = this.movieRelatedVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieRelatedVideos {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  MovieRelatedVideos({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  MovieRelatedVideos.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    data['key'] = this.key;
    data['site'] = this.site;
    data['size'] = this.size;
    data['type'] = this.type;
    data['official'] = this.official;
    data['published_at'] = this.publishedAt;
    data['id'] = this.id;
    return data;
  }
}
