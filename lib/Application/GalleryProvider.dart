import 'dart:convert';

import 'package:Ess_Conn/Domain/GalleryModel.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

List? galleryResponse;

class GalleryProvider with ChangeNotifier {
  Future getGalleyList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    print('Headres   $headers');
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/gallery"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        //print(data);
        // galleryResponse = item["gallerydetails"];
        //result = GalleryModel.fromJson(item);
        // print(result);
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
