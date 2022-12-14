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
