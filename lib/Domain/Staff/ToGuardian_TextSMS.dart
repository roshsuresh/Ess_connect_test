class TextSMS_ToGuardian_initialValues {
  bool? isClassTeacher;
  bool? isDualAttendance;
  List<TextSMS_ToGuardian_course>? course;

  TextSMS_ToGuardian_initialValues(
      {this.isClassTeacher, this.isDualAttendance, this.course});

  TextSMS_ToGuardian_initialValues.fromJson(Map<String, dynamic> json) {
    isClassTeacher = json['isClassTeacher'];
    isDualAttendance = json['isDualAttendance'];
    if (json['course'] != null) {
      course = [];
      json['course'].forEach((v) {
        course!.add(TextSMS_ToGuardian_course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isClassTeacher'] = this.isClassTeacher;
    data['isDualAttendance'] = this.isDualAttendance;
    if (this.course != null) {
      data['course'] = this.course!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

//course

class TextSMS_ToGuardian_course {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  TextSMS_ToGuardian_course(
      {this.value, this.text, this.selected, this.active, this.order});

  TextSMS_ToGuardian_course.fromJson(Map<String, dynamic> json) {
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

//Division

class TextSMS_ToGuardian_Division {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  TextSMS_ToGuardian_Division(
      {this.value, this.text, this.selected, this.active, this.order});

  TextSMS_ToGuardian_Division.fromJson(Map<String, dynamic> json) {
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

//View
class TExtSMS_VIEW_byStaff {
  String? admnNo;
  String? name;
  int? rollNo;
  String? mobNo;
  String? division;
  String? course;
  bool? selected;

  TExtSMS_VIEW_byStaff(
      {this.admnNo,
      this.name,
      this.rollNo,
      this.mobNo,
      this.division,
      this.course,
      this.selected});

  TExtSMS_VIEW_byStaff.fromJson(Map<String, dynamic> json) {
    admnNo = json['admnNo'];
    name = json['name'];
    rollNo = json['rollNo'];
    mobNo = json['mobNo'];
    division = json['division'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admnNo'] = this.admnNo;
    data['name'] = this.name;
    data['rollNo'] = this.rollNo;
    data['mobNo'] = this.mobNo;
    data['division'] = this.division;
    data['course'] = this.course;
    return data;
  }
}
