import 'dart:convert';

import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Staff/TimetableModel.dart';

Map? staff_timetableRespo;

class StaffTimetableProvider with ChangeNotifier {
  String? name;
  String? extension;
  String? url;
  Future getTimeTable() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/staff/class-timetable-preview"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);
        staff_timetableRespo = data['timeTable'];
        StaffTimeTable tabl = StaffTimeTable.fromJson(data['timeTable']);
        name = tabl.name;
        extension = tabl.extension;
        url = tabl.url;
        print(name);

        notifyListeners();
      } else {
        print("Error in timetable response");
      }
    } catch (e) {
      print(e);
    }
  }
}
