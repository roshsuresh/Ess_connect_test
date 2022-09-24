class StudentProfileModel {
  String? studentName;
  String? admissionNo;
  String? rollNo;
  String? classc;
  String? divisionName;
  String? divisionId;
  String? bloodGroup;
  String? houseGroup;
  String? classTeacher;
  String? dob;
  String? studentPhoto;
  String? studentPhotoId;
  String? fatherPhoto;
  String? fatherPhotoId;
  String? motherPhoto;
  String? motherPhotoId;
  String? gender;
  String? height;
  String? weight;
  String? address;
  String? fatherName;
  String? fatherMailId;
  String? fatherMobileno;
  String? motherName;
  String? motherMailId;
  String? motherMobileno;

  StudentProfileModel(
      {this.studentName,
      this.admissionNo,
      this.rollNo,
      this.classc,
      this.divisionName,
      this.divisionId,
      this.bloodGroup,
      this.houseGroup,
      this.classTeacher,
      this.dob,
      this.studentPhoto,
      this.studentPhotoId,
      this.fatherPhoto,
      this.fatherPhotoId,
      this.motherPhoto,
      this.motherPhotoId,
      this.gender,
      this.height,
      this.weight,
      this.address,
      this.fatherName,
      this.fatherMailId,
      this.fatherMobileno,
      this.motherName,
      this.motherMailId,
      this.motherMobileno});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    studentName = json['studentName'];
    admissionNo = json['admissionNo'];
    rollNo = json['rollNo'];
    classc = json['class'];
    divisionName = json['divisionName'];
    divisionId = json['divisionId'];
    bloodGroup = json['bloodGroup'];
    houseGroup = json['houseGroup'];
    classTeacher = json['classTeacher'];
    dob = json['dob'];
    studentPhoto = json['studentPhoto'];
    studentPhotoId = json['studentPhotoId'];
    fatherPhoto = json['fatherPhoto'];
    fatherPhotoId = json['fatherPhotoId'];
    motherPhoto = json['motherPhoto'];
    motherPhotoId = json['motherPhotoId'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    address = json['address'];
    fatherName = json['fatherName'];
    fatherMailId = json['fatherMailId'];
    fatherMobileno = json['fatherMobileno'];
    motherName = json['motherName'];
    motherMailId = json['motherMailId'];
    motherMobileno = json['motherMobileno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentName'] = this.studentName;
    data['admissionNo'] = this.admissionNo;
    data['rollNo'] = this.rollNo;
    data['class'] = this.classc;
    data['divisionName'] = this.divisionName;
    data['divisionId'] = this.divisionId;
    data['bloodGroup'] = this.bloodGroup;
    data['houseGroup'] = this.houseGroup;
    data['classTeacher'] = this.classTeacher;
    data['dob'] = this.dob;
    data['studentPhoto'] = this.studentPhoto;
    data['studentPhotoId'] = this.studentPhotoId;
    data['fatherPhoto'] = this.fatherPhoto;
    data['fatherPhotoId'] = this.fatherPhotoId;
    data['motherPhoto'] = this.motherPhoto;
    data['motherPhotoId'] = this.motherPhotoId;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['address'] = this.address;
    data['fatherName'] = this.fatherName;
    data['fatherMailId'] = this.fatherMailId;
    data['fatherMobileno'] = this.fatherMobileno;
    data['motherName'] = this.motherName;
    data['motherMailId'] = this.motherMailId;
    data['motherMobileno'] = this.motherMobileno;
    return data;
  }
}
