class GallerySendStaffInitialvalues {
  List<GalleryCourseListStaff>? courseList;

  bool? isClassTeacher;

  GallerySendStaffInitialvalues({this.courseList, this.isClassTeacher});

  GallerySendStaffInitialvalues.fromJson(Map<String, dynamic> json) {
    if (json['courseList'] != null) {
      courseList = [];
      json['courseList'].forEach((v) {
        courseList!.add(GalleryCourseListStaff.fromJson(v));
      });
    }

    isClassTeacher = json['isClassTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.courseList != null) {
      data['courseList'] = this.courseList!.map((v) => v.toJson()).toList();
    }

    data['isClassTeacher'] = this.isClassTeacher;
    return data;
  }
}

class GalleryCourseListStaff {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  GalleryCourseListStaff(
      {this.value, this.text, this.selected, this.active, this.order});

  GalleryCourseListStaff.fromJson(Map<String, dynamic> json) {
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

class GalleryDivisionListStaff {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  GalleryDivisionListStaff(
      {this.value, this.text, this.selected, this.active, this.order});

  GalleryDivisionListStaff.fromJson(Map<String, dynamic> json) {
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
