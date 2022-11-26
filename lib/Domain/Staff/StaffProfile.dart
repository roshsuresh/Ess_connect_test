class StaffprofileModel {
  Staffprofile? staffprofile;

  StaffprofileModel({this.staffprofile});

  StaffprofileModel.fromJson(Map<String, dynamic> json) {
    staffprofile = json['staffprofile'] != null
        ? new Staffprofile.fromJson(json['staffprofile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.staffprofile != null) {
      data['staffprofile'] = this.staffprofile!.toJson();
    }
    return data;
  }
}

class Staffprofile {
  String? name;
  String? section;
  String? designation;
  String? mobileNo;
  String? emailid;
  String? dateOfBirth;
  String? userName;
  String? shortname;
  String? gender;
  String? address;
  String? staffRole;
  String? photoId;
  String? photo;

  Staffprofile(
      {this.name,
      this.section,
      this.designation,
      this.mobileNo,
      this.emailid,
      this.dateOfBirth,
      this.userName,
      this.shortname,
      this.gender,
      this.address,
      this.staffRole,
      this.photoId,
      this.photo});

  Staffprofile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    section = json['section'];
    designation = json['designation'];
    mobileNo = json['mobileNo'];
    emailid = json['emailid'];
    dateOfBirth = json['dateOfBirth'];
    userName = json['userName'];
    shortname = json['shortname'];
    gender = json['gender'];
    address = json['address'];
    staffRole = json['staffRole'];
    photoId = json['photoId'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['section'] = this.section;
    data['designation'] = this.designation;
    data['mobileNo'] = this.mobileNo;
    data['emailid'] = this.emailid;
    data['dateOfBirth'] = this.dateOfBirth;
    data['userName'] = this.userName;
    data['shortname'] = this.shortname;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['staffRole'] = this.staffRole;
    data['photoId'] = this.photoId;
    data['photo'] = this.photo;
    return data;
  }
}
