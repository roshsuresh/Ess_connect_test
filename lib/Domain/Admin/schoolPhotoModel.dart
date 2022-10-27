class Schoolphoto {
  String? name;
  String? extension;
  String? path;
  String? url;

  Schoolphoto({
    this.name,
    this.extension,
    this.path,
    this.url,
  });

  Schoolphoto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['extension'] = this.extension;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}
