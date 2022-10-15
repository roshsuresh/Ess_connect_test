//course List

class MarkReportCourseList {
  String? id;
  String? courseName;
  int? sortOrder;

  MarkReportCourseList({this.id, this.courseName, this.sortOrder});

  MarkReportCourseList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    data['sortOrder'] = this.sortOrder;
    return data;
  }
}

class StaffMarkEntryReport {
  List<MarkReportPartList>? parts;
  List<MarkReportDivisions>? divisions;
  List<MarkReportExamList>? exam;
  String? tabulationTypeCode;

  StaffMarkEntryReport(
      {this.parts, this.divisions, this.exam, this.tabulationTypeCode});

  StaffMarkEntryReport.fromJson(Map<String, dynamic> json) {
    if (json['parts'] != null) {
      parts = [];
      json['parts'].forEach((v) {
        parts!.add(new MarkReportPartList.fromJson(v));
      });
    }
    if (json['divisions'] != null) {
      divisions = [];
      json['divisions'].forEach((v) {
        divisions!.add(new MarkReportDivisions.fromJson(v));
      });
    }
    if (json['exam'] != null) {
      exam = [];
      json['exam'].forEach((v) {
        exam!.add(new MarkReportExamList.fromJson(v));
      });
    }
    tabulationTypeCode = json['tabulationTypeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    if (this.divisions != null) {
      data['divisions'] = this.divisions!.map((v) => v.toJson()).toList();
    }
    if (this.exam != null) {
      data['exam'] = this.exam!.map((v) => v.toJson()).toList();
    }
    data['tabulationTypeCode'] = this.tabulationTypeCode;
    return data;
  }
}

//part List

class MarkReportPartList {
  String? value;
  String? text;

  MarkReportPartList({
    this.value,
    this.text,
  });

  MarkReportPartList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;

    return data;
  }
}

//Division list

class MarkReportDivisions {
  String? value;
  String? text;

  MarkReportDivisions({
    this.value,
    this.text,
  });

  MarkReportDivisions.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;

    return data;
  }
}

//Exam list

class MarkReportExamList {
  String? value;
  String? text;

  MarkReportExamList({
    this.value,
    this.text,
  });

  MarkReportExamList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;

    return data;
  }
}
