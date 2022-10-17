import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Admin/DashboardModel.dart';
import '../../utils/constants.dart';
class DashboardAdmin extends ChangeNotifier{
  late int totalStudentStrength;
  late int boysStrength;
  int? girlsStrength;
  int? totalStaffStrength;
  int? nonTeachingStrength;
  int? teachingStrength;
  Future<int> getDashboard(String key) async {
    String res;
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/admin/dashboarddetails"),
        headers: headers);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      Dashboard ac = Dashboard.fromJson(jsonData);
      totalStudentStrength = ac.totalStaffStrength!;
      boysStrength = ac.boysStrength;
      girlsStrength = ac.girlsStrength;
      notifyListeners();
      print(response.body);
    } else {}
    return response.statusCode;
  }

}