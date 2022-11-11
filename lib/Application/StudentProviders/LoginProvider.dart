import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domain/Student/activation_model.dart';
import '../../utils/constants.dart';

class LoginProvider with ChangeNotifier {
  bool isLoginned = false;
  String imageUrl = "";
  String schoolName = "";
  String subDomain = "";
  Future<int> getActivation(String key) async {
    String res;

    var headers = {
      'Content-Type': 'application/json',
    };
    var params = {
      "code": key,
    };

    var response = await http.post(
        Uri.parse("${UIGuide.baseURL}/mobileapp/common/get-schooldomain"),
        body: json.encode(params),
        headers: headers);
    if (response.statusCode == 200) {
      print("corect");
      var jsonData = json.decode(response.body);
      print(jsonData);
      ActivationModel ac = ActivationModel.fromJson(jsonData);
      //imageUrl = ac.logoUrl;
      schoolName = ac.schoolName!;
      subDomain = ac.subDomain!;
      print(schoolName);
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString("schoolId", ac.schoolId!);
      notifyListeners();
      //  print(response.body);
    } else {
      print("Error in API calling");
    }
    // print(response.statusCode);
    return response.statusCode;
  }

  Future getToken(BuildContext context) async {
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    String? token = await FirebaseMessaging.instance.getToken();
    print("firebase token");
    print(token);
    var request = http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/mobileapp/token/saveusertoken'));
    request.body = json.encode({
      // "SchoolId": data["SchoolId"],
      "MobileToken": token,
      "StaffId": data.containsKey('StaffId') ? data['StaffId'] : null,
      "GuardianId": data['GuardianId'],
      "StudentId": data['ChildId'],
      "Type": data['role'] == "Guardian" ? "Student" : "Staff"
    });
    print('Responde body  ${request.body}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("student Token added");
      // debugPrint(await response.stream.bytesToString());
    } else {
      log("student not added");
      debugPrint(response.reasonPhrase);
    }
  }
}
