import 'dart:convert';

import 'package:Ess_Conn/Domain/TimeTableModel.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Map? timetableRespo;

class Timetableprovider with ChangeNotifier {
  String? url;
  String? createdAt;
  String? extension;
  String? name;
  Future getTimeTable(String divId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parent/class-timetable-download/$divId"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);
        timetableRespo = data['timeTablepreview'];
        TimeTablepreviewModel prev =
            TimeTablepreviewModel.fromJson(data['timeTablepreview']);
        url = prev.url;
        createdAt = prev.createdAt;
        name = prev.name;
        extension = prev.extension;
        print(name);

        notifyListeners();
      } else {
        print("Error in response");
      }
    } catch (e) {
      print(e);
    }
    //throw ('Response');
    // return result2;
  }
}
