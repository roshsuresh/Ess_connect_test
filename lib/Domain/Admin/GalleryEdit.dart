// class GalleryEditAdmin {
//   String? id;
//   String? title;
//   String? displayStartDate;
//   String? displayEndDate;
//   bool? cancelled;
//   bool? approved;
//   String? createdStaffId;
//   String? entryDate;
//   bool? forClassTeacherOnly;
//   String? displayTo;
//   List<Photo>? photo;

//   GalleryEditAdmin({
//     this.id,
//     this.title,
//     this.displayStartDate,
//     this.displayEndDate,
//     this.cancelled,
//     this.approved,
//     this.createdStaffId,
//     this.entryDate,
//     this.forClassTeacherOnly,
//     this.displayTo,
//     this.photo,
//   });

//   GalleryEditAdmin.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     displayStartDate = json['displayStartDate'];
//     displayEndDate = json['displayEndDate'];

//     cancelled = json['cancelled'];
//     approved = json['approved'];
//     createdStaffId = json['createdStaffId'];

//     entryDate = json['entryDate'];
//     forClassTeacherOnly = json['forClassTeacherOnly'];

//     displayTo = json['displayTo'];

//     if (json['photo'] != null) {
//       photo = [];
//       json['photo'].forEach((v) {
//         photo!.add(new Photo.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['displayStartDate'] = this.displayStartDate;
//     data['displayEndDate'] = this.displayEndDate;

//     data['cancelled'] = this.cancelled;
//     data['approved'] = this.approved;
//     data['createdStaffId'] = this.createdStaffId;

//     data['entryDate'] = this.entryDate;
//     data['forClassTeacherOnly'] = this.forClassTeacherOnly;

//     data['displayTo'] = this.displayTo;

//     if (this.photo != null) {
//       data['photo'] = this.photo!.map((v) => v.toJson()).toList();
//     }

//     return data;
//   }
// }

// class Photo {
//   File? file;

//   bool? isMaster;

//   Photo({this.file, this.isMaster});

//   Photo.fromJson(Map<String, dynamic> json) {
//     file = (json['file'] != null ? new File.fromJson(json['file']) : null)!;

//     isMaster = json['isMaster'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.file != null) {
//       data['file'] = this.file!.toJson();
//     }

//     data['isMaster'] = this.isMaster;
//     return data;
//   }
// }

// class File {
//   String? name;
//   String? extension;
//   String? path;
//   String? url;
//   bool? isTemporary;
//   bool? isDeleted;

//   String? createdAt;
//   String? id;

//   File(
//       {this.name,
//       this.extension,
//       this.path,
//       this.url,
//       this.isTemporary,
//       this.isDeleted,
//       this.createdAt,
//       this.id});

//   File.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     extension = json['extension'];
//     path = json['path'];
//     url = json['url'];
//     isTemporary = json['isTemporary'];
//     isDeleted = json['isDeleted'];

//     createdAt = json['createdAt'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['extension'] = this.extension;
//     data['path'] = this.path;
//     data['url'] = this.url;
//     data['isTemporary'] = this.isTemporary;
//     data['isDeleted'] = this.isDeleted;

//     data['createdAt'] = this.createdAt;
//     data['id'] = this.id;
//     return data;
//   }
// }

class GalleryEditAdmin {
  String? id;
  String? title;
  String? displayStartDate;
  String? displayEndDate;
  bool? cancelled;
  bool? approved;
  String? createdStaffId;
  String? entryDate;
  bool? forClassTeacherOnly;
  String? displayTo;
  List<PhotoEdit>? photo;

  GalleryEditAdmin({
    this.id,
    this.title,
    this.displayStartDate,
    this.displayEndDate,
    this.cancelled,
    this.approved,
    this.createdStaffId,
    this.entryDate,
    this.forClassTeacherOnly,
    this.displayTo,
    this.photo,
  });

  GalleryEditAdmin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    displayStartDate = json['displayStartDate'];
    displayEndDate = json['displayEndDate'];

    cancelled = json['cancelled'];
    approved = json['approved'];
    createdStaffId = json['createdStaffId'];

    entryDate = json['entryDate'];
    forClassTeacherOnly = json['forClassTeacherOnly'];

    displayTo = json['displayTo'];

    if (json['photo'] != null) {
      photo = <PhotoEdit>[];
      json['photo'].forEach((v) {
        photo!.add(PhotoEdit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['displayStartDate'] = this.displayStartDate;
    data['displayEndDate'] = this.displayEndDate;

    data['cancelled'] = this.cancelled;
    data['approved'] = this.approved;
    data['createdStaffId'] = this.createdStaffId;

    data['entryDate'] = this.entryDate;
    data['forClassTeacherOnly'] = this.forClassTeacherOnly;

    data['displayTo'] = this.displayTo;

    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class PhotoEdit {
  String? file;
  String? photoCaption;
  bool? isMaster;

  PhotoEdit({this.file, this.photoCaption, this.isMaster});

  PhotoEdit.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    photoCaption = json['photoCaption'];
    isMaster = json['isMaster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['photoCaption'] = this.photoCaption;
    data['isMaster'] = this.isMaster;
    return data;
  }
}
