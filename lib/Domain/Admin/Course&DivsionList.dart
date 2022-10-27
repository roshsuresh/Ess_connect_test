//

class CourseListModel {
  String? courseId;
  String? name;
  int? sectionOrder;
  int? courseOrder;

  CourseListModel(
      {this.courseId, this.name, this.sectionOrder, this.courseOrder});

  CourseListModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    name = json['name'];
    sectionOrder = json['sectionOrder'];
    courseOrder = json['courseOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['name'] = this.name;
    data['sectionOrder'] = this.sectionOrder;
    data['courseOrder'] = this.courseOrder;
    return data;
  }
}

//Division

class DivisionListModel {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  DivisionListModel(
      {this.value, this.text, this.selected, this.active, this.order});

  DivisionListModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    selected = json['selected'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['selected'] = this.selected;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}
