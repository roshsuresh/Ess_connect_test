import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Student/GalleryModel.dart';
import '../../utils/constants.dart';

List? galleryResponse;
List? galleryAttachResponse;

class GalleryProvider with ChangeNotifier {
  late GalleryphotosModel galleryphotosModel;

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
    setLoading(true);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/gallery"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        setLoading(true);
        final data = json.decode(response.body);
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

  List galleryList = [];
  Future galleyAttachment(String galleryId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoadingg(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    String galleryid = galleryId.toString();

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/parent-home/gallery-photos/$galleryid"),
        headers: headers);
    setLoadingg(true);
    try {
      if (response.statusCode == 200) {
        setLoadingg(true);
        final data = json.decode(response.body);
        print(data);
        galleryList = data;
        print(galleryList);
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
