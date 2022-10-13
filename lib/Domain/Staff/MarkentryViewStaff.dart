class MarkentryViewByStaff {
  List<StudentMEList>? studentMEList;
  List<MaxMarkList>? maxMarkList;
  // List<Null>? gradeList;
  String? typeCode;
  String? examStatus;

  MarkentryViewByStaff(
      {this.studentMEList,
      this.maxMarkList,
      // this.gradeList,
      this.typeCode,
      this.examStatus});

  MarkentryViewByStaff.fromJson(Map<String, dynamic> json) {
    if (json['studentMEList'] != null) {
      studentMEList = [];
      json['studentMEList'].forEach((v) {
        studentMEList!.add(StudentMEList.fromJson(v));
      });
    }
    if (json['maxMarkList'] != null) {
      maxMarkList = [];
      json['maxMarkList'].forEach((v) {
        maxMarkList!.add(MaxMarkList.fromJson(v));
      });
    }
    // if (json['gradeList'] != null) {
    //   gradeList = [];
    //   json['gradeList'].forEach((v) {
    //     gradeList!.add(new Null.fromJson(v));
    //   });
    // }
    typeCode = json['typeCode'];
    examStatus = json['examStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studentMEList != null) {
      data['studentMEList'] =
          this.studentMEList!.map((v) => v.toJson()).toList();
    }
    if (this.maxMarkList != null) {
      data['maxMarkList'] = this.maxMarkList!.map((v) => v.toJson()).toList();
    }
    // if (this.gradeList != null) {
    //   data['gradeList'] = this.gradeList.map((v) => v.toJson()).toList();
    // }
    data['typeCode'] = this.typeCode;
    data['examStatus'] = this.examStatus;
    return data;
  }
}

class StudentMEList {
  String? name;
  int? rollNo;
  String? studentPresentDetailsId;
  double? teMark;
  double? peMark;
  double? ceMark;
  String? teGrade;
  String? peGrade;
  String? ceGrade;
  double? totalMark;
  double? markInPer;
  String? grade;
  String? gradeId;
  String? teGradeId;
  String? peGradeId;
  String? ceGradeId;
  String? attendance;
  String? description;
  bool? disableAbsentRow;

  StudentMEList(
      {this.name,
      this.rollNo,
      this.studentPresentDetailsId,
      this.teMark,
      this.peMark,
      this.ceMark,
      this.teGrade,
      this.peGrade,
      this.ceGrade,
      this.totalMark,
      this.markInPer,
      this.grade,
      this.gradeId,
      this.teGradeId,
      this.peGradeId,
      this.ceGradeId,
      this.attendance,
      this.description,
      this.disableAbsentRow});

  StudentMEList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rollNo = json['rollNo'];
    studentPresentDetailsId = json['studentPresentDetailsId'];
    teMark = json['teMark'];
    peMark = json['peMark'];
    ceMark = json['ceMark'];
    teGrade = json['teGrade'];
    peGrade = json['peGrade'];
    ceGrade = json['ceGrade'];
    totalMark = json['totalMark'];
    markInPer = json['markInPer'];
    grade = json['grade'];
    gradeId = json['gradeId'];
    teGradeId = json['teGradeId'];
    peGradeId = json['peGradeId'];
    ceGradeId = json['ceGradeId'];
    attendance = json['attendance'];
    description = json['description'];
    disableAbsentRow = json['disableAbsentRow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rollNo'] = this.rollNo;
    data['studentPresentDetailsId'] = this.studentPresentDetailsId;
    data['teMark'] = this.teMark;
    data['peMark'] = this.peMark;
    data['ceMark'] = this.ceMark;
    data['teGrade'] = this.teGrade;
    data['peGrade'] = this.peGrade;
    data['ceGrade'] = this.ceGrade;
    data['totalMark'] = this.totalMark;
    data['markInPer'] = this.markInPer;
    data['grade'] = this.grade;
    data['gradeId'] = this.gradeId;
    data['teGradeId'] = this.teGradeId;
    data['peGradeId'] = this.peGradeId;
    data['ceGradeId'] = this.ceGradeId;
    data['attendance'] = this.attendance;
    data['description'] = this.description;
    data['disableAbsentRow'] = this.disableAbsentRow;
    return data;
  }
}

class MaxMarkList {
  double? teMax;
  double? peMax;
  double? ceMax;
  String? teCaption;
  String? peCaption;
  String? ceCaption;
  String? entryMethod;
  double? teGrade;
  double? peGrade;
  double? ceGrade;
  bool? isBlocked;
  double? gradeId;
  String? createdDate;
  String? enteredBy;
  String? status;
  String? part;
  bool? isConfirmed;
  String? code;

  MaxMarkList(
      {this.teMax,
      this.peMax,
      this.ceMax,
      this.teCaption,
      this.peCaption,
      this.ceCaption,
      this.entryMethod,
      this.teGrade,
      this.peGrade,
      this.ceGrade,
      this.isBlocked,
      this.gradeId,
      this.createdDate,
      this.enteredBy,
      this.status,
      this.part,
      this.isConfirmed,
      this.code});

  MaxMarkList.fromJson(Map<String, dynamic> json) {
    teMax = json['teMax'];
    peMax = json['peMax'];
    ceMax = json['ceMax'];
    teCaption = json['teCaption'];
    peCaption = json['peCaption'];
    ceCaption = json['ceCaption'];
    entryMethod = json['entryMethod'];
    teGrade = json['teGrade'];
    peGrade = json['peGrade'];
    ceGrade = json['ceGrade'];
    isBlocked = json['isBlocked'];
    gradeId = json['gradeId'];
    createdDate = json['createdDate'];
    enteredBy = json['enteredBy'];
    status = json['status'];
    part = json['part'];
    isConfirmed = json['isConfirmed'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teMax'] = this.teMax;
    data['peMax'] = this.peMax;
    data['ceMax'] = this.ceMax;
    data['teCaption'] = this.teCaption;
    data['peCaption'] = this.peCaption;
    data['ceCaption'] = this.ceCaption;
    data['entryMethod'] = this.entryMethod;
    data['teGrade'] = this.teGrade;
    data['peGrade'] = this.peGrade;
    data['ceGrade'] = this.ceGrade;
    data['isBlocked'] = this.isBlocked;
    data['gradeId'] = this.gradeId;
    data['createdDate'] = this.createdDate;
    data['enteredBy'] = this.enteredBy;
    data['status'] = this.status;
    data['part'] = this.part;
    data['isConfirmed'] = this.isConfirmed;
    data['code'] = this.code;
    return data;
  }
}
