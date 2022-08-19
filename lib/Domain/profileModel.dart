class StudentProfileModel {
  StudentProfileModel({
    this.studentName,
    this.admissionNo,
    this.rollNo,
    this.studentDetailsClass,
    this.division,
    this.bloodGroup,
    this.houseGroup,
    this.classTeacher,
    this.dob,
    this.studentPhoto,
    this.studentPhotoId,
    this.gender,
    this.height,
    this.weight,
    this.address,
    this.fatherName,
    this.fatherMail,
    this.fatherMobileno,
    this.motherName,
    this.motherMailId,
    this.motherMobileno,
  });

  String? studentName;
  String? admissionNo;
  String? rollNo;
  dynamic studentDetailsClass;
  String? division;
  dynamic bloodGroup;
  dynamic houseGroup;
  String? classTeacher;
  DateTime? dob;
  dynamic studentPhoto;
  dynamic studentPhotoId;
  String? gender;
  String? height;
  String? weight;
  String? address;
  String? fatherName;
  dynamic fatherMail;
  String? fatherMobileno;
  String? motherName;
  dynamic motherMailId;
  String? motherMobileno;

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) =>
      StudentProfileModel(
        studentName: json["studentName"],
        admissionNo: json["admissionNo"],
        rollNo: json["rollNo"],
        studentDetailsClass: json["class"],
        division: json["division"],
        bloodGroup: json["bloodGroup"],
        houseGroup: json["houseGroup"],
        classTeacher: json["classTeacher"],
        dob: DateTime.parse(json["dob"]),
        studentPhoto: json["studentPhoto"],
        studentPhotoId: json["studentPhotoId"],
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        address: json["address"],
        fatherName: json["fatherName"],
        fatherMail: json["fatherMail"],
        fatherMobileno: json["fatherMobileno"],
        motherName: json["motherName"],
        motherMailId: json["motherMailId"],
        motherMobileno: json["motherMobileno"],
      );

  Map<String, dynamic> toJson() => {
        "studentName": studentName,
        "admissionNo": admissionNo,
        "rollNo": rollNo,
        "class": studentDetailsClass,
        "division": division,
        "bloodGroup": bloodGroup,
        "houseGroup": houseGroup,
        "classTeacher": classTeacher,
        "dob": dob!.toIso8601String(),
        "studentPhoto": studentPhoto,
        "studentPhotoId": studentPhotoId,
        "gender": gender,
        "height": height,
        "weight": weight,
        "address": address,
        "fatherName": fatherName,
        "fatherMail": fatherMail,
        "fatherMobileno": fatherMobileno,
        "motherName": motherName,
        "motherMailId": motherMailId,
        "motherMobileno": motherMobileno,
      };
}
