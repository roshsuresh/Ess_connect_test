import 'dart:convert';

import 'package:Ess_Conn/Domain/AttendenceModel.dart';

import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

List? attend;
Map? attendenceRespo;
Map? attendenceData;

class AttendenceProvider with ChangeNotifier {
  double? workDays;
  double? presentDays;
  double? absentDays;
  double? attendancePercentage;

  Future attendenceList() async {
    // await Future.delayed(const Duration(seconds: 2));
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/getattendance"),
        headers: headers);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        attendenceRespo = json.decode(response.body);
        attendenceData = attendenceRespo!['attendence'];

        print(data);
        attend = attendenceData!['monthwiseAttendence'];
        // print(attend);
        AttendenceModel att =
            AttendenceModel.fromJson(attendenceRespo!['attendence']);
        workDays = att.workDays;
        presentDays = att.presentDays;
        absentDays = att.absentDays;
        attendancePercentage = att.attendancePercentage;
        //print('presentDays $presentDays');
        // print(workDays);

        notifyListeners();
      } else {
        print("Error in response");
      }
    } catch (e) {
      print(e);
    }
  }
}
