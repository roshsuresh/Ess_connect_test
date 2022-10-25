import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Staff/MarkEntryReport.dart';
import 'package:Ess_test/Domain/Staff/MarkEntryReport.dart';

import 'package:http/http.dart' as http;

import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map? markSubject;
List? markReportSub;
List? markRepoExam;

class MarkEntryReportProvider_stf with ChangeNotifier {
  List<MarkReportCourseList> selectedCourse = [];

//course List
  addSelectedCourse(MarkReportCourseList item) {
    if (selectedCourse.contains(item)) {
      print("removing");
      selectedCourse.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedCourse.add(item);
      notifyListeners();
    }
  }

  removeCourse(MarkReportCourseList item) {
    selectedCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    selectedCourse.clear();
  }

  isCourseSelected(MarkReportCourseList item) {
    if (selectedCourse.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  courseClear() {
    markReportCourseList.clear();
  }

  List<MarkReportCourseList> markReportCourseList = [];
  bool? isClassTeacher;
  bool? isDualAttendance;

  Future markReportcourse() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/markentryReport/initialvalues"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);

        print(data);
        List<MarkReportCourseList> templist = List<MarkReportCourseList>.from(
            data["courseList"].map((x) => MarkReportCourseList.fromJson(x)));
        markReportCourseList.addAll(templist);

        notifyListeners();
      } else {
        print("Error in MarkentryReport_course response");
      }
    } catch (e) {
      print(e);
    }
  }

  //division list

  List<MarkReportDivisions> selectedDivision = [];
  addSelectedDivision(MarkReportDivisions item) {
    if (selectedDivision.contains(item)) {
      print("removing");
      selectedDivision.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedDivision.add(item);
      notifyListeners();
    }
  }

  removeDivision(MarkReportDivisions item) {
    selectedDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    selectedDivision.clear();
  }

  isDivisionSelected(MarkReportDivisions item) {
    if (selectedDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    markReportDivisions.clear();
  }

  List<MarkReportDivisions> markReportDivisions = [];

  Future markReportDivisionList(String courseId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/markentryReport/coursedetails/$courseId"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);

        print(data);
        List<MarkReportDivisions> templist = List<MarkReportDivisions>.from(
            data["divisions"].map((x) => MarkReportDivisions.fromJson(x)));
        markReportDivisions.addAll(templist);

        notifyListeners();
      } else {
        print("Error in MarkentryReport_Division response");
      }
    } catch (e) {
      print(e);
    }
  }

  //part list
  List<MarkReportPartList> selectedPart = [];
  addSelectedPart(MarkReportPartList item) {
    if (selectedPart.contains(item)) {
      print("removing");
      selectedPart.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedPart.add(item);
      notifyListeners();
    }
  }

  removePart(MarkReportPartList item) {
    selectedPart.remove(item);
    notifyListeners();
  }

  removePartAll() {
    selectedPart.clear();
  }

  isPartSelected(MarkReportPartList item) {
    if (selectedPart.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  partClear() {
    markReportPartList.clear();
  }

  List<MarkReportPartList> markReportPartList = [];

  Future markReportPart(String courseId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/markentryReport/coursedetails/$courseId"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);

        print(data);
        List<MarkReportPartList> templist = List<MarkReportPartList>.from(
            data["parts"].map((x) => MarkReportPartList.fromJson(x)));
        markReportPartList.addAll(templist);

        notifyListeners();
      } else {
        print("Error in MarkentryReport_Parts response");
      }
    } catch (e) {
      print(e);
    }
  }

  //subject
  // List<MarkReportSubjectList> selectedSubject = [];
  // addSelectedSubject(MarkReportSubjectList item) {
  //   if (selectedSubject.contains(item)) {
  //     print("removing");
  //     selectedSubject.remove(item);
  //     notifyListeners();
  //   } else {
  //     print("adding");
  //     selectedSubject.add(item);
  //     notifyListeners();
  //   }
  // }

  // removeSubject(MarkReportSubjectList item) {
  //   selectedSubject.remove(item);
  //   notifyListeners();
  // }

  // removeSubjectAll() {
  //   selectedSubject.clear();
  // }

  // isSubjectSelected(MarkReportSubjectList item) {
  //   if (selectedSubject.contains(item)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // subjectClear() {
  //   markReportSubjectList.clear();
  // }

  List<MarkReportSubjectList> markSubjectList = [];
  Future markReportSubject(
      String courseId, String division, String part) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/markentryReport/subjects'));
    request.body = json.encode({
      "CourseId": courseId,
      "DivisionId": [division],
      "PartId": part
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      markSubject = jsonDecode(await response.stream.bytesToString());
      markReportSub = await markSubject!['subjectList'];
      // print(markSubject);
      print(markReportSub);
      notifyListeners();
      // List<MarkReportSubjectList> templist = List<MarkReportSubjectList>.from(
      //     data["subjectList"].map((x) => MarkReportSubjectList.fromJson(x)));
      // markSubjectList.addAll(templist);
    }
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200) {
    //   print('Success--------------------');
    //   Map<String, dynamic> data =
    //       jsonDecode(await response.stream.bytesToString());
    //   log(data.toString());
    //   List<MarkReportSubjectList> templist = List<MarkReportSubjectList>.from(
    //       data["subjectList"].map((x) => MarkReportSubjectList.fromJson(x)));
    //   markSubjectList.addAll(templist);

    //   notifyListeners();

    //   print('Success--------------------');
    //   print(await response.stream.bytesToString());
    // }
    else {
      print(response.reasonPhrase);
    }
    return true;
  }

  // exam
  List<MarkReportExamList> markReportExamList = [];
  Future markReportExam(
      String course, String division, String part, String subject) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/markentryReport/exam'));
    request.body = json.encode({
      "CourseId": "77d9839f-c910-47d6-94ee-9bd119e2dae7",
      "DivisionId": ["b2ba13d8-9834-4393-ae11-a9714045ec44"],
      "PartId": "415854e0-9d90-40c3-bc30-9e1ce619ba29",
      "SubjectId": ["f20e6138-e1f7-4d88-8a60-3c73820f1415"]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());

      final data = await jsonDecode(await response.stream.bytesToString());
      markRepoExam = data['examList'];
      print(markRepoExam);
      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }

  //view

  List<MarkEntryREportViewStaff> markEntryREportViewStaff = [];
  Future markReportView() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/markentryReport/view'));
    request.body = json.encode({
      "SchoolId": "0cead469-c94b-4538-adc6-47658c616f34",
      "staffId": "7769c40f-5e1d-4acc-bc4e-df816f33b2b3",
      "CourseId": "77d9839f-c910-47d6-94ee-9bd119e2dae7",
      "DivisionId": "b2ba13d8-9834-4393-ae11-a9714045ec44",
      "PartId": "415854e0-9d90-40c3-bc30-9e1ce619ba29",
      "ExamId": "Term-1_NBS1",
      "SubjectId": "f20e6138-e1f7-4d88-8a60-3c73820f1415",
      "SubjectIdList": [
        {"text": "English", "value": "f20e6138-e1f7-4d88-8a60-3c73820f1415"}
      ],
      "DivisionIdList": [
        {"text": "I-A", "value": "b2ba13d8-9834-4393-ae11-a9714045ec44"}
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      final data = json.decode(request.body);

      print(data);
      List<MarkReportCourseList> templist = List<MarkReportCourseList>.from(
          data["courseList"].map((x) => MarkReportCourseList.fromJson(x)));
      markReportCourseList.addAll(templist);
    } else {
      print(response.reasonPhrase);
    }
  }
}
