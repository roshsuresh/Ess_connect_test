class StaffReportByAdmin {
  String? name;
  String? sectionId;
  String? section;
  String? designation;
  String? mobileNo;
  String? emailId;
  String? staffRole;
  String? staffPhotoId;
  String? staffPhoto;

  StaffReportByAdmin({
    this.name,
    this.sectionId,
    this.section,
    this.designation,
    this.mobileNo,
    this.emailId,
    this.staffRole,
    this.staffPhotoId,
    this.staffPhoto,
  });

  StaffReportByAdmin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sectionId = json['sectionId'];
    section = json['section'];
    designation = json['designation'];
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    staffRole = json['staffRole'];
    staffPhotoId = json['staffPhotoId'];
    staffPhoto = json['staffPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['sectionId'] = sectionId;
    data['section'] = section;
    data['designation'] = designation;
    data['mobileNo'] = mobileNo;
    data['emailId'] = emailId;
    data['staffRole'] = staffRole;
    data['staffPhotoId'] = staffPhotoId;
    data['staffPhoto'] = staffPhoto;
    return data;
  }
}
