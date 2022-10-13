import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Student/GalleryModel.dart';
import '../../utils/constants.dart';

List? galleryResponse;
List? galleryAttachResponse;

class GalleryProvider with ChangeNotifier {
  //late GalleryphotosModel photosModel;
  late GalleryphotosModel galleryphotosModel;
  // GalleryModel gallery;
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<GalleryModel?> getGalleyList() async {
    GalleryModel gallery;

    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print('Headres   $headers');
    setLoading(true);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/gallery"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        setLoading(true);
        // print("corect");
        final data = json.decode(response.body);
        // print(data);
        galleryResponse = data["gallerydetails"];
        gallery = GalleryModel.fromJson(data);
        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  bool _loadingg = false;
  bool get loadingg => _loadingg;
  setLoadingg(bool value) {
    _loadingg = value;
    notifyListeners();
  }

  Future galleyAttachment(String galleryId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoadingg(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    String galleryid = galleryId.toString();
    // print('Headres   $headers');
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/parents/gallery-photos/$galleryid"),
        headers: headers);
    setLoadingg(true);
    try {
      if (response.statusCode == 200) {
        setLoadingg(true);
        // print("corect");
        final data = json.decode(response.body);
        print(data);
        galleryAttachResponse = data["galleryphotos"];
        // galleryphotosModel = GalleryphotosModel.fromJson(data);
        // print(galleryAttachResponse);
        // print(galleryphotosModel);
        setLoadingg(false);
        notifyListeners();
      } else {
        setLoadingg(false);
        print("error in gallery response");
      }
    } catch (e) {
      setLoadingg(false);
      print(e);
    }
  }
}
