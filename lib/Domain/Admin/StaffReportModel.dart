// class StaffReportByAdmin {
//   String? name;
//   String? sectionId;
//   String? section;
//   String? designation;
//   String? mobileNo;
//   String? emailId;
//   String? staffRole;
//   String? staffPhotoId;
//   String? staffPhoto;

//   StaffReportByAdmin({
//     this.name,
//     this.sectionId,
//     this.section,
//     this.designation,
//     this.mobileNo,
//     this.emailId,
//     this.staffRole,
//     this.staffPhotoId,
//     this.staffPhoto,
//   });

//   StaffReportByAdmin.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     sectionId = json['sectionId'];
//     section = json['section'];
//     designation = json['designation'];
//     mobileNo = json['mobileNo'];
//     emailId = json['emailId'];
//     staffRole = json['staffRole'];
//     staffPhotoId = json['staffPhotoId'];
//     staffPhoto = json['staffPhoto'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = name;
//     data['sectionId'] = sectionId;
//     data['section'] = section;
//     data['designation'] = designation;
//     data['mobileNo'] = mobileNo;
//     data['emailId'] = emailId;
//     data['staffRole'] = staffRole;
//     data['staffPhotoId'] = staffPhotoId;
//     data['staffPhoto'] = staffPhoto;
//     return data;
//   }
// }

class StaffReportByAdmin {
  String? id;
  String? name;

  String? sectionId;
  String? section;
  String? designation;
  String? mobileNo;
  String? emailId;
  String? staffRole;

  String? staffPhoto;

  String? gender;
  String? address;
  String? dateOfBirth;

  StaffReportByAdmin(
      {this.id,
      this.name,
      this.sectionId,
      this.section,
      this.designation,
      this.mobileNo,
      this.emailId,
      this.staffRole,
      this.staffPhoto,
      this.gender,
      this.address,
      this.dateOfBirth});

  StaffReportByAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    sectionId = json['sectionId'];
    section = json['section'];
    designation = json['designation'];
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    staffRole = json['staffRole'];

    staffPhoto = json['staffPhoto'];

    gender = json['gender'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    data['sectionId'] = this.sectionId;
    data['section'] = this.section;
    data['designation'] = this.designation;
    data['mobileNo'] = this.mobileNo;
    data['emailId'] = this.emailId;
    data['staffRole'] = this.staffRole;

    data['staffPhoto'] = this.staffPhoto;

    data['gender'] = this.gender;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}
