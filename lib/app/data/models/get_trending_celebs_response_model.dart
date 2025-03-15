class GetTrendingCelebsResponseModel {
  int? page;
  List<TrendingCelebs>? trendingCelebs;
  int? totalPages;
  int? totalResults;

  GetTrendingCelebsResponseModel({
    this.page,
    this.trendingCelebs,
    this.totalPages,
    this.totalResults,
  });

  GetTrendingCelebsResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      trendingCelebs = <TrendingCelebs>[];
      json['results'].forEach((v) {
        trendingCelebs!.add(TrendingCelebs.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (trendingCelebs != null) {
      data['results'] = trendingCelebs!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class TrendingCelebs {
  int? id;
  String? name;
  String? originalName;
  String? mediaType;
  bool? adult;
  double? popularity;
  int? gender;
  String? knownForDepartment;
  String? profilePath;

  TrendingCelebs({
    this.id,
    this.name,
    this.originalName,
    this.mediaType,
    this.adult,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
  });

  TrendingCelebs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    mediaType = json['media_type'];
    adult = json['adult'];
    popularity = json['popularity'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['popularity'] = popularity;
    data['gender'] = gender;
    data['known_for_department'] = knownForDepartment;
    data['profile_path'] = profilePath;
    return data;
  }
}
