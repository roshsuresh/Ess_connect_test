import 'dart:convert';
import 'package:Ess_Conn/Domain/Noticeattachmentmodel.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

List? noticeresponse;
Map? attachResponse;

class NoticeProvider with ChangeNotifier {
  String? title;
  String? matter;
  DateTime? date;
  String noticeId = "";
  String? extension;
  String? name;

  String? url;
  Future getnoticeList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/noticeboard-details"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        //  print(data);
        noticeresponse = data["noticeBoardDetails"];
        notifyListeners();
      } else {
        print("Error in Response");
      }
    } catch (e) {
      print(e);
    }
  }

  Future noticeAttachement(String noticeId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    final id = noticeId.toString();
    // print(id);
    // print(headers);
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parent/noticeboard-attachment/$id"),
        headers: headers);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        attachResponse = json.decode(response.body);
        // // log(data.toString());
        AttachmentModel attach = AttachmentModel.fromJson(data);
        extension = attach.extension;
        url = attach.url;
        name = attach.name;
        print("object  $extension");
        notifyListeners();
      } else {
        print('Error in response');
      }
    } catch (e) {
      print(e);
    }
  }
}
