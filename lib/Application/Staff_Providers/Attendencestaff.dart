import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Staff/StaffAttandenceModel.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Map? staffAttendeceRespo;
List? attendecourse;

class AttendenceStaffProvider with ChangeNotifier {
  List<AttendenceCourse> selectedCourse = [];

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
  addSelectedCourse(AttendenceCourse item) {
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
    addFilterCourse(selectedCourse.first.text!);
  }

  removeCourse(AttendenceCourse item) {
    selectedCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    selectedCourse.clear();
  }

  isCourseSelected(AttendenceCourse item) {
    if (selectedCourse.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  courseClear() {
    attendenceInitialValues.clear();
  }

  List<AttendenceCourse> attendenceInitialValues = [];
  bool? isClassTeacher;
  bool? isDualAttendance;

  Future attendenceCourseStaff() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/staff/AttendenceInitialvalues"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);

        print(data);
        staffAttendeceRespo = data['attendenceinitvalues'];
        Attendenceinitvalues att =
            Attendenceinitvalues.fromJson(data['attendenceinitvalues']);

        isClassTeacher = att.isClassTeacher;
        attendecourse = staffAttendeceRespo!['course'];
        print(attendecourse);
        print(isClassTeacher);

        notifyListeners();
      } else {
        print("Error in attendencecourse response");
      }
    } catch (e) {
      print(e);
    }
  }

// Division
  List<AttendenceDivisions> selectedDivision = [];

  addSelectedDivision(AttendenceDivisions item) {
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

  removeDivision(AttendenceDivisions item) {
    selectedDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    selectedDivision.clear();
    notifyListeners();
  }

  isDivisonSelected(AttendenceDivisions item) {
    if (selectedDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    attendenceDivisionList.clear();
  }

  List<AttendenceDivisions> attendenceDivisionList = [];
  Future<bool> getAttendenceDivisionValues(String id) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('GET',
        Uri.parse('${UIGuide.baseURL}/mobileapp/staff/AttendenceDivision/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<AttendenceDivisions> templist = List<AttendenceDivisions>.from(
          data["divisions"].map((x) => AttendenceDivisions.fromJson(x)));
      attendenceDivisionList.addAll(templist);
      print('correct');
      notifyListeners();
    } else {
      print('Error in AttendenceDivisionList stf');
    }
    return true;
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> getAttendanceView(String id, String date) async {
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staff/AttendenceView?=&divisionId=$id&attendanceDate=$date'));

    request.body = json.encode({"SchoolId": _pref.getString('schoolId')});

    request.headers.addAll(headers);
    setLoading(true);
    http.StreamedResponse response = await request.send();
    setLoading(true);
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<AttendenceDivisions> templist = List<AttendenceDivisions>.from(
          data["divisions"].map((x) => AttendenceDivisions.fromJson(x)));
      attendenceDivisionList.addAll(templist);
      print('correct');
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print('Error in AttendenceDivisionList stf');
    }
    return true;
  }

  //view Attendence

  List<StudentsAttendenceView_stf> studentsAttendenceView = [];
  Future<bool> getstudentsAttendenceView(String date, String id) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    notifyListeners();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staff/AttendenceView?attendanceDate=$date&divisionId=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<StudentsAttendenceView_stf> templist =
          List<StudentsAttendenceView_stf>.from(data["studentsAttendenceView"]
              .map((x) => StudentsAttendenceView_stf.fromJson(x)));
      studentsAttendenceView.addAll(templist);
      print('correct');
      notifyListeners();
    } else {
      print('Error in AttendenceView stf');
    }
    return true;
  }

  clearStudentList() {
    studentsAttendenceView.clear();
    notifyListeners();
  }

  DateTime? _mydatetime;
  String? timeNew;

  String? timee = DateFormat('yyyy-MM-dd').format(DateTime.now());

  getDate(BuildContext context) async {
    _mydatetime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    timeNew = DateFormat('yyyy-MM-dd').format(_mydatetime!) == null
        ? timee
        : DateFormat('yyyy-MM-dd').format(_mydatetime!);
    timee = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(timeNew);

    print(_mydatetime);
    notifyListeners();
  }
}
