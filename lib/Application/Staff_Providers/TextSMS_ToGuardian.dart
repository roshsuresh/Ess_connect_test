import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Staff/ToGuardian_TextSMS.dart';
import 'package:http/http.dart' as http;
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map? staffTextSMSToGuardianRespo;
List? staffTextSMSToGuardRespo;

class TextSMS_ToGuardian_Providers with ChangeNotifier {
  List<TextSMS_ToGuardian_course> selectedCourse = [];

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
  addSelectedCourse(TextSMS_ToGuardian_course item) {
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

  removeCourse(TextSMS_ToGuardian_course item) {
    selectedCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    selectedCourse.clear();
  }

  isCourseSelected(TextSMS_ToGuardian_course item) {
    if (selectedCourse.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  courseClear() {
    communicationToGuardianInitialValues.clear();
  }

  List<TextSMS_ToGuardian_course> communicationToGuardianInitialValues = [];
  bool? isClassTeacher;
  bool? isDualAttendance;

  Future communicationToGuardianCourseStaff() async {
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
        staffTextSMSToGuardianRespo = data['attendenceinitvalues'];
        TextSMS_ToGuardian_initialValues att =
            TextSMS_ToGuardian_initialValues.fromJson(
                data['attendenceinitvalues']);

        isClassTeacher = att.isClassTeacher;
        staffTextSMSToGuardRespo = staffTextSMSToGuardianRespo!['course'];
        print(staffTextSMSToGuardRespo);
        print(isClassTeacher);

        notifyListeners();
      } else {
        print("Error in textsms_toguard_course response");
      }
    } catch (e) {
      print(e);
    }
  }

// Division
  List<TextSMS_ToGuardian_Division> selectedDivision = [];

  addSelectedDivision(TextSMS_ToGuardian_Division item) {
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

  removeDivision(TextSMS_ToGuardian_Division item) {
    selectedDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    selectedDivision.clear();
    notifyListeners();
  }

  isDivisonSelected(TextSMS_ToGuardian_Division item) {
    if (selectedDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    notificationDivisionList.clear();
  }

  List<TextSMS_ToGuardian_Division> notificationDivisionList = [];
  Future<bool> communicationToGuardianDivisionStaff(String id) async {
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

      List<TextSMS_ToGuardian_Division> templist =
          List<TextSMS_ToGuardian_Division>.from(data["divisions"]
              .map((x) => TextSMS_ToGuardian_Division.fromJson(x)));
      notificationDivisionList.addAll(templist);
      print('correct');
      notifyListeners();
    } else {
      print('Error in staff_toGuard_textsms_DivisionList ');
    }
    return true;
  }

  //view NotificationList

  List<TExtSMS_VIEW_byStaff> notificationView = [];
  Future<bool> getNotificationView(String course, String division) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    notifyListeners();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentlistbycoursedivision?courseId=$course&divisionId=$division'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<TExtSMS_VIEW_byStaff> templist = List<TExtSMS_VIEW_byStaff>.from(
          data["studentViewbyCourseDivision"]
              .map((x) => TExtSMS_VIEW_byStaff.fromJson(x)));
      notificationView.addAll(templist);
      print('correct');
      notifyListeners();
    } else {
      print('Error in textsmsView stf');
    }
    return true;
  }

  clearStudentList() {
    notificationView.clear();
    notifyListeners();
  }

  bool isSelected(TExtSMS_VIEW_byStaff model) {
    TExtSMS_VIEW_byStaff selected = notificationView
        .firstWhere((element) => element.admnNo == model.admnNo);
    return selected.selected!;
  }

  void selectItem(TExtSMS_VIEW_byStaff model) {
    TExtSMS_VIEW_byStaff selected = notificationView
        .firstWhere((element) => element.admnNo == model.admnNo);
    selected.selected ??= false;
    selected.selected = !selected.selected!;
    print(selected.toJson());
    notifyListeners();
  }

  bool isselectAll = false;
  void selectAll() {
    if (notificationView.first.selected == true) {
      for (var element in notificationView) {
        element.selected = false;
      }
      isselectAll = false;
    } else {
      for (var element in notificationView) {
        element.selected = true;
      }
      isselectAll = true;
    }

    notifyListeners();
  }

  List<TExtSMS_VIEW_byStaff> selectedList = [];
  submitStudent(BuildContext context) {
    selectedList.clear();
    selectedList =
        notificationView.where((element) => element.selected == true).toList();
    if (selectedList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select ...'),
        duration: Duration(seconds: 1),
      ));
    } else {
      print('selected.....');
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessagePage(
      //               toList:
      //                   selectedList.map((e) => e.presentDetailsId).toList(),
      //               type: "Student",
      //             )));
    }
  }
}
