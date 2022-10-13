class GalleryViewList_staff {
  String? id;
  String? createdStaffId;
  String? entryDate;
  String? createStaffName;
  String? title;
  String? createdAt;
  String? startDate;
  String? endDate;
  bool? approved;
  bool? cancelled;
  String? displayTo;

  GalleryViewList_staff(
      {this.id,
      this.createdStaffId,
      this.entryDate,
      this.createStaffName,
      this.title,
      this.createdAt,
      this.startDate,
      this.endDate,
      this.approved,
      this.cancelled,
      this.displayTo});

  GalleryViewList_staff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdStaffId = json['createdStaffId'];
    entryDate = json['entryDate'];
    createStaffName = json['createStaffName'];
    title = json['title'];
    createdAt = json['createdAt'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    approved = json['approved'];
    cancelled = json['cancelled'];
    displayTo = json['displayTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdStaffId'] = this.createdStaffId;
    data['entryDate'] = this.entryDate;
    data['createStaffName'] = this.createStaffName;
    data['title'] = this.title;
    data['createdAt'] = this.createdAt;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['approved'] = this.approved;
    data['cancelled'] = this.cancelled;
    data['displayTo'] = this.displayTo;
    return data;
  }
}
