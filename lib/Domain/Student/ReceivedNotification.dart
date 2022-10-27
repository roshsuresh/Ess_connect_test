class NotificationReceivedStudent {
  String? mobileNotificationDetId;
  String? createdDate;
  String? fromStaff;
  String? title;
  String? body;

  NotificationReceivedStudent(
      {this.mobileNotificationDetId,
      this.createdDate,
      this.fromStaff,
      this.title,
      this.body});

  NotificationReceivedStudent.fromJson(Map<String, dynamic> json) {
    mobileNotificationDetId = json['mobileNotificationDetId'];
    createdDate = json['createdDate'];
    fromStaff = json['fromStaff'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNotificationDetId'] = this.mobileNotificationDetId;
    data['createdDate'] = this.createdDate;
    data['fromStaff'] = this.fromStaff;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
