class FlashnewsListAdmin {
  String? id;
  String? createdStaffId;
  String? createStaffName;
  String? createdAt;
  String? entryDate;
  String? news;
  String? startDate;
  String? endDate;
  bool? approved;
  bool? cancelled;
  bool? activeStatus;

  FlashnewsListAdmin(
      {this.id,
      this.createdStaffId,
      this.createStaffName,
      this.createdAt,
      this.entryDate,
      this.news,
      this.startDate,
      this.endDate,
      this.approved,
      this.cancelled,
      this.activeStatus});

  FlashnewsListAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdStaffId = json['createdStaffId'];
    createStaffName = json['createStaffName'];
    createdAt = json['createdAt'];
    entryDate = json['entryDate'];
    news = json['news'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    approved = json['approved'];
    cancelled = json['cancelled'];
    activeStatus = json['activeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdStaffId'] = this.createdStaffId;
    data['createStaffName'] = this.createStaffName;
    data['createdAt'] = this.createdAt;
    data['entryDate'] = this.entryDate;
    data['news'] = this.news;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['approved'] = this.approved;
    data['cancelled'] = this.cancelled;
    data['activeStatus'] = this.activeStatus;
    return data;
  }
} 