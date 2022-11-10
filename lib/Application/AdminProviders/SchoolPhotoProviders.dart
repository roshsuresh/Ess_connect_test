import 'dart:convert';
import 'dart:developer';

import 'package:Ess_test/Domain/Admin/schoolPhotoModel.dart';
import 'package:Ess_test/Domain/Staff/StudentReport_staff.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SchoolPhotoProviders with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //len
  int courseLen = 0;
  len() {
    courseLen = 0;
    notifyListeners();
  }

  String? url;
  Future<int> getSchoolPhoto() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/admin/school/photo"),
        headers: headers);
    if (response.statusCode == 200) {
      //  print('correct');
      Map<String, dynamic> data = json.decode(response.body);
      Map<String, dynamic> school = data['schoolphoto'];
      Schoolphoto ac = Schoolphoto.fromJson(school);
      url = ac.url;
      //  print(url);
      notifyListeners();
      // print(response.body);
    } else {
      print('Error in dashboard');
    }
    return response.statusCode;
  }

  //section list

  List<StudReportSectionList> stdReportInitialValues = [];
  List<MultiSelectItem> dropDown = [];
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
        Map<String, dynamic> stl = data['studentReportInitialValues'];
        // studReportinitvalues_stf = staffStudReportRespo!['sectionList'];
        // print(studReportinitvalues_stf);
        // print(staffStudReportRespo);
        List<StudReportSectionList> templist = List<StudReportSectionList>.from(
            stl["sectionList"].map((x) => StudReportSectionList.fromJson(x)));
        stdReportInitialValues.addAll(templist);

        dropDown = stdReportInitialValues.map((subjectdata) {
          return MultiSelectItem(subjectdata, subjectdata.text!);
        }).toList();
        print(dropDown);
        notifyListeners();
      } else {
        print("Error in notification response");
      }
    } catch (e) {
      print(e);
    }
  }

  //course

  List<StudReportCourse> courselist = [];
  List<MultiSelectItem> courseDrop = [];
  List<MultiSelectItem> divisionDrop = [];
  clearSection() {
    dropDown.clear();
    stdReportInitialValues.clear();
    notifyListeners();
  }

  clearCourse() {
    courseDrop.clear();
    courselist.clear();
    notifyListeners();
  }

  clearDivision() async {
    divisionDrop.clear();
    divisionlist.clear();
    notifyListeners();
  }

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
    print(http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/course/$sectionId')));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<StudReportCourse> templist = List<StudReportCourse>.from(
          data["course"].map((x) => StudReportCourse.fromJson(x)));
      courselist.addAll(templist);
      courseDrop = courselist.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.text);
      }).toList();
      notifyListeners();
    } else {
      print('Error in courseList stf');
    }
    return true;
  }

  //Division
  divisionListClear() {
    divisionlist.clear();
    notifyListeners();
  }

  List<StudReportDivision> divisionlist = [];

  Future<bool> getDivisionList(String courseId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/divisions/$courseId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('object');
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<StudReportDivision> templist = List<StudReportDivision>.from(
          data["divisionbyCourse"].map((x) => StudReportDivision.fromJson(x)));
      divisionlist.addAll(templist);
      divisionDrop = divisionlist.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.text!);
      }).toList();
      notifyListeners();
    } else {
      print('Error in DivisionList stf');
    }
    return true;
  }
}
