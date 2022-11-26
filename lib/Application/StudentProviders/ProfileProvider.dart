import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domain/Student/Flashnews.dart';
import '../../Domain/Student/profileModel.dart';
import '../../utils/constants.dart';

Map? mapResponse;
Map? dataResponse;
Map? studResponse;
List? dataRsponse;
Map? siblingResponse;
List? siblinggResponse;

class ProfileProvider with ChangeNotifier {
  String? studName;
  String? admissionNo;
  String? division;
  String? divisionId;
  String? rollNo;
  dynamic studentDetailsClass;
  dynamic bloodGroup;
  dynamic houseGroup;
  String? classTeacher;
  dynamic dob;
  dynamic studentPhoto;
  dynamic studentPhotoId;
  String? gender;
  String? height;
  String? weight;
  String? address;
  String? fatherName;
  dynamic fatherMail;
  String? fatherMobileno;
  String? motherName;
  dynamic motherMailId;
  String? motherMobileno;
  String? studPhoto;
  String? fatherPhoto;
  String? motherPhoto;

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future profileData() async {
    Map<String, dynamic> data = await parseJWT();
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    setLoading(true);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/studentprofile"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        setLoading(true);

        var jsonData = await json.decode(response.body);

        mapResponse = await json.decode(response.body);
        dataResponse = await mapResponse!['studentDetails'];

        print("corect..........");
        //  print(dataResponse);
        setLoading(true);
        StudentProfileModel std =
            StudentProfileModel.fromJson(mapResponse!['studentDetails']);
        studPhoto = std.studentPhoto;

        // log(studPhoto.toString());
        studName = std.studentName;
        print(studName);
        admissionNo = std.admissionNo;
        division = std.divisionName;
        divisionId = std.divisionId;
        rollNo = std.rollNo;
        dob = std.dob;
        gender = std.gender;
        height = std.height;
        weight = std.weight;
        address = std.address;
        fatherName = std.fatherName;
        fatherPhoto = std.fatherPhoto;
        motherPhoto = std.motherPhoto;
        fatherMail = std.fatherMailId;
        fatherMobileno = std.fatherMobileno;
        motherName = std.motherName;
        motherMailId = std.motherMailId;
        motherMobileno = std.motherMobileno;
        address = std.address;

        bloodGroup = std.bloodGroup;
        houseGroup = std.houseGroup;
        classTeacher = std.classTeacher;
        setLoading(false);
        notifyListeners();
      } else {
        print("Error in profile Response");
      }
    } catch (e) {
      print(e);
    }
  }

  List<FlashNewsModelStud> flashnew = [];
  Future flashNewsProvider(context) async {
    late FlashNewsModel flashNewsModel;
    Map<String, dynamic> data = await parseJWT();
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    setLoading(true);

    try {
      final response = await http.get(
          Uri.parse("${UIGuide.baseURL}/mobileapp/parent/flashnews"),
          headers: headers);

      if (response.statusCode == 200) {
        setLoading(true);
        final data = json.decode(response.body.toString());
        dataRsponse = data['flashNews'];
        List<FlashNewsModelStud> templist = List<FlashNewsModelStud>.from(
            data["flashNews"].map((x) => FlashNewsModelStud.fromJson(x)));
        flashnew.addAll(templist);
        flashNewsModel = FlashNewsModel.fromJson(data);
        setLoading(false);
        notifyListeners();
      } else {
        print("Something went wrong in flashnews");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future siblingsAPI() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    final response = await http.get(
        Uri.parse("${UIGuide.baseURL}/parent-home/get-guardian-children"),
        headers: headers);

    if (response.statusCode == 200) {
      siblinggResponse = json.decode(response.body);
      print(siblinggResponse);
      notifyListeners();
    } else {
      throw ("Something went wrong in siblings Response");
    }
  }
}
