import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Student/AttendenceModel.dart';
import '../../utils/constants.dart';

List? attend;
Map? attendenceRespo;
Map? attendenceData;

class AttendenceProvider with ChangeNotifier {
  double? workDays;
  double? presentDays;
  double? absentDays;
  double? attendancePercentage;
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future attendenceList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/getattendance"),
        headers: headers);
    setLoading(true);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        attendenceRespo = json.decode(response.body);
        attendenceData = attendenceRespo!['attendence'];
        setLoading(true);
        print(data);
        attend = attendenceData!['monthwiseAttendence'];

        AttendenceModel att =
            AttendenceModel.fromJson(attendenceRespo!['attendence']);
        workDays = att.workDays;
        presentDays = att.presentDays;
        absentDays = att.absentDays;
        attendancePercentage = att.attendancePercentage;

        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in response");
      }
    } catch (e) {
      print(e);
    }
  }
}
