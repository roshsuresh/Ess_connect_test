class NoticeEditAdmin {
  String? id;
  String? title;
  String? matter;
  String? displayStartDate;
  String? displayEndDate;
  String? createdDate;
  bool? cancelled;
  bool? approved;
  String? createdStaffId;
  String? attachmentId;
  AttachmentNoticeAdmin? attachment;

  NoticeEditAdmin({
    this.id,
    this.title,
    this.matter,
    this.displayStartDate,
    this.displayEndDate,
    this.createdDate,
    this.cancelled,
    this.approved,
    this.createdStaffId,
    this.attachmentId,
    this.attachment,
  });

  NoticeEditAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    matter = json['matter'];

    displayStartDate = json['displayStartDate'];
    displayEndDate = json['displayEndDate'];
    createdDate = json['createdDate'];
    cancelled = json['cancelled'];
    approved = json['approved'];
    createdStaffId = json['createdStaffId'];

    attachmentId = json['attachmentId'];
    attachment = json['attachment'] != null
        ? new AttachmentNoticeAdmin.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['matter'] = this.matter;

    data['displayStartDate'] = this.displayStartDate;
    data['displayEndDate'] = this.displayEndDate;
    data['createdDate'] = this.createdDate;
    data['cancelled'] = this.cancelled;
    data['approved'] = this.approved;
    data['createdStaffId'] = this.createdStaffId;

    data['attachmentId'] = this.attachmentId;
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }
    return data;
  }
}

class AttachmentNoticeAdmin {
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;
  String? createdAt;
  String? id;

  AttachmentNoticeAdmin(
      {this.name,
      this.extension,
      this.path,
      this.url,
      this.isTemporary,
      this.isDeleted,
      this.createdAt,
      this.id});

  AttachmentNoticeAdmin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
    isTemporary = json['isTemporary'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['extension'] = this.extension;
    data['path'] = this.path;
    data['url'] = this.url;
    data['isTemporary'] = this.isTemporary;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
