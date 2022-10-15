import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Ess_test/Domain/Admin/DashBoard.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeProviders with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  int? totalStudentStrength;
  int? boysStrength;
  int? girlsStrength;
  int? totalStaffStrength;
  int? nonTeachingStrength;
  int? teachingStrength;

  Future dashBoardList() async {
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

        setLoading(true);

        AdminDashboard att = AdminDashboard.fromJson(data);
        totalStudentStrength = att.totalStudentStrength;
        boysStrength = att.boysStrength;
        girlsStrength = att.girlsStrength;
        totalStaffStrength = att.totalStaffStrength;
        nonTeachingStrength = att.nonTeachingStrength;
        teachingStrength = att.teachingStrength;

        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in dashboard response");
      }
    } catch (e) {
      print(e);
    }
  }
}
