
import 'dart:convert';

class AttendaceInitialModel {
  AttendaceInitialModel({
    required this.attendenceinitvalues,
  });

  Attendenceinitvalues attendenceinitvalues;

  factory AttendaceInitialModel.fromJson(Map<String, dynamic> json) => AttendaceInitialModel(
    attendenceinitvalues: Attendenceinitvalues.fromJson(json["attendenceinitvalues"]),
  );

  Map<String, dynamic> toJson() => {
    "attendenceinitvalues": attendenceinitvalues.toJson(),
  };
}

class Attendenceinitvalues {
  Attendenceinitvalues({
    this.isClassTeacher,
    this.isDualAttendance,
    this.course,
    this.division,
  });

  bool? isClassTeacher;
  bool? isDualAttendance;
  List<Course>? course;
  List<Course>? division;

  factory Attendenceinitvalues.fromJson(Map<String, dynamic> json) => Attendenceinitvalues(
    isClassTeacher: json["isClassTeacher"],
    isDualAttendance: json["isDualAttendance"],
    course: List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
    division: List<Course>.from(json["division"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isClassTeacher": isClassTeacher,
    "isDualAttendance": isDualAttendance,
    "course": List<dynamic>.from(course!.map((x) => x.toJson())),
    "division": List<dynamic>.from(division!.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.value,
    this.text,
    this.selected,
    this.active,
    this.order,
  });

  String? value;
  String? text;
  dynamic? selected;
  dynamic? active;
  int? order;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    value: json["value"],
    text: json["text"],
    selected: json["selected"],
    active: json["active"],
    order: json["order"] == null ? null : json["order"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
    "selected": selected,
    "active": active,
    "order": order == null ? null : order,
  };
}
