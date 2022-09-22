import 'dart:convert';
import 'dart:developer';

import 'package:Ess_Conn/Domain/Staff/MarkEntryModel.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    var request = http.Request('GET',
        Uri.parse('${UIGuide.baseURL}/mobileapp/staff/markEntryInitialvalues'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<MarkEntryInitialValues> templist = List<MarkEntryInitialValues>.from(
          data["markEntryInitialValues"]
              .map((x) => MarkEntryInitialValues.fromJson(x)));
      markEntryInitialValues.addAll(templist);

      notifyListeners();
    } else {
      print('Error in markEntryInitialValues stf');
    }
    return true;
  }

  List<MarkEntryDivisionList> selectedDivision = [];

  addSelectedDivision(MarkEntryDivisionList item) {
    if (selectedDivision.contains(item)) {
      print("removing");
      selectedDivision.remove(item);
      // notifyListeners();
    } else {
      print("adding");
      selectedDivision.add(item);
      // notifyListeners();
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

  List<MarkEntryDivisionList> markEntryDivisionList = [];
  Future<bool> getMarkEntryDivisionValues(String id) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staff/markEntrycoursedetails/$id'));

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
}
