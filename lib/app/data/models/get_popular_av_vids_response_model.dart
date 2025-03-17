class GetPopularAVVidsResponseModel {
  int? count;
  int? start;
  int? perPage;
  int? page;
  int? timeMs;
  int? totalCount;
  int? totalPages;
  List<AVVids>? avVids;

  GetPopularAVVidsResponseModel({
    this.count,
    this.start,
    this.perPage,
    this.page,
    this.timeMs,
    this.totalCount,
    this.totalPages,
    this.avVids,
  });

  GetPopularAVVidsResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    perPage = json['per_page'];
    page = json['page'];
    timeMs = json['time_ms'];
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    if (json['videos'] is List) {
      avVids = (json['videos'] as List).map((v) => AVVids.fromJson(v)).toList();
    } else {
      avVids = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['start'] = start;
    data['per_page'] = perPage;
    data['page'] = page;
    data['time_ms'] = timeMs;
    data['total_count'] = totalCount;
    data['total_pages'] = totalPages;
    if (avVids != null) {
      data['videos'] = avVids!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AVVids {
  String? id;
  String? title;
  String? keywords;
  int? views;
  String? rate;
  String? url;
  String? added;
  int? lengthSec;
  String? lengthMin;
  String? embed;
  DefaultThumb? defaultThumb;
  List<DefaultThumb>? thumbs;

  AVVids({
    this.id,
    this.title,
    this.keywords,
    this.views,
    this.rate,
    this.url,
    this.added,
    this.lengthSec,
    this.lengthMin,
    this.embed,
    this.defaultThumb,
    this.thumbs,
  });

  AVVids.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    keywords = json['keywords'];
    views = json['views'];
    rate = json['rate'];
    url = json['url'];
    added = json['added'];
    lengthSec = json['length_sec'];
    lengthMin = json['length_min'];
    embed = json['embed'];
    defaultThumb =
        json['default_thumb'] != null
            ? DefaultThumb.fromJson(json['default_thumb'])
            : null;
    if (json['thumbs'] != null) {
      thumbs = <DefaultThumb>[];
      json['thumbs'].forEach((v) {
        thumbs!.add(DefaultThumb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['keywords'] = keywords;
    data['views'] = views;
    data['rate'] = rate;
    data['url'] = url;
    data['added'] = added;
    data['length_sec'] = lengthSec;
    data['length_min'] = lengthMin;
    data['embed'] = embed;
    if (defaultThumb != null) {
      data['default_thumb'] = defaultThumb!.toJson();
    }
    if (thumbs != null) {
      data['thumbs'] = thumbs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DefaultThumb {
  String? size;
  int? width;
  int? height;
  String? src;

  DefaultThumb({this.size, this.width, this.height, this.src});

  DefaultThumb.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    data['src'] = src;
    return data;
  }
}
