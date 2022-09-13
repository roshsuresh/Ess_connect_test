class SiblingsNameModel {
  String? id;
  String? name;

  SiblingsNameModel({this.id, this.name});

  SiblingsNameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
