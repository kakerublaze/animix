class GetMovieRelatedVideosResponseModel {
  int? id;
  List<MovieRelatedVideos>? movieRelatedVideos;

  GetMovieRelatedVideosResponseModel({this.id, this.movieRelatedVideos});

  GetMovieRelatedVideosResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      movieRelatedVideos = <MovieRelatedVideos>[];
      json['results'].forEach((v) {
        movieRelatedVideos!.add(MovieRelatedVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (movieRelatedVideos != null) {
      data['results'] = movieRelatedVideos!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    data['key'] = key;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['published_at'] = publishedAt;
    data['id'] = id;
    return data;
  }
}
