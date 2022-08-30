class GalleryModel {
  GalleryModel({
    this.title,
    this.galleryId,
    this.caption,
    this.url,
  });
  late final String? title;
  late final String? galleryId;
  late final String? caption;
  late final String? url;

  GalleryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    galleryId = json['galleryId'];
    caption = null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['galleryId'] = galleryId;
    _data['caption'] = caption;
    _data['url'] = url;
    return _data;
  }
}

class GalleryphotosModel {
  String? title;
  String? galleryId;
  String? caption;
  String? url;

  GalleryphotosModel({this.title, this.galleryId, this.caption, this.url});

  GalleryphotosModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    galleryId = json['galleryId'];
    caption = json['caption'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['galleryId'] = this.galleryId;
    data['caption'] = this.caption;
    data['url'] = this.url;
    return data;
  }
}
