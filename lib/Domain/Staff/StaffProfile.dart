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

// class Photo {
//   String? name;
//   String? extension;
//   String? path;
//   String? url;
//   bool? isTemporary;
//   bool? isDeleted;
//   List<Images>? images;
//   String? createdAt;
//   String? id;

//   Photo(
//       {this.name,
//       this.extension,
//       this.path,
//       this.url,
//       this.isTemporary,
//       this.isDeleted,
//       this.images,
//       this.createdAt,
//       this.id});

//   Photo.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     extension = json['extension'];
//     path = json['path'];
//     url = json['url'];
//     isTemporary = json['isTemporary'];
//     isDeleted = json['isDeleted'];
//     if (json['images'] != null) {
//       images = [];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['extension'] = this.extension;
//     data['path'] = this.path;
//     data['url'] = this.url;
//     data['isTemporary'] = this.isTemporary;
//     data['isDeleted'] = this.isDeleted;
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class Images {
//   String? fileId;
//   String? dimension;
//   String? url;
//   String? id;

//   Images({this.fileId, this.dimension, this.url, this.id});

//   Images.fromJson(Map<String, dynamic> json) {
//     fileId = json['fileId'];
//     dimension = json['dimension'];
//     url = json['url'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fileId'] = this.fileId;
//     data['dimension'] = this.dimension;
//     data['url'] = this.url;
//     data['id'] = this.id;
//     return data;
//   }
// }
