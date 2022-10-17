// class NotificationToGuardian_initialValues {
//   bool? isClassTeacher;
//   bool? isDualAttendance;
//   List<CommunicationToGuardian_course>? course;

//   NotificationToGuardian_initialValues(
//       {this.isClassTeacher, this.isDualAttendance, this.course});

//   NotificationToGuardian_initialValues.fromJson(Map<String, dynamic> json) {
//     isClassTeacher = json['isClassTeacher'];
//     isDualAttendance = json['isDualAttendance'];
//     if (json['course'] != null) {
//       course = [];
//       json['course'].forEach((v) {
//         course!.add(CommunicationToGuardian_course.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['isClassTeacher'] = this.isClassTeacher;
//     data['isDualAttendance'] = this.isDualAttendance;
//     if (this.course != null) {
//       data['course'] = this.course!.map((v) => v.toJson()).toList();
//     }

//     return data;
//   }
// }

// //course

// class CommunicationToGuardian_course {
//   String? value;
//   String? text;
//   Null selected;
//   Null active;
//   int? order;

//   CommunicationToGuardian_course(
//       {this.value, this.text, this.selected, this.active, this.order});

//   CommunicationToGuardian_course.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     text = json['text'];
//     selected = json['selected'];
//     active = json['active'];
//     order = json['order'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['text'] = this.text;
//     data['selected'] = this.selected;
//     data['active'] = this.active;
//     data['order'] = this.order;
//     return data;
//   }
// }

// //Division

// class CommunicationToGuardian_Division {
//   String? value;
//   String? text;
//   Null selected;
//   Null active;
//   Null order;

//   CommunicationToGuardian_Division(
//       {this.value, this.text, this.selected, this.active, this.order});

//   CommunicationToGuardian_Division.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     text = json['text'];
//     selected = json['selected'];
//     active = json['active'];
//     order = json['order'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['text'] = this.text;
//     data['selected'] = this.selected;
//     data['active'] = this.active;
//     data['order'] = this.order;
//     return data;
//   }
// }

class NotificationToGuardian_initialValues {
  List<CommunicationToGuardian_course>? courseList;
  bool? isClassTeacher;
  NotificationToGuardian_initialValues({this.courseList, this.isClassTeacher});
  NotificationToGuardian_initialValues.fromJson(Map<String, dynamic> json) {
    if (json['courseList'] != null) {
      courseList = [];
      json['courseList'].forEach((v) {
        courseList!.add(CommunicationToGuardian_course.fromJson(v));
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

class CommunicationToGuardian_course {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  CommunicationToGuardian_course(
      {this.value, this.text, this.selected, this.active, this.order});

  CommunicationToGuardian_course.fromJson(Map<String, dynamic> json) {
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

class CommunicationToGuardian_Division {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  CommunicationToGuardian_Division(
      {this.value, this.text, this.selected, this.active, this.order});

  CommunicationToGuardian_Division.fromJson(Map<String, dynamic> json) {
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
// class StudentViewbyCourseDivision_notification_Stf {
//   String? studentId;
//   String? guardianId;
//   String? admnNo;
//   String? name;
//   int? rollNo;
//   String? mobNo;
//   String? division;
//   String? course;
//   bool? selected;
//
//   StudentViewbyCourseDivision_notification_Stf(
//       {required this.studentId,
//       required this.guardianId,
//       this.admnNo,
//       this.name,
//       this.rollNo,
//       this.mobNo,
//       this.division,
//       this.course,
//       this.selected});
//
//   StudentViewbyCourseDivision_notification_Stf.fromJson(
//       Map<String, dynamic> json) {
//     studentId = json['studentId'];
//     guardianId = json['guardianId'];
//     admnNo = json['admnNo'];
//     name = json['name'];
//     rollNo = json['rollNo'];
//     mobNo = json['mobNo'];
//     division = json['division'];
//     course = json['course'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['studentId'] = this.studentId;
//     data['guardianId'] = this.guardianId;
//     data['admnNo'] = this.admnNo;
//     data['name'] = this.name;
//     data['rollNo'] = this.rollNo;
//     data['mobNo'] = this.mobNo;
//     data['division'] = this.division;
//     data['course'] = this.course;
//     return data;
//   }
// }

class StudentViewbyCourseDivision_notification_Stf {
  StudentViewbyCourseDivision_notification_Stf({
    required this.studentId,
    required this.name,
    required this.admnNo,
    required this.division,
    required this.course,
    required this.rollNo,
    required this.mobNo,
    this.selected,
  });

  String studentId;
  String name;
  String? admnNo;
  String? division;
  String? course;
  int? rollNo;
  String? mobNo;
  bool? selected;
  factory StudentViewbyCourseDivision_notification_Stf.fromJson(Map<String, dynamic> json) =>
      StudentViewbyCourseDivision_notification_Stf(
        studentId: json["studentId"],
        name: json["name"],
        admnNo: json["admnNo"],
        division: json["division"],
        course: json["course"],
        rollNo: json["rollNo"],
        mobNo: json["mobNo"],
      );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "name": name,
    "admnNo": admnNo,
    "division": division,
    "course": course,
    "rollNo": rollNo,
    "mobNo": mobNo,
    "division": division,
  };
}

