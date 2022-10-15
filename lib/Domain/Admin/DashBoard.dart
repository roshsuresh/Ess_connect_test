class AdminDashboard {
  int? totalStudentStrength;
  int? boysStrength;
  int? girlsStrength;
  int? totalStaffStrength;
  int? nonTeachingStrength;
  int? teachingStrength;

  AdminDashboard({
    this.totalStudentStrength,
    this.boysStrength,
    this.girlsStrength,
    this.totalStaffStrength,
    this.nonTeachingStrength,
    this.teachingStrength,
  });

  AdminDashboard.fromJson(Map<String, dynamic> json) {
    totalStudentStrength = json['totalStudentStrength'];
    boysStrength = json['boysStrength'];
    girlsStrength = json['girlsStrength'];
    totalStaffStrength = json['totalStaffStrength'];
    nonTeachingStrength = json['nonTeachingStrength'];
    teachingStrength = json['teachingStrength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalStudentStrength'] = this.totalStudentStrength;
    data['boysStrength'] = this.boysStrength;
    data['girlsStrength'] = this.girlsStrength;
    data['totalStaffStrength'] = this.totalStaffStrength;
    data['nonTeachingStrength'] = this.nonTeachingStrength;
    data['teachingStrength'] = this.teachingStrength;

    return data;
  }
}
