import 'dart:convert';

import 'package:Ess_Conn/Domain/activation_model.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Domain/profileModel.dart';

class ProfileProvider with ChangeNotifier {
  String? studentName;
  String? admissionNo;
  String? rollNo;
  dynamic studentDetailsClass;
  String? division;
  dynamic bloodGroup;
  dynamic houseGroup;
  Future<void> ProfileData() async {
    print('Response.........');
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    print(headers);
    var request = await http.Request(
      'GET',
      Uri.parse("${UIGuide.baseURL}/mobileapp/parent/studentprofile"),
    );
    request.body = json.encode({"studentName": data["studentName"]});
    print("${request.body}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonData = json.decode(request.body);
      StudentProfileModel prof = StudentProfileModel.fromJson(jsonData);
      studentName = prof.studentName;
      print(studentName);
      print("Response$response");
    }
  }
}
