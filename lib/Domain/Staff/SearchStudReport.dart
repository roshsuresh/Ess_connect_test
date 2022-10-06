class SearchStudReport {
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

  SearchStudReport(
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

  SearchStudReport.fromJson(Map<String, dynamic> json) {
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
