class GalleryEditAdmin {
  String? id;
  String? title;
  String? displayStartDate;
  String? displayEndDate;
  Null reason;
  bool? cancelled;
  bool? approved;
  String? createdStaffId;
  Null cancelledStaffId;
  String? entryDate;
  bool? forClassTeacherOnly;
  Null staffRole;
  String? displayTo;
  Null division;
  Null course;
  Null section;
  List<Photo>? photo;

  GalleryEditAdmin({
    this.id,
    this.title,
    this.displayStartDate,
    this.displayEndDate,
    this.reason,
    this.cancelled,
    this.approved,
    this.createdStaffId,
    this.cancelledStaffId,
    this.entryDate,
    this.forClassTeacherOnly,
    this.staffRole,
    this.displayTo,
    this.division,
    this.course,
    this.section,
    this.photo,
  });

  GalleryEditAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    displayStartDate = json['displayStartDate'];
    displayEndDate = json['displayEndDate'];
    reason = json['reason'];
    cancelled = json['cancelled'];
    approved = json['approved'];
    createdStaffId = json['createdStaffId'];
    cancelledStaffId = json['cancelledStaffId'];
    entryDate = json['entryDate'];
    forClassTeacherOnly = json['forClassTeacherOnly'];
    staffRole = json['staffRole'];
    displayTo = json['displayTo'];
    division = json['division'];
    course = json['course'];
    section = json['section'];
    if (json['photo'] != null) {
      photo = [];
      json['photo'].forEach((v) {
        photo!.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['displayStartDate'] = this.displayStartDate;
    data['displayEndDate'] = this.displayEndDate;
    data['reason'] = this.reason;
    data['cancelled'] = this.cancelled;
    data['approved'] = this.approved;
    data['createdStaffId'] = this.createdStaffId;
    data['cancelledStaffId'] = this.cancelledStaffId;
    data['entryDate'] = this.entryDate;
    data['forClassTeacherOnly'] = this.forClassTeacherOnly;
    data['staffRole'] = this.staffRole;
    data['displayTo'] = this.displayTo;
    data['division'] = this.division;
    data['course'] = this.course;
    data['section'] = this.section;
    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Photo {
  File? file;
  Null photoCaption;
  bool? isMaster;

  Photo({this.file, this.photoCaption, this.isMaster});

  Photo.fromJson(Map<String, dynamic> json) {
    file = (json['file'] != null ? new File.fromJson(json['file']) : null)!;
    photoCaption = json['photoCaption'];
    isMaster = json['isMaster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['photoCaption'] = this.photoCaption;
    data['isMaster'] = this.isMaster;
    return data;
  }
}

class File {
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;
  Null images;
  String? createdAt;
  String? id;

  File(
      {this.name,
      this.extension,
      this.path,
      this.url,
      this.isTemporary,
      this.isDeleted,
      this.images,
      this.createdAt,
      this.id});

  File.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
    isTemporary = json['isTemporary'];
    isDeleted = json['isDeleted'];
    images = json['images'];
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
    data['images'] = this.images;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
