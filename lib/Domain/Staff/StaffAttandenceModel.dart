class Attendenceinitvalues {
  bool? isClassTeacher;
  bool? isDualAttendance;
  List<AttendenceCourse>? course;

  Attendenceinitvalues(
      {this.isClassTeacher, this.isDualAttendance, this.course});

  Attendenceinitvalues.fromJson(Map<String, dynamic> json) {
    isClassTeacher = json['isClassTeacher'];
    isDualAttendance = json['isDualAttendance'];
    if (json['course'] != null) {
      course = [];
      json['course'].forEach((v) {
        course!.add(AttendenceCourse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isClassTeacher'] = this.isClassTeacher;
    data['isDualAttendance'] = this.isDualAttendance;
    if (this.course != null) {
      data['course'] = this.course!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class AttendenceCourse {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  AttendenceCourse(
      {this.value, this.text, this.selected, this.active, this.order});

  AttendenceCourse.fromJson(Map<String, dynamic> json) {
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

class AttendenceDivisions {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  AttendenceDivisions(
      {this.value, this.text, this.selected, this.active, this.order});

  AttendenceDivisions.fromJson(Map<String, dynamic> json) {
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
