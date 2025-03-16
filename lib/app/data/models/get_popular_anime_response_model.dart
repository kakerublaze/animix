class GetPopularAnimeResponseModel {
  int? currentPage;
  bool? hasNextPage;
  List<PopularAnimeData>? popularAnimeDataList;

  GetPopularAnimeResponseModel({
    this.currentPage,
    this.hasNextPage,
    this.popularAnimeDataList,
  });

  GetPopularAnimeResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      popularAnimeDataList = <PopularAnimeData>[];
      json['results'].forEach((v) {
        popularAnimeDataList!.add(new PopularAnimeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['hasNextPage'] = this.hasNextPage;
    if (this.popularAnimeDataList != null) {
      data['results'] = this.popularAnimeDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PopularAnimeData {
  String? id;
  int? malId;
  Title? title;
  String? image;
  String? imageHash;
  Trailer? trailer;
  String? description;
  String? status;
  String? cover;
  String? coverHash;
  int? rating;
  int? releaseDate;
  String? color;
  List<String>? genres;
  int? totalEpisodes;
  int? duration;
  String? type;

  PopularAnimeData({
    this.id,
    this.malId,
    this.title,
    this.image,
    this.imageHash,
    this.trailer,
    this.description,
    this.status,
    this.cover,
    this.coverHash,
    this.rating,
    this.releaseDate,
    this.color,
    this.genres,
    this.totalEpisodes,
    this.duration,
    this.type,
  });

  PopularAnimeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    image = json['image'];
    imageHash = json['imageHash'];
    trailer =
        json['trailer'] != null ? new Trailer.fromJson(json['trailer']) : null;
    description = json['description'];
    status = json['status'];
    cover = json['cover'];
    coverHash = json['coverHash'];
    rating = json['rating'];
    releaseDate = json['releaseDate'];
    color = json['color'];
    genres = json['genres'].cast<String>();
    totalEpisodes = json['totalEpisodes'];
    duration = json['duration'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['malId'] = this.malId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['image'] = this.image;
    data['imageHash'] = this.imageHash;
    if (this.trailer != null) {
      data['trailer'] = this.trailer!.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    data['cover'] = this.cover;
    data['coverHash'] = this.coverHash;
    data['rating'] = this.rating;
    data['releaseDate'] = this.releaseDate;
    data['color'] = this.color;
    data['genres'] = this.genres;
    data['totalEpisodes'] = this.totalEpisodes;
    data['duration'] = this.duration;
    data['type'] = this.type;
    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  Title({this.romaji, this.english, this.native, this.userPreferred});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['romaji'] = this.romaji;
    data['english'] = this.english;
    data['native'] = this.native;
    data['userPreferred'] = this.userPreferred;
    return data;
  }
}

class Trailer {
  String? id;
  String? site;
  String? thumbnail;
  String? thumbnailHash;

  Trailer({this.id, this.site, this.thumbnail, this.thumbnailHash});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    site = json['site'];
    thumbnail = json['thumbnail'];
    thumbnailHash = json['thumbnailHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site'] = this.site;
    data['thumbnail'] = this.thumbnail;
    data['thumbnailHash'] = this.thumbnailHash;
    return data;
  }
}
