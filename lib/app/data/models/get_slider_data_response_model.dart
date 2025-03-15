class GetSliderDataResponseModel {
  int? currentPage;
  bool? hasNextPage;
  List<SliderData>? trendingMovies;
  int? totalResults;
  int? totalPages;

  GetSliderDataResponseModel({
    this.currentPage,
    this.hasNextPage,
    this.trendingMovies,
    this.totalResults,
    this.totalPages,
  });

  GetSliderDataResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      trendingMovies = <SliderData>[];
      json['results'].forEach((v) {
        trendingMovies!.add(SliderData.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    if (trendingMovies != null) {
      data['results'] = trendingMovies!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = totalResults;
    data['totalPages'] = totalPages;
    return data;
  }
}

class SliderData {
  int? id;
  String? title;
  String? image;
  String? type;
  double? rating;
  String? releaseDate;

  SliderData({
    this.id,
    this.title,
    this.image,
    this.type,
    this.rating,
    this.releaseDate,
  });

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
    rating =
        json['rating'] != null && json['rating'] != ''
            ? json['rating'].toDouble()
            : null;
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['type'] = type;
    data['rating'] = rating;
    data['releaseDate'] = releaseDate;
    return data;
  }
}
