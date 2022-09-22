class CourseList {
  CourseList({
    required this.courseId,
    required this.name,
    required this.sectionOrder,
    required this.courseOrder,
  });

  String courseId;
  String name;
  int sectionOrder;
  int courseOrder;

  factory CourseList.fromJson(Map<String, dynamic> json) => CourseList(
        courseId: json["courseId"],
        name: json["name"],
        sectionOrder: json["sectionOrder"],
        courseOrder: json["courseOrder"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "name": name,
        "sectionOrder": sectionOrder,
        "courseOrder": courseOrder,
      };
}

class DivisionList {
  DivisionList({
    required this.divisionId,
    required this.name,
    required this.sectionOrder,
    required this.courseOrder,
    required this.divisionOrder,
  });

  String divisionId;
  String name;
  int sectionOrder;
  int courseOrder;
  int divisionOrder;

  factory DivisionList.fromJson(Map<String, dynamic> json) => DivisionList(
        divisionId: json["divisionId"],
        name: json["name"],
        sectionOrder: json["sectionOrder"],
        courseOrder: json["courseOrder"],
        divisionOrder: json["divisionOrder"],
      );

  Map<String, dynamic> toJson() => {
        "divisionId": divisionId,
        "name": name,
        "sectionOrder": sectionOrder,
        "courseOrder": courseOrder,
        "divisionOrder": divisionOrder,
      };
}
