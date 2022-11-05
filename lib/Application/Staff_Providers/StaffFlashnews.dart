import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domain/Student/Flashnews.dart';
import '../../utils/constants.dart';

List? dataRsponse;

class FlashnewsProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<FlashNewsModelStud> flashnew = [];
  Future flashNewsProvider() async {
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    setLoading(true);
    try {
      final response = await http.get(
          Uri.parse("${UIGuide.baseURL}/mobileapp/staff/flashnews"),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body.toString());
        List<FlashNewsModelStud> templist = List<FlashNewsModelStud>.from(
            data["flashNews"].map((x) => FlashNewsModelStud.fromJson(x)));
        flashnew.addAll(templist);
        setLoading(false);
        print("flashnews");
        notifyListeners();
      } else {
        setLoading(false);
        print("Something went wrong in flashnews");
      }
    } catch (e) {
      print(e.toString());
    }

    //return flash;
  }
}
