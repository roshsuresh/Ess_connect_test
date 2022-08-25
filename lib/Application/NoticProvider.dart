import 'dart:convert';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


List? noticeresponse;

class NoticeProvider with ChangeNotifier {
  String? title;
  String? matter;
  DateTime? date;
  String noticeId = "";
  Future getnoticeList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/noticeboard-details"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data= json.decode(response.body);
        print(data);
         noticeresponse=data["noticeBoardDetails"];
         notifyListeners();

      } else {
        print("wrong2");
      }
    } catch (e) {
      print(e);
    }

  }
}


