class NoticeBoardListAdmin {
  String? id;
  String? createdStaffId;

  String? createStaffName;
  String? entryDate;
  String? category;

  String? displayTo;
  String? createdAt;
  String? title;

  String? startDate;
  String? endDate;
  bool? approved;
  bool? cancelled;

  NoticeBoardListAdmin({
    this.id,
    this.createdStaffId,
    this.createStaffName,
    this.entryDate,
    this.category,
    this.displayTo,
    this.createdAt,
    this.title,
    this.startDate,
    this.endDate,
    this.approved,
    this.cancelled,
  });

  NoticeBoardListAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdStaffId = json['createdStaffId'];

    createStaffName = json['createStaffName'];
    entryDate = json['entryDate'];
    category = json['category'];

    displayTo = json['displayTo'];
    createdAt = json['createdAt'];
    title = json['title'];

    startDate = json['startDate'];
    endDate = json['endDate'];
    approved = json['approved'];
    cancelled = json['cancelled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdStaffId'] = this.createdStaffId;

    data['createStaffName'] = this.createStaffName;
    data['entryDate'] = this.entryDate;
    data['category'] = this.category;

    data['displayTo'] = this.displayTo;
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;

    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['approved'] = this.approved;
    data['cancelled'] = this.cancelled;

    return data;
  }
}
