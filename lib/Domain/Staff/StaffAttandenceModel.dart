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

// class AttendanceView {
//   AttendanceView({
//     this.studAttId,
//     this.divisionId,
//     this.id,
//     this.forenoon,
//     this.afternoon,
//     this.admNo,
//     this.rollNo,
//     this.name,
//     this.select,
//   });

//   dynamic studAttId;
//   String? divisionId;
//   String? id;
//   String? forenoon;
//   String? afternoon;
//   String? admNo;
//   int? rollNo;
//   String? name;
//   bool? select;

//   factory AttendanceView.fromJson(Map<String, dynamic> json) => AttendanceView(
//         studAttId: json["studAttId"],
//         divisionId: json["divisionId"],
//         id: json["id"],
//         forenoon: json["forenoon"],
//         afternoon: json["afternoon"],
//         admNo: json["admNo"],
//         rollNo: json["rollNo"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "studAttId": studAttId,
//         "divisionId": divisionId,
//         "id": id,
//         "forenoon": forenoon,
//         "afternoon": afternoon,
//         "admNo": admNo,
//         "rollNo": rollNo,
//         "name": name,
//         "id": id,
//       };
// }

//view

class StudentsAttendenceView_stf {
  String? studAttId;
  String? divisionId;
  String? id;
  String? forenoon;
  String? afternoon;
  String? admNo;
  int? rollNo;
  String? name;
  bool? select;
  bool? selectedd;

  StudentsAttendenceView_stf({
    this.studAttId,
    this.divisionId,
    this.id,
    this.forenoon,
    this.afternoon,
    this.admNo,
    this.rollNo,
    this.name,
    this.select,
    this.selectedd,
  });

  StudentsAttendenceView_stf.fromJson(Map<String, dynamic> json) {
    studAttId = json['studAttId'];
    divisionId = json['divisionId'];
    id = json['id'];
    forenoon = json['forenoon'];
    afternoon = json['afternoon'];
    admNo = json['admNo'];
    rollNo = json['rollNo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studAttId'] = studAttId;
    data['divisionId'] = divisionId;
    data['id'] = id;
    data['forenoon'] = forenoon;
    data['afternoon'] = afternoon;
    data['admNo'] = admNo;
    data['rollNo'] = rollNo;
    data['name'] = name;
    data['id'] = id;
    data['id'] = id;
    return data;
  }
}
