import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Domain/Student/TimeTableModel.dart';
import '../../utils/constants.dart';

Map? timetableRespo;

class Timetableprovider with ChangeNotifier {
  String? url;
  String? createdAt;
  String? extension;
  String? name;

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future getTimeTable(String divId) async {
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    setLoading(true);
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parent/class-timetable-download/$divId"),
        headers: headers);
    setLoading(true);
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
