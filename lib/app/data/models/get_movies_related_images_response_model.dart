class GetMovieRelatedImagesResponseModel {
  List<ImageDataModel>? backdrops;
  int? id;
  List<ImageDataModel>? logos;
  List<ImageDataModel>? posters;

  GetMovieRelatedImagesResponseModel({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });

  GetMovieRelatedImagesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <ImageDataModel>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(ImageDataModel.fromJson(v));
      });
    }
    id = json['id'];
    if (json['logos'] != null) {
      logos = <ImageDataModel>[];
      json['logos'].forEach((v) {
        logos!.add(ImageDataModel.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <ImageDataModel>[];
      json['posters'].forEach((v) {
        posters!.add(ImageDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (backdrops != null) {
      data['backdrops'] = backdrops!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (logos != null) {
      data['logos'] = logos!.map((v) => v.toJson()).toList();
    }
    if (posters != null) {
      data['posters'] = posters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageDataModel {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  ImageDataModel({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  ImageDataModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['iso_639_1'] = iso6391;
    data['file_path'] = filePath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}
