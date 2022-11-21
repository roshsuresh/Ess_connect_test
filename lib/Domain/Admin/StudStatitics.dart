class StatisticsData {
  String? course;
  int? male;
  int? feMale;
  int? totalCount;
  String? group;
  int? sectionOrder;
  int? courseOrder;

  StatisticsData({
    this.course,
    this.male,
    this.feMale,
    this.totalCount,
    this.group,
    this.sectionOrder,
    this.courseOrder,
  });

  StatisticsData.fromJson(Map<String, dynamic> json) {
    course = json['course'];
    male = json['male'];
    feMale = json['feMale'];
    totalCount = json['totalCount'];
    group = json['group'];
    sectionOrder = json['sectionOrder'];
    courseOrder = json['courseOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course'] = this.course;
    data['male'] = this.male;
    data['feMale'] = this.feMale;
    data['totalCount'] = this.totalCount;
    data['group'] = this.group;
    data['sectionOrder'] = this.sectionOrder;
    data['courseOrder'] = this.courseOrder;
    return data;
  }
}

class TotalStatitics {
  int? netMaleCount;
  int? netFemaleCount;
  int? netTotal;

  TotalStatitics({this.netMaleCount, this.netFemaleCount, this.netTotal});

  TotalStatitics.fromJson(Map<String, dynamic> json) {
    netMaleCount = json['netMaleCount'];
    netFemaleCount = json['netFemaleCount'];
    netTotal = json['netTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['netMaleCount'] = this.netMaleCount;
    data['netFemaleCount'] = this.netFemaleCount;
    data['netTotal'] = this.netTotal;
    return data;
  }
}
