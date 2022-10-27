import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Ess_test/Domain/Student/ReceivedNotification.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationReceivedProviderStudent with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List? notificationstud;
  Future getNotificationReceived() async {
    Map<String, dynamic> parse = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse("${UIGuide.baseURL}/mobileapp/token/receivedlist"));
    request.body = json.encode({
      "SchoolId": _pref.getString('schoolId'),
      "CreatedDate": null,
      "StaffGuardianStudId": parse['ChildId'],
      "Type": "student"
    });
    print(json.encode({
      "SchoolId": _pref.getString('schoolId'),
      "CreatedDate": null,
      "StaffGuardianStudId": parse['ChildId'],
      "Type": "student"
    }));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(await response.stream.bytesToString());

        notificationstud = data;

        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in Notification screen send  Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
