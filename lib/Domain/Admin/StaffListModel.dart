import 'package:Ess_test/Domain/Staff/ToGuardian.dart';

// class StaffReportNotification {
//   String id;
//   String? name;

//   String? sectionId;
//   String? section;
//   String? designation;

//   String? staffRole;
//   bool? selected;

//   StaffReportNotification({
//     required this.id,
//     required this.name,
//     required this.sectionId,
//     required this.section,
//     required this.designation,
//     required this.staffRole,
//     required this.selected,
//   });

//   StaffReportNotification.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];

//     sectionId = json['sectionId'];
//     section = json['section'];
//     designation = json['designation'];

//     staffRole = json['staffRole'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;

//     data['sectionId'] = this.sectionId;
//     data['section'] = this.section;
//     data['designation'] = this.designation;

//     data['staffRole'] = this.staffRole;
//     data['id'] = this.id;
//     return data;
//   }
// }

class StaffReportNotification {
  late String id;
  late String name;
  late String sectionId;
  late String designation;
  late String staffRole;
  bool? selected;

  StaffReportNotification({
    required this.id,
    required this.name,
    required this.sectionId,
    required this.designation,
    required this.staffRole,
    required this.selected,
  });

  StaffReportNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    sectionId = json['sectionId'];

    designation = json['designation'];

    staffRole = json['staffRole'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    data['sectionId'] = this.sectionId;

    data['designation'] = this.designation;

    data['staffRole'] = this.staffRole;
    data['id'] = this.id;

    return data;
  }
}
// class StaffListModel {
//   StaffListModel({
//     required this.id,
//     required this.name,
//     required this.section,
//     required this.designation,
//     required this.staffRole,
//     required this.classTeacher,
//     this.selected,
//   });

//   String id;
//   String name;
//   dynamic section;
//   String? designation;
//   String? staffRole;
//   bool? classTeacher;
//   bool? selected;

//   factory StaffListModel.fromJson(Map<String, dynamic> json) => StaffListModel(
//         id = json['id'];
//         name: json["name"],
//         section: json["section"],
//         designation: json["designation"],
//         staffRole: json["staffRole"],
//         classTeacher: json["classTeacher"],
//       );

//   Map<String, dynamic> toJson() => {

//        "id" :id,
//         "name": name,
//         "section": section,
//         "designation": designation,
//         "staffRole": staffRole,
//         "classTeacher": classTeacher,
//       };
//   @override
//   bool operator ==(Object other) {
//     return (other is StudentViewbyCourseDivision_notification_Stf) && other.studentId == staffId;
//   }
// }
