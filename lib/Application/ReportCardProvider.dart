import 'dart:convert';
import 'dart:developer';

import 'package:Ess_Conn/Domain/ReportCardModel.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

List reportResponse = [];

class ReportCardProvider with ChangeNotifier {
  String? name;
  String? extension;

  String? url;
  Future getReportCard() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print('Headres   $headers');
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parents/tabulation/initialvalues"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        reportResponse = data['reportCardList'];
        // print(reportResponse);
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

  Future reportCardAttachment(String fileId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print('Headres   $headers');
    String file = fileId.toString();
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/preview/$file"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        ReportAttachment reattach = ReportAttachment.fromJson(data);
        name = reattach.name;
        url = reattach.url;
        extension = reattach.extension;
        log('.................$url');
        print(data);
        notifyListeners();
      } else {
        print("Error in response");
      }
    } catch (e) {
      print(e);
    }
  }
}
