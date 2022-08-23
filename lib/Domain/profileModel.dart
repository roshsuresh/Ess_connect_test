// class StudentProfileModel {
//   StudentProfileModel({
//     this.studentName,
//     this.admissionNo,
//     this.rollNo,
//     this.studentDetailsClass,
//     this.division,
//     this.bloodGroup,
//     this.houseGroup,
//     this.classTeacher,
//     this.dob,
//     this.studentPhoto,
//     this.studentPhotoId,
//     this.gender,
//     this.height,
//     this.weight,
//     this.address,
//     this.fatherName,
//     this.fatherMail,
//     this.fatherMobileno,
//     this.motherName,
//     this.motherMailId,
//     this.motherMobileno,
//   });

//   String? studentName;
//   String? admissionNo;
//   String? rollNo;
//   dynamic studentDetailsClass;
//   String? division;
//   dynamic bloodGroup;
//   dynamic houseGroup;
//   String? classTeacher;
//   DateTime? dob;
//   dynamic studentPhoto;
//   dynamic studentPhotoId;
//   String? gender;
//   String? height;
//   String? weight;
//   String? address;
//   String? fatherName;
//   dynamic fatherMail;
//   String? fatherMobileno;
//   String? motherName;
//   dynamic motherMailId;
//   String? motherMobileno;

//   factory StudentProfileModel.fromJson(Map<String, dynamic> json) =>
//       StudentProfileModel(
//         studentName: json["studentName"],
//         admissionNo: json["admissionNo"],
//         rollNo: json["rollNo"],
//         studentDetailsClass: json["class"],
//         division: json["division"],
//         bloodGroup: json["bloodGroup"],
//         houseGroup: json["houseGroup"],
//         classTeacher: json["classTeacher"],
//         dob: DateTime.parse(json["dob"]),
//         studentPhoto: json["studentPhoto"],
//         studentPhotoId: json["studentPhotoId"],
//         gender: json["gender"],
//         height: json["height"],
//         weight: json["weight"],
//         address: json["address"],
//         fatherName: json["fatherName"],
//         fatherMail: json["fatherMail"],
//         fatherMobileno: json["fatherMobileno"],
//         motherName: json["motherName"],
//         motherMailId: json["motherMailId"],
//         motherMobileno: json["motherMobileno"],
//       );

//   Map<String, dynamic> toJson() => {
//         "studentName": studentName,
//         "admissionNo": admissionNo,
//         "rollNo": rollNo,
//         "class": studentDetailsClass,
//         "division": division,
//         "bloodGroup": bloodGroup,
//         "houseGroup": houseGroup,
//         "classTeacher": classTeacher,
//         "dob": dob!.toIso8601String(),
//         "studentPhoto": studentPhoto,
//         "studentPhotoId": studentPhotoId,
//         "gender": gender,
//         "height": height,
//         "weight": weight,
//         "address": address,
//         "fatherName": fatherName,
//         "fatherMail": fatherMail,
//         "fatherMobileno": fatherMobileno,
//         "motherName": motherName,
//         "motherMailId": motherMailId,
//         "motherMobileno": motherMobileno,
//       };
// }

class AutoGenerate {
  AutoGenerate({
    required this.studentDetails,
  });
  late final StudentProfileModel studentDetails;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    studentDetails = StudentProfileModel.fromJson(json['studentDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['studentDetails'] = studentDetails.toJson();
    return _data;
  }
}

class StudentProfileModel {
  StudentProfileModel({
    required this.studentName,
    required this.admissionNo,
    required this.rollNo,
    required this.division,
    this.bloodGroup,
    this.houseGroup,
    this.classTeacher,
    required this.dob,
    required this.studentPhoto,
    required this.studentPhotoId,
    required this.gender,
    required this.height,
    required this.weight,
    required this.address,
    required this.fatherName,
    this.fatherMail,
    required this.fatherMobileno,
    required this.motherName,
    this.motherMailId,
    required this.motherMobileno,
  });
  late final String studentName;
  late final String admissionNo;
  late final String rollNo;

  late final String division;
  late final Null bloodGroup;
  late final Null houseGroup;
  late final Null classTeacher;
  late final String dob;
  late final StudentPhoto studentPhoto;
  late final String studentPhotoId;
  late final String gender;
  late final String height;
  late final String weight;
  late final String address;
  late final String fatherName;
  late final Null fatherMail;
  late final String fatherMobileno;
  late final String motherName;
  late final Null motherMailId;
  late final String motherMobileno;

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    studentName = json['studentName'];
    admissionNo = json['admissionNo'];
    rollNo = json['rollNo'];

    division = json['division'];
    bloodGroup = null;
    houseGroup = null;
    classTeacher = null;
    dob = json['dob'];
    studentPhoto = StudentPhoto.fromJson(json['studentPhoto']);
    studentPhotoId = json['studentPhotoId'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    address = json['address'];
    fatherName = json['fatherName'];
    fatherMail = null;
    fatherMobileno = json['fatherMobileno'];
    motherName = json['motherName'];
    motherMailId = null;
    motherMobileno = json['motherMobileno'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['studentName'] = studentName;
    _data['admissionNo'] = admissionNo;
    _data['rollNo'] = rollNo;

    _data['division'] = division;
    _data['bloodGroup'] = bloodGroup;
    _data['houseGroup'] = houseGroup;
    _data['classTeacher'] = classTeacher;
    _data['dob'] = dob;
    _data['studentPhoto'] = studentPhoto.toJson();
    _data['studentPhotoId'] = studentPhotoId;
    _data['gender'] = gender;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['address'] = address;
    _data['fatherName'] = fatherName;
    _data['fatherMail'] = fatherMail;
    _data['fatherMobileno'] = fatherMobileno;
    _data['motherName'] = motherName;
    _data['motherMailId'] = motherMailId;
    _data['motherMobileno'] = motherMobileno;
    return _data;
  }
}

class StudentPhoto {
  StudentPhoto({
    required this.name,
    required this.extension,
    required this.path,
    required this.url,
    required this.isTemporary,
    required this.isDeleted,
    required this.images,
    required this.createdAt,
    required this.id,
  });
  late final String name;
  late final String extension;
  late final String path;
  late final String url;
  late final bool isTemporary;
  late final bool isDeleted;
  late final List<Images> images;
  late final String createdAt;
  late final String id;

  StudentPhoto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
    isTemporary = json['isTemporary'];
    isDeleted = json['isDeleted'];
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    createdAt = json['createdAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['extension'] = extension;
    _data['path'] = path;
    _data['url'] = url;
    _data['isTemporary'] = isTemporary;
    _data['isDeleted'] = isDeleted;
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}

class Images {
  Images({
    required this.fileId,
    required this.dimension,
    this.url,
    required this.id,
  });
  late final String fileId;
  late final String dimension;
  late final String? url;
  late final String id;

  Images.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    dimension = json['dimension'];
    url = null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fileId'] = fileId;
    _data['dimension'] = dimension;
    _data['url'] = url;
    _data['id'] = id;
    return _data;
  }
}
