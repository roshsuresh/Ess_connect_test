import 'dart:convert';

import 'package:Ess_test/Domain/Admin/StudStatitics.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudStatiticsProvider with ChangeNotifier {
  List<StatisticsData> statiticsList = [];
  List<TotalStatitics> totalList = [];
  Future<bool> getstatitics(String section, String course) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/student/studentStatisticsReport/viewStudentStatistics/?section=$section&course=$course&showReport=1'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      // log(data.toString());

      List<StatisticsData> templist = List<StatisticsData>.from(
          data["statisticsData"].map((x) => StatisticsData.fromJson(x)));
      statiticsList.addAll(templist);
      List<TotalStatitics> templistt = List<TotalStatitics>.from(
          data["total"].map((x) => TotalStatitics.fromJson(x)));
      totalList.addAll(templistt);

      notifyListeners();
    } else {
      print('Error in Statitics admin');
    }
    return true;
  }
}
