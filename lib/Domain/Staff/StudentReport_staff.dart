class StudentReportInitialValues {
  List<StudReportSectionList>? sectionList;

  StudentReportInitialValues({this.sectionList});

  StudentReportInitialValues.fromJson(Map<String, dynamic> json) {
    if (json['sectionList'] != null) {
      sectionList = [];
      json['sectionList'].forEach((v) {
        sectionList!.add(StudReportSectionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sectionList != null) {
      data['sectionList'] = this.sectionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudReportSectionList {
  String? value;
  String? text;
  bool? selected;
  Null active;
  Null order;

  StudReportSectionList(
      {this.value, this.text, this.selected, this.active, this.order});

  StudReportSectionList.fromJson(Map<String, dynamic> json) {
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

//course

class StudReportCourse {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  StudReportCourse(
      {this.value, this.text, this.selected, this.active, this.order});

  StudReportCourse.fromJson(Map<String, dynamic> json) {
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

//Division

class StudReportDivision {
  String? value;
  String? text;
  Null selected;
  Null active;
  Null order;

  StudReportDivision(
      {this.value, this.text, this.selected, this.active, this.order});

  StudReportDivision.fromJson(Map<String, dynamic> json) {
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
