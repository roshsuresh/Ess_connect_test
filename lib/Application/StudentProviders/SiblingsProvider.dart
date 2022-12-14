import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Student/SiblingsNameModel.dart';
import '../../Domain/Student/SiblingsTokenModel.dart';
import '../../Presentation/Student/Student_home.dart';
import '../../utils/constants.dart';

class SibingsProvider with ChangeNotifier {
  bool isLoading = false;
  List<SiblingsNameModel> siblingList = [];
  Future getSiblingName() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/parent-home/get-guardian-children"),
        headers: headers);
    var data = jsonDecode(response.body.toString());
    print('ghj...........$data');

    if (response.statusCode == 200) {
      var jsonrespo = json.decode(response.body);

      List<SiblingsNameModel> templist = List<SiblingsNameModel>.from(
          data.map((x) => SiblingsNameModel.fromJson(x)));
      siblingList.addAll(templist);

      notifyListeners();
    } else {
      print('Error');
      throw ('Error');
    }
  }

  Future getToken(String childId) async {
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    String? token = await FirebaseMessaging.instance.getToken();
    print("firebase token");
    print(token);
    var request = await http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/mobileapp/token/saveusertoken'));
    request.body = json.encode({
      "MobileToken": token,
      "StaffId": data.containsKey('StaffId') ? data['StaffId'] : null,
      "GuardianId": data['GuardianId'],
      "StudentId": childId,
      "Type": data['role'] == "Guardian" ? "Student" : "Staff"
    });
    print('Responde body  ${request.body}');

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log("student Token added");
    } else {
      log("student not added");
      debugPrint(response.reasonPhrase);
    }
  }

  Future getSibling(BuildContext context, String childId) async {
    isLoading = true;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('POST',
        Uri.parse('${UIGuide.baseURL}/user/load-new-token-guardian/$childId'));
    request.headers.addAll(headers);
    print(request);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(await response.stream.bytesToString());
      SiblingTokenModel respo = SiblingTokenModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accesstoken', respo.accessToken);
      print('accessToken ${respo.accessToken}');
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => StudentHome()),
        (Route<dynamic> route) => false,
      );
      isLoading = false;
      notifyListeners();
    }
  }
}
