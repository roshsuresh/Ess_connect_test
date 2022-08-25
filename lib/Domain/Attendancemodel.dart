



class AttendanceModel {
  AttendanceModel({
    this.workDays,
    this.presentDays,
    this.absentDays,
    this.attendancePercentage,
    this.attendanceAsOnDate,
    this.monthwiseAttendence,
  });

  double? workDays;
  double? presentDays;
  double? absentDays;
  double? attendancePercentage;
  DateTime? attendanceAsOnDate;
  List<MonthwiseAttendence>? monthwiseAttendence;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
    workDays: json["workDays"].toDouble(),
    presentDays: json["presentDays"].toDouble(),
    absentDays: json["absentDays"].toDouble(),
    attendancePercentage: json["attendancePercentage"].toDouble(),
    attendanceAsOnDate: DateTime.parse(json["attendanceAsOnDate"]),
    monthwiseAttendence: List<MonthwiseAttendence>.from(json["monthwiseAttendence"].map((x) => MonthwiseAttendence.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "workDays": workDays,
    "presentDays": presentDays,
    "absentDays": absentDays,
    "attendancePercentage": attendancePercentage,
    "attendanceAsOnDate": attendanceAsOnDate?.toIso8601String(),
    "monthwiseAttendence": List<dynamic>.from(monthwiseAttendence!.map((x) => x.toJson())),
  };
}

class MonthwiseAttendence {
  MonthwiseAttendence({
    this.month,
    this.monthNo,
    this.attMonthId,
    this.totalWorkingDays,
    this.daysPresent,
    this.daysAbsent,
    this.percentage,
  });

  String? month;
  int? monthNo;
  String? attMonthId;
  int? totalWorkingDays;
  double? daysPresent;
  double? daysAbsent;
  double? percentage;

  factory MonthwiseAttendence.fromJson(Map<String, dynamic> json) => MonthwiseAttendence(
    month: json["month"],
    monthNo: json["monthNo"],
    attMonthId: json["attMonthId"],
    totalWorkingDays: json["totalWorkingDays"],
    daysPresent: json["daysPresent"].toDouble(),
    daysAbsent: json["daysAbsent"].toDouble(),
    percentage: json["percentage"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "monthNo": monthNo,
    "attMonthId": attMonthId,
    "totalWorkingDays": totalWorkingDays,
    "daysPresent": daysPresent,
    "daysAbsent": daysAbsent,
    "percentage": percentage,
  };
}