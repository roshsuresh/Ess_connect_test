import 'dart:convert';
import 'dart:developer';

import 'package:Ess_test/Domain/Staff/StudentReport_staff.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Admin/StudentListModel.dart';
import '../../utils/constants.dart';

Map? staffStudReportRespo;
List StudReportinitvalues = [];

class StudReportListProvider_stf with ChangeNotifier {
  List<StudReportSectionList> selectedSection = [];

  String filtersDivision = "";
  String filterCourse = "";
  int pageno = 1;

  addFilterSection(String course) {
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

  //Section List
  addSelectedSection(StudReportSectionList item) {
    if (selectedSection.contains(item)) {
      print("removing");
      selectedSection.remove(item);
      notifyListeners();
    } else {
      print("adding");
      selectedSection.add(item);
      notifyListeners();
    }
    clearAllFilters();
    addFilterSection(selectedSection.first.text!);
  }

  removeSection(StudReportSectionList item) {
    selectedSection.remove(item);
    notifyListeners();
  }

  removeSectionAll() {
    selectedSection.clear();
  }

  isSectionSelected(StudReportSectionList item) {
    if (selectedSection.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  SectionClear() {
    stdReportInitialValues.clear();
  }

  List<StudReportSectionList> stdReportInitialValues = [];
  bool? isClassTeacher;
  bool? isDualAttendance;

  Future stdReportSectionStaff() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/staffdet/studentreportinitialvalues"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);

        print(data);
        staffStudReportRespo = data['studentReportInitialValues'];
        StudReportinitvalues = staffStudReportRespo!['sectionList'];
        print(StudReportinitvalues);
        print(isClassTeacher);

        notifyListeners();
      } else {
        print("Error in StdReportSection response");
      }
    } catch (e) {
      print(e);
    }
  }

//course List

  List<StudReportCourse> studReportCourse = [];
  addSelectedCourse(StudReportCourse item) {
    if (studReportCourse.contains(item)) {
      print("removing");
      studReportCourse.remove(item);
      notifyListeners();
    } else {
      print("adding");
      studReportCourse.add(item);
      notifyListeners();
    }
  }

  removeCourse(CourseList item) {
    studReportCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    studReportCourse.clear();
  }

  isCourseSelected(CourseList item) {
    if (studReportCourse.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  courseClear() {
    courselist.clear();
  }

  List<StudReportCourse> courselist = [];

  Future<bool> getCourseList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/mobileapp/common/courselist'));
    request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<StudReportCourse> templist = List<StudReportCourse>.from(
          data["courseList"].map((x) => StudReportCourse.fromJson(x)));
      courselist.addAll(templist);

      notifyListeners();
    } else {
      print('Error in courseList stf');
    }
    return true;
  }
}
