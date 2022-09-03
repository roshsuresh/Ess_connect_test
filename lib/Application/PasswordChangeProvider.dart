import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class PasswordChangeprovider with ChangeNotifier {
  Future oldPasswordCheck() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parents/changepassword/checkoldpassword"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        print(data);
        notifyListeners();
      } else {
        print("wrong2");
      }
    } catch (e) {
      print(e);
    }
  }
}
