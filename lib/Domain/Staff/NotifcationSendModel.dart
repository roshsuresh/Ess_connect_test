class Results {
  String? createdDate;
  List<String>? toStudent;
  String? fromStaff;
  String? title;
  String? body;

  Results(
      {this.createdDate,
      this.toStudent,
      this.fromStaff,
      this.title,
      this.body});

  Results.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    toStudent = json['toStudent'].cast<String>();
    fromStaff = json['fromStaff'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['createdDate'] = createdDate;
    data['toStudent'] = toStudent;
    data['fromStaff'] = fromStaff;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
