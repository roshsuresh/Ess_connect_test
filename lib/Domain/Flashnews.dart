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
