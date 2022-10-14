class TextSMSToGuardian {
  List<TextSMSToGuardianCourseList>? courseList;
  bool? isClassTeacher;
  TextSMSToGuardian({this.courseList, this.isClassTeacher});
  TextSMSToGuardian.fromJson(Map<String, dynamic> json) {
    if (json['courseList'] != null) {
      courseList = [];
      json['courseList'].forEach((v) {
        courseList!.add(TextSMSToGuardianCourseList.fromJson(v));
      });
    }
    isClassTeacher = json['isClassTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courseList != null) {
      data['courseList'] = this.courseList!.map((v) => v.toJson()).toList();
    }

    data['isClassTeacher'] = this.isClassTeacher;
    return data;
  }
}

class TextSMSToGuardianCourseList {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  TextSMSToGuardianCourseList(
      {this.value, this.text, this.selected, this.active, this.order});

  TextSMSToGuardianCourseList.fromJson(Map<String, dynamic> json) {
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

class TextSMSToGuardianDivisionList {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  TextSMSToGuardianDivisionList(
      {this.value, this.text, this.selected, this.active, this.order});

  TextSMSToGuardianDivisionList.fromJson(Map<String, dynamic> json) {
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
class TextSMSToGuardianCourseDivision_notification_Stf {
  String? studentId;
  String? guardianId;

  String? admnNo;
  String? name;
  int? rollNo;
  String? mobNo;
  String? division;
  String? course;
  bool? selected;

  TextSMSToGuardianCourseDivision_notification_Stf(
      {this.studentId,
      this.guardianId,
      this.admnNo,
      this.name,
      this.rollNo,
      this.mobNo,
      this.division,
      this.course,
      this.selected});

  TextSMSToGuardianCourseDivision_notification_Stf.fromJson(
      Map<String, dynamic> json) {
    studentId = json['studentId'];
    guardianId = json['guardianId'];
    admnNo = json['admnNo'];
    name = json['name'];
    rollNo = json['rollNo'];
    mobNo = json['mobNo'];
    division = json['division'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['guardianId'] = this.guardianId;
    data['admnNo'] = this.admnNo;
    data['name'] = this.name;
    data['rollNo'] = this.rollNo;
    data['mobNo'] = this.mobNo;
    data['division'] = this.division;
    data['course'] = this.course;
    return data;
  }
}

//SMS Format

class SmsSettingsByStaff {
  List<SmsFormatByStaff>? smsFormat;
  String? applySMSFormatApproval;

  SmsSettingsByStaff({this.smsFormat, this.applySMSFormatApproval});

  SmsSettingsByStaff.fromJson(Map<String, dynamic> json) {
    if (json['smsFormat'] != null) {
      smsFormat = [];
      json['smsFormat'].forEach((v) {
        smsFormat!.add(SmsFormatByStaff.fromJson(v));
      });
    }
    applySMSFormatApproval = json['applySMSFormatApproval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.smsFormat != null) {
      data['smsFormat'] = this.smsFormat!.map((v) => v.toJson()).toList();
    }
    data['applySMSFormatApproval'] = this.applySMSFormatApproval;
    return data;
  }
}

class SmsFormatByStaff {
  String? text;
  String? value;
  bool? isApproved;

  SmsFormatByStaff({this.text, this.value, this.isApproved});

  SmsFormatByStaff.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    data['isApproved'] = this.isApproved;
    return data;
  }
}

//sms formats complete view

class SmsFormatsCompleteview {
  String? id;
  String? name;
  String? smsBody;
  Null? content;
  bool? isApproved;

  SmsFormatsCompleteview(
      {this.id, this.name, this.smsBody, this.content, this.isApproved});

  SmsFormatsCompleteview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    smsBody = json['smsBody'];
    content = json['content'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['smsBody'] = this.smsBody;
    data['content'] = this.content;
    data['isApproved'] = this.isApproved;
    return data;
  }
}
