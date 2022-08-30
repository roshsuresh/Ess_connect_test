import 'dart:convert';

import 'package:Ess_Conn/Domain/GalleryModel.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

List? galleryResponse;
List? galleryAttachResponse;

class GalleryProvider with ChangeNotifier {
  //late GalleryphotosModel photosModel;
  late GalleryphotosModel galleryphotosModel;
  // GalleryModel gallery;
  bool isLoading = false;
  Future<GalleryModel?> getGalleyList() async {
    GalleryModel gallery;
    isLoading = true;

    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print('Headres   $headers');
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/gallery"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        // print(data);
        galleryResponse = data["gallerydetails"];
        // gallery = GalleryModel.fromJson(data["gallerydetails"]);
        // gallery = GalleryModel.fromJson(data);
        // print(galleryResponse);
        //  print(galleryResponse);

        notifyListeners();
        isLoading = false;
      } else {
        print("wrong2");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<GalleryphotosModel> galleyAttachment(String galleryId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    String galleryid = galleryId.toString();
    // print('Headres   $headers');
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parents/gallery-photos/${galleryid}"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        print(data);
        galleryAttachResponse = data["galleryphotos"];
        galleryphotosModel = GalleryphotosModel.fromJson(data);

        print(galleryAttachResponse);

        notifyListeners();
      } else {
        print("wrong2");
      }
    } catch (e) {
      print(e);
    }
    return galleryphotosModel;
  }
}
