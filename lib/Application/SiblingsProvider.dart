import 'dart:convert';

import 'package:Ess_Conn/Domain/SiblingsTokenModel.dart';
import 'package:Ess_Conn/Presentation/Student/Student_home.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SibingsProvider with ChangeNotifier {
  Future getSibling(String childId) async {
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
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      SiblingTokenModel res = SiblingTokenModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accesstoken', res.accessToken);
      print('accessToken ${res.accessToken}');
      // notifyListeners();
      // await  Provider.of<ProfileProvider>(context).profileData();
      //  Provider.of<LoginProvider>(context, listen: false).getToken(context);
      // var parsedResponse = await parseJWT();

      //await Future.delayed(const Duration(seconds: 3));
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => StudentHome()));
      // } else {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => StudentHome()));
    }
  }
}
