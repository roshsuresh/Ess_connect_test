class FlashNewsModel {
  FlashNewsModel({
    required this.flashNews,
  });
  late final List<FlashNews> flashNews;

  FlashNewsModel.fromJson(Map<String, dynamic> json) {
    flashNews =
        List.from(json['flashNews']).map((e) => FlashNews.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flashNews'] = flashNews.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FlashNews {
  FlashNews({
    required this.flashNews,
  });
  late final String flashNews;

  FlashNews.fromJson(Map<String, dynamic> json) {
    flashNews = json['flashNews'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flashNews'] = flashNews;
    return _data;
  }
}

class FlashNewsModelStud {
  String? news;

  FlashNewsModelStud({this.news});

  FlashNewsModelStud.fromJson(Map<String, dynamic> json) {
    news = json['news'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news'] = this.news;
    return data;
  }
}

class FlashNewsMode {
  String? flashNews;

  FlashNewsMode({this.flashNews});

  FlashNewsMode.fromJson(Map<String, dynamic> json) {
    flashNews = json['flashNews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flashNews'] = this.flashNews;
    return data;
  }
}
