import 'dart:convert';
import 'dart:developer';

import 'package:Ess_test/Domain/Staff/SearchStudReport.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Screen_Search_Providers with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<SearchStudReport> searchStudent = [];
  Future<bool> getSearch_View(String word) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/viewStudentReport?search=$word'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<SearchStudReport> templist = List<SearchStudReport>.from(
          data["viewStudentReport"].map((x) => SearchStudReport.fromJson(x)));
      searchStudent.addAll(templist);
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print('Error in Search stf');
    }
    return true;
  }

  clearStudentList() {
    searchStudent.clear();
    notifyListeners();
  }
}
