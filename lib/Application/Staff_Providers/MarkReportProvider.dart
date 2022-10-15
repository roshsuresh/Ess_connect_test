import 'dart:convert';
import 'package:Ess_test/Domain/Staff/MarkEntryReport.dart';
import 'package:Ess_test/Domain/Staff/MarkEntryReport.dart';

import 'package:http/http.dart' as http;

import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
