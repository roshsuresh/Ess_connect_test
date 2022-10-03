import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domain/Student/Flashnews.dart';
import '../../utils/constants.dart';

List? dataRsponse;

class FlashnewsProvider with ChangeNotifier {
  Future flashNewsProvider(context) async {
    // flashNewsModel = await flashNewsData(context);
    late FlashNewsModel flashNewsModel;
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    try {
      final response = await http.get(
          Uri.parse("${UIGuide.baseURL}/mobileapp/staff/flashnews"),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body.toString());
        dataRsponse = data['flashNews'];
        // print(data);
        // print(dataRsponse);
        flashNewsModel = FlashNewsModel.fromJson(data);
        notifyListeners();
      } else {
        print("Something went wrong in flashnews");
      }
    } catch (e) {
      print(e.toString());
    }

    //return flash;
  }
}
