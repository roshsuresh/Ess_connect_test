class StudentReportInitialValues {
  List<StudReportSectionList>? sectionList;

  StudentReportInitialValues({this.sectionList});

  StudentReportInitialValues.fromJson(Map<String, dynamic> json) {
    if (json['sectionList'] != null) {
      sectionList = [];
      json['sectionList'].forEach((v) {
        sectionList!.add(StudReportSectionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sectionList != null) {
      data['sectionList'] = this.sectionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudReportSectionList {
  String? value;
  String? text;
  bool? selected;
  Null active;
  Null order;

  StudReportSectionList(
      {this.value, this.text, this.selected, this.active, this.order});

  StudReportSectionList.fromJson(Map<String, dynamic> json) {
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

//course

class StudReportCourse {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  StudReportCourse(
      {this.value, this.text, this.selected, this.active, this.order});

  StudReportCourse.fromJson(Map<String, dynamic> json) {
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

class StudReportDivision {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  StudReportDivision(
      {this.value, this.text, this.selected, this.active, this.order});

  StudReportDivision.fromJson(Map<String, dynamic> json) {
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

//View initial

class ViewStudentReport {
  String? admnNo;
  String? name;
  String? division;
  String? course;
  int? sectionOrder;
  int? courseOrder;
  int? divisionOrder;
  int? rollNo;
  String? mobNo;
  String? address;
  String? bus;
  String? stop;
  String? studentPhotoId;
  String? photo;
  String? photoId;
  String? studentPhoto;
  bool? terminationStatus;
  String? sectionId;
  String? courseId;
  String? divisionId;
  String? schoolId;

  ViewStudentReport(
      {this.admnNo,
      this.name,
      this.division,
      this.course,
      this.sectionOrder,
      this.courseOrder,
      this.divisionOrder,
      this.rollNo,
      this.mobNo,
      this.address,
      this.bus,
      this.stop,
      this.studentPhotoId,
      this.photo,
      this.photoId,
      this.studentPhoto,
      this.terminationStatus,
      this.sectionId,
      this.courseId,
      this.divisionId,
      this.schoolId});

  ViewStudentReport.fromJson(Map<String, dynamic> json) {
    admnNo = json['admnNo'];
    name = json['name'];
    division = json['division'];
    course = json['course'];
    sectionOrder = json['sectionOrder'];
    courseOrder = json['courseOrder'];
    divisionOrder = json['divisionOrder'];
    rollNo = json['rollNo'];
    mobNo = json['mobNo'];
    address = json['address'];
    bus = json['bus'];
    stop = json['stop'];
    studentPhotoId = json['studentPhotoId'];
    photo = json['photo'];
    photoId = json['photoId'];
    studentPhoto = json['studentPhoto'];
    terminationStatus = json['terminationStatus'];
    sectionId = json['sectionId'];
    courseId = json['courseId'];
    divisionId = json['divisionId'];
    schoolId = json['schoolId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admnNo'] = this.admnNo;
    data['name'] = this.name;
    data['division'] = this.division;
    data['course'] = this.course;
    data['sectionOrder'] = this.sectionOrder;
    data['courseOrder'] = this.courseOrder;
    data['divisionOrder'] = this.divisionOrder;
    data['rollNo'] = this.rollNo;
    data['mobNo'] = this.mobNo;
    data['address'] = this.address;
    data['bus'] = this.bus;
    data['stop'] = this.stop;
    data['studentPhotoId'] = this.studentPhotoId;
    data['photo'] = this.photo;
    data['photoId'] = this.photoId;
    data['studentPhoto'] = this.studentPhoto;
    data['terminationStatus'] = this.terminationStatus;
    data['sectionId'] = this.sectionId;
    data['courseId'] = this.courseId;
    data['divisionId'] = this.divisionId;
    data['schoolId'] = this.schoolId;
    return data;
  }
}
