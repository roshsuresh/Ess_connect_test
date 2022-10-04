import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Staff/StudentReport_staff.dart';
import 'package:Ess_test/Domain/Staff/StudentReport_staff.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

Map? staffStudReportRespo;
List? studReportinitvalues_stf;

class StudReportListProvider_stf with ChangeNotifier {
  List<StudReportSectionList> selectedSection = [];

  String filtersDivision = "";
  String filterCourse = "";

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

  sectionClear() {
    stdReportInitialValues.clear();
  }

  List<StudReportSectionList> stdReportInitialValues = [];

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

        //print(data);
        staffStudReportRespo = data['studentReportInitialValues'];
        studReportinitvalues_stf = staffStudReportRespo!['sectionList'];
        print(studReportinitvalues_stf);
        // print(staffStudReportRespo);

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

  removeCourse(StudReportCourse item) {
    studReportCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    studReportCourse.clear();
  }

  isCourseSelected(
    StudReportCourse item,
  ) {
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

  Future<bool> getCourseList(String sectionId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/course/$sectionId'));
    request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      // log(data.toString());

      List<StudReportCourse> templist = List<StudReportCourse>.from(
          data["course"].map((x) => StudReportCourse.fromJson(x)));
      courselist.addAll(templist);

      notifyListeners();
    } else {
      print('Error in courseList stf');
    }
    return true;
  }

  //Division List

  List<StudReportDivision> studReportDivision = [];
  addSelectedDivision(StudReportDivision item) {
    if (studReportDivision.contains(item)) {
      print("removing");
      studReportDivision.remove(item);
      notifyListeners();
    } else {
      print("adding");
      studReportDivision.add(item);
      notifyListeners();
    }
  }

  removeDivision(StudReportDivision item) {
    studReportDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    studReportDivision.clear();
  }

  isDivisionSelected(
    StudReportDivision item,
  ) {
    if (studReportDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    divisionlist.clear();
  }

  List<StudReportDivision> divisionlist = [];

  Future<bool> getDivisionList(String sectionId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/division/$sectionId'));
    request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<StudReportDivision> templist = List<StudReportDivision>.from(
          data["division"].map((x) => StudReportDivision.fromJson(x)));
      divisionlist.addAll(templist);

      notifyListeners();
    } else {
      print('Error in DivisionList stf');
    }
    return true;
  }

  //view initial
  List<ViewStudentReport> viewStudReportListt = [];
  Future<bool> viewStudentReportList(
      String section, String course, String division) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/viewStudentReport?section=$section&course=$course&division=$division'));
    request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<ViewStudentReport> templist = List<ViewStudentReport>.from(
          data["viewStudentReport"].map((x) => ViewStudentReport.fromJson(x)));
      viewStudReportListt.addAll(templist);
      // int len = templist.length;
      // String ss = templist[len].terminationStatus.toString();
      // log(ss.toString());

      notifyListeners();
    } else {
      print('Error in ViewList stf');
    }
    return true;
  }

  clearViewList() {
    viewStudReportListt.clear();
    notifyListeners();
  }
}
