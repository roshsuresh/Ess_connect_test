import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Domain/Staff/MarkEntryModel.dart';
import '../../Domain/Staff/MarkentryViewStaff.dart';
import '../../utils/constants.dart';

class MarkEntryProvider with ChangeNotifier {
  List<MarkEntryInitialValues> selectedCourse = [];

  String filtersDivision = "";
  String filterCourse = "";

  addFilterCourse(String course) {
    filterCourse = course;
    notifyListeners();
  }

  addFilters(String f) {
    filtersDivision = f;
  }

  clearAllFilters() {
    filtersDivision = "";
    filterCourse = "";

    notifyListeners();
  }

//course List
  addSelectedCourse(MarkEntryInitialValues item) {
    if (selectedCourse.contains(item)) {
      print("removing");
      selectedCourse.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedCourse.add(item);
      notifyListeners();
    }
    clearAllFilters();
    addFilterCourse(selectedCourse.first.courseName!);
  }

  removeCourse(MarkEntryInitialValues item) {
    selectedCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    selectedCourse.clear();
  }

  isCourseSelected(MarkEntryInitialValues item) {
    if (selectedCourse.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  courseClear() {
    markEntryInitialValues.clear();
  }

  List<MarkEntryInitialValues> markEntryInitialValues = [];
  Future<bool> getMarkEntryInitialValues() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/markentry/initialvalues'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<MarkEntryInitialValues> templist = List<MarkEntryInitialValues>.from(
          data["courseList"].map((x) => MarkEntryInitialValues.fromJson(x)));
      markEntryInitialValues.addAll(templist);
      print(templist);
      notifyListeners();
    } else {
      print('Error in markEntryInitialValues stf');
    }
    return true;
  }

// Division
  List<MarkEntryDivisionList> selectedDivision = [];

  addSelectedDivision(MarkEntryDivisionList item) {
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

  removeDivision(MarkEntryDivisionList item) {
    selectedDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    selectedDivision.clear();
    notifyListeners();
  }

  isDivisonSelected(MarkEntryDivisionList item) {
    if (selectedDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    markEntryDivisionList.clear();
  }

  List<MarkEntryDivisionList> markEntryDivisionList = [];
  Future<bool> getMarkEntryDivisionValues(String id) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/markentry/coursedetails/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<MarkEntryDivisionList> templist = List<MarkEntryDivisionList>.from(
          data["divisionList"].map((x) => MarkEntryDivisionList.fromJson(x)));
      markEntryDivisionList.addAll(templist);

      notifyListeners();
    } else {
      print('Error in MarkEntryDivisionList stf');
    }
    return true;
  }

  //part

  List<MarkEntryPartList> selectedPart = [];

  addSelectedPart(MarkEntryPartList item) {
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

  removePart(MarkEntryPartList item) {
    selectedPart.remove(item);
    notifyListeners();
  }

  removePartAll() {
    selectedPart.clear();
    notifyListeners();
  }

  isPartSelected(MarkEntryPartList item) {
    if (selectedPart.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  removeAllpartClear() {
    markEntryPartList.clear();
  }

  List<MarkEntryPartList> markEntryPartList = [];
  Future<bool> getMarkEntryPartValues(
      String courseId, String divisionId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('GET',
        Uri.parse('${UIGuide.baseURL}/markentry/part/$courseId/$divisionId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<MarkEntryPartList> templist = List<MarkEntryPartList>.from(
          data["parts"].map((x) => MarkEntryPartList.fromJson(x)));
      markEntryPartList.addAll(templist);

      notifyListeners();
    } else {
      print('Error in MarkEntryPartList stf');
    }
    return true;
  }

  //subjectList

  List<MarkEntrySubjectList> selectedSubject = [];

  addSelectedSubject(MarkEntrySubjectList item) {
    if (selectedSubject.contains(item)) {
      print("removing");
      selectedSubject.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedSubject.add(item);
      notifyListeners();
    }
  }

  removeSubject(MarkEntrySubjectList item) {
    selectedSubject.remove(item);
    notifyListeners();
  }

  removeSubjectAll() {
    selectedSubject.clear();
    notifyListeners();
  }

  isSubjectSelected(MarkEntrySubjectList item) {
    if (selectedSubject.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  removeAllSubjectClear() {
    markEntrySubjectList.clear();
  }

  List<MarkEntrySubjectList> markEntrySubjectList = [];
  Future<bool> getMarkEntrySubjectValues(String divionId, String partId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    print('object');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request('GET',
        Uri.parse('${UIGuide.baseURL}/markentry/subjects/$divionId/$partId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<MarkEntrySubjectList> templist = List<MarkEntrySubjectList>.from(
          data["subjectList"].map((x) => MarkEntrySubjectList.fromJson(x)));
      markEntrySubjectList.addAll(templist);

      notifyListeners();
    } else {
      print('Error in MarkEntrysubjectList stf');
    }
    return true;
  }

  //examList

  List<MarkEntryExamList> selectedExam = [];

  addSelectedExam(MarkEntryExamList item) {
    if (selectedExam.contains(item)) {
      print("removing");
      selectedExam.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedExam.add(item);
      notifyListeners();
    }
  }

  removeExam(MarkEntryExamList item) {
    selectedExam.remove(item);
    notifyListeners();
  }

  removeExamAll() {
    selectedExam.clear();
    notifyListeners();
  }

  isExamSelected(MarkEntryExamList item) {
    if (selectedExam.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  removeAllExamClear() {
    markEntryExamList.clear();
  }

  List<MarkEntryExamList> markEntryExamList = [];
  Future<bool> getMarkEntryExamValues(
      String subjectId, String divisionId, String partId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    print('object');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/markentry/examdetails/$subjectId/$divisionId/$partId'));

    request.headers.addAll(headers);
    print('object');
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('correct');
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<MarkEntryExamList> templist = List<MarkEntryExamList>.from(
          data["examslist"].map((x) => MarkEntryExamList.fromJson(x)));
      markEntryExamList.addAll(templist);

      notifyListeners();
    } else {
      print('Error in MarkEntryExamList stf');
    }
    return true;
  }

  //markentry view
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<StudentMEList> studentMEList = [];
  Future<bool> getMarkEntryView(String course, String date, String division,
      String exam, String part, String subject) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    setLoading(true);
    var request =
        http.Request('POST', Uri.parse('${UIGuide.baseURL}/markentry/view'));
    request.body = json.encode({
      "Course": course,
      "created date": date,
      "Division": division,
      "Exam": exam,
      "Part": part,
      "subject": subject,
      "IsBlocked": "false",
      "StudentMEDet[0]": "[null]"
    });
    request.headers.addAll(headers);
    setLoading(true);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setLoading(true);
      print('---------------------correct--------------------------');
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      // log(data.toString());
      setLoading(true);
      List<StudentMEList> templist = List<StudentMEList>.from(
          data["studentMEList"].map((x) => StudentMEList.fromJson(x)));
      studentMEList.addAll(templist);
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print('Error in MarkEntryView stf');
    }
    return true;
  }

  clearStudentMEList() {
    studentMEList.clear();
    notifyListeners();
  }
}
