class StudProModel {
  StudProModel({
    required this.studentDetails,
  });
  late final StudentProfileModel studentDetails;

  StudProModel.fromJson(Map<String, dynamic> json) {
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
    required this.divisionId,
    required this.bloodGroup,
    required this.houseGroup,
    required this.classTeacher,
    required this.dob,
    this.studentPhoto,
    required this.studentPhotoId,
    required this.gender,
    required this.height,
    required this.weight,
    required this.address,
    required this.fatherName,
    required this.fatherMail,
    required this.fatherMobileno,
    required this.motherName,
    required this.motherMailId,
    required this.motherMobileno,
  });
  String? studentName;
  String? admissionNo;
  String? rollNo;

  String? division;
  String? divisionId;
  String? bloodGroup;
  String? houseGroup;
  String? classTeacher;
  String? dob;
  StudentPhoto? studentPhoto;
  String? studentPhotoId;
  String? gender;
  String? height;
  String? weight;
  String? address;
  String? fatherName;
  String? fatherMail;
  String? fatherMobileno;
  String? motherName;
  String? motherMailId;
  String? motherMobileno;

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    studentName = json['studentName'];
    admissionNo = json['admissionNo'];
    rollNo = json['rollNo'];

    division = json['divisionName'];
    divisionId = json['divisionId'];
    bloodGroup = json['bloodGroup'];
    houseGroup = json['houseGroup'];
    classTeacher = json['classTeacher'];
    dob = json['dob'];
    studentPhoto = StudentPhoto.fromJson(json['studentPhoto']);
    studentPhotoId = json['studentPhotoId'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    address = json['address'];
    fatherName = json['fatherName'];
    fatherMail = json['fatherMailId'];
    fatherMobileno = json['fatherMobileno'];
    motherName = json['motherName'];
    motherMailId = json['motherMailId'];
    motherMobileno = json['motherMobileno'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['studentName'] = studentName;
    _data['admissionNo'] = admissionNo;
    _data['rollNo'] = rollNo;
    _data['divisionId'] = divisionId;
    _data['divisionName'] = division;
    _data['bloodGroup'] = bloodGroup;
    _data['houseGroup'] = houseGroup;
    _data['classTeacher'] = classTeacher;
    _data['dob'] = dob;
    _data['studentPhoto'] = studentPhoto!.toJson();
    _data['studentPhotoId'] = studentPhotoId;
    _data['gender'] = gender;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['address'] = address;
    _data['fatherName'] = fatherName;
    _data['fatherMailId'] = fatherMail;
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
    this.images,
    required this.createdAt,
    required this.id,
  });
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;
  List<Images>? images;
  String? createdAt;
  String? id;

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
    _data['images'] = images!.map((e) => e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}

class Images {
  Images({
    this.fileId,
    this.dimension,
    this.url,
    this.id,
  });
  String? fileId;
  String? dimension;
  String? url;
  String? id;

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
