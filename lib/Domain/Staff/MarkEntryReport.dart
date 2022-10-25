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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = this.value;
    data['text'] = this.text;

    return data;
  }
}

//subject List

class MarkReportSubjectList {
  String? value;
  String? text;

  MarkReportSubjectList({
    this.value,
    this.text,
  });

  MarkReportSubjectList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = this.value;
    data['text'] = this.text;

    return data;
  }
}

// view markReport

class MarkEntryREportViewStaff {
  List<MeList>? meList;
  // List<Null>? headingList;
  Null? entryMethod;
  Null? tabulationTypeCode;

  MarkEntryREportViewStaff(
      {this.meList,
      //  this.headingList,
      this.entryMethod,
      this.tabulationTypeCode});

  MarkEntryREportViewStaff.fromJson(Map<String, dynamic> json) {
    if (json['meList'] != null) {
      meList = [];
      json['meList'].forEach((v) {
        meList!.add(new MeList.fromJson(v));
      });
    }
    // if (json['headingList'] != null) {
    //   headingList = [];
    //   json['headingList'].forEach((v) {
    //     headingList!.add(Null.fromJson(v));
    //   });
    // }
    entryMethod = json['entryMethod'];
    tabulationTypeCode = json['tabulationTypeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meList != null) {
      data['meList'] = this.meList!.map((v) => v.toJson()).toList();
    }
    // if (this.headingList != null) {
    //   data['headingList'] = headingList!.map((v) => v!.toJson()).toList();
    // }
    data['entryMethod'] = this.entryMethod;
    data['tabulationTypeCode'] = this.tabulationTypeCode;
    return data;
  }
}

class MeList {
  String? divisionId;
  String? division;
  int? divisionWiseStudentsCount;
  int? divisionOrder;
  List<StudentListMarkReport>? studentList;

  MeList(
      {this.divisionId,
      this.division,
      this.divisionWiseStudentsCount,
      this.divisionOrder,
      this.studentList});

  MeList.fromJson(Map<String, dynamic> json) {
    divisionId = json['divisionId'];
    division = json['division'];
    divisionWiseStudentsCount = json['divisionWiseStudentsCount'];
    divisionOrder = json['divisionOrder'];
    if (json['studentList'] != null) {
      studentList = [];
      json['studentList'].forEach((v) {
        studentList!.add(StudentListMarkReport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['divisionId'] = this.divisionId;
    data['division'] = this.division;
    data['divisionWiseStudentsCount'] = this.divisionWiseStudentsCount;
    data['divisionOrder'] = this.divisionOrder;
    if (this.studentList != null) {
      data['studentList'] = studentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentListMarkReport {
  int? rollNo;
  String? name;
  String? studentId;
  bool? isChecked;
  List<SubjectMarkDetails>? subjectMarkDetails;

  StudentListMarkReport(
      {this.rollNo,
      this.name,
      this.studentId,
      this.isChecked,
      this.subjectMarkDetails});

  StudentListMarkReport.fromJson(Map<String, dynamic> json) {
    rollNo = json['rollNo'];
    name = json['name'];
    studentId = json['studentId'];
    isChecked = json['isChecked'];
    if (json['subjectMarkDetails'] != null) {
      subjectMarkDetails = [];
      json['subjectMarkDetails'].forEach((v) {
        subjectMarkDetails!.add(new SubjectMarkDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rollNo'] = this.rollNo;
    data['name'] = this.name;
    data['studentId'] = this.studentId;
    data['isChecked'] = this.isChecked;
    if (this.subjectMarkDetails != null) {
      data['subjectMarkDetails'] =
          this.subjectMarkDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubjectMarkDetails {
  Null entryMethod;
  Null attendance;
  String? subject;
  Null teCaption;
  Null peCaption;
  Null ceCaption;
  Null peMark;
  Null teMark;
  Null ceMark;
  Null peGrade;
  Null teGrade;
  Null ceGrade;

  SubjectMarkDetails(
      {this.entryMethod,
      this.attendance,
      this.subject,
      this.teCaption,
      this.peCaption,
      this.ceCaption,
      this.peMark,
      this.teMark,
      this.ceMark,
      this.peGrade,
      this.teGrade,
      this.ceGrade});

  SubjectMarkDetails.fromJson(Map<String, dynamic> json) {
    entryMethod = json['entryMethod'];
    attendance = json['attendance'];
    subject = json['subject'];
    teCaption = json['teCaption'];
    peCaption = json['peCaption'];
    ceCaption = json['ceCaption'];
    peMark = json['peMark'];
    teMark = json['teMark'];
    ceMark = json['ceMark'];
    peGrade = json['peGrade'];
    teGrade = json['teGrade'];
    ceGrade = json['ceGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entryMethod'] = this.entryMethod;
    data['attendance'] = this.attendance;
    data['subject'] = this.subject;
    data['teCaption'] = this.teCaption;
    data['peCaption'] = this.peCaption;
    data['ceCaption'] = this.ceCaption;
    data['peMark'] = this.peMark;
    data['teMark'] = this.teMark;
    data['ceMark'] = this.ceMark;
    data['peGrade'] = this.peGrade;
    data['teGrade'] = this.teGrade;
    data['ceGrade'] = this.ceGrade;
    return data;
  }
}
