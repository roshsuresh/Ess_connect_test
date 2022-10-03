class NoticeboardInitialValues {
  List<NoticeboardCourseList>? courseList;
  List<NoticeBoardDivision>? divisionList;

  List<NoticeboardCategory>? category;
  bool? isClassTeacher;

  NoticeboardInitialValues(
      {this.courseList, this.divisionList, this.category, this.isClassTeacher});

  NoticeboardInitialValues.fromJson(Map<String, dynamic> json) {
    if (json['courseList'] != null) {
      courseList = [];
      json['courseList'].forEach((v) {
        courseList!.add(NoticeboardCourseList.fromJson(v));
      });
    }
    if (json['divisionList'] != null) {
      divisionList = [];
      json['divisionList'].forEach((v) {
        divisionList!.add(NoticeBoardDivision.fromJson(v));
      });
    }

    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category!.add(NoticeboardCategory.fromJson(v));
      });
    }
    isClassTeacher = json['isClassTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courseList != null) {
      data['courseList'] = this.courseList!.map((v) => v.toJson()).toList();
    }
    if (this.divisionList != null) {
      data['divisionList'] = this.divisionList!.map((v) => v.toJson()).toList();
    }

    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    data['isClassTeacher'] = this.isClassTeacher;
    return data;
  }
}

class NoticeboardCourseList {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  NoticeboardCourseList(
      {this.value, this.text, this.selected, this.active, this.order});

  NoticeboardCourseList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    selected = json['selected'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['selected'] = this.selected;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}

class NoticeBoardDivision {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  NoticeBoardDivision(
      {this.value, this.text, this.selected, this.active, this.order});

  NoticeBoardDivision.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    selected = json['selected'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['selected'] = this.selected;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}

class NoticeboardCategory {
  String? value;
  String? text;
  bool? selected;
  Null active;
  Null order;

  NoticeboardCategory(
      {this.value, this.text, this.selected, this.active, this.order});

  NoticeboardCategory.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    selected = json['selected'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['selected'] = this.selected;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}

//Noticeboard Post method ---- Image id

class NoticeImageId {
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;

  String? createdAt;
  String? id;

  NoticeImageId(
      {this.name,
      this.extension,
      this.path,
      this.url,
      this.isTemporary,
      this.isDeleted,
      this.createdAt,
      this.id});

  NoticeImageId.fromJson(Map<String, dynamic> json) {
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

//NoticeBoard received

class NoticeBoardReceivedstaff {
  String? noticeId;
  String? noticeBoardFileid;
  String? title;
  String? matter;
  String? entryDate;
  String? entryTime;
  String? staffName;

  NoticeBoardReceivedstaff({
    this.noticeId,
    this.noticeBoardFileid,
    this.title,
    this.matter,
    this.entryDate,
    this.entryTime,
    this.staffName,
  });

  NoticeBoardReceivedstaff.fromJson(Map<String, dynamic> json) {
    noticeId = json['noticeId'];
    noticeBoardFileid = json['noticeBoardFileid'];
    title = json['title'];
    matter = json['matter'];
    entryDate = json['entryDate'];
    entryTime = json['entryTime'];
    staffName = json['staffName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['noticeId'] = this.noticeId;
    data['noticeBoardFileid'] = this.noticeBoardFileid;
    data['title'] = this.title;
    data['matter'] = this.matter;
    data['entryDate'] = this.entryDate;
    data['entryTime'] = this.entryTime;
    data['staffName'] = this.staffName;
    return data;
  }
}

//NoticeBoardAttachmnet

class NoticeBoardAttatchmentStaffReceived {
  String? name;
  String? extension;
  String? path;
  String? url;

  bool? isDeleted;

  String? createdAt;
  String? id;

  NoticeBoardAttatchmentStaffReceived(
      {this.name,
      this.extension,
      this.path,
      this.url,
      this.isDeleted,
      this.createdAt,
      this.id});

  NoticeBoardAttatchmentStaffReceived.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];

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

    data['isDeleted'] = this.isDeleted;

    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
