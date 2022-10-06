import 'dart:convert';

import 'package:Ess_test/utils/LoadingIndication.dart';
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
  bool isLoading = false;
  // Future<StudentProfileModel> getProfile() async {
  //   SharedPreferences _pref = await SharedPreferences.getInstance();
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
  //   };
  //   // print(headers);
  //   var response = await http.get(
  //       Uri.parse("${UIGuide.baseURL}/mobileapp/parent/studentprofile"),
  //       headers: headers);
  //   var data = jsonDecode(response.body.toString());

  //   if (response.statusCode == 200) {
  //     print(data);
  //     print(StudentProfileModel.fromJson(data));
  //     return StudentProfileModel.fromJson(data);
  //   } else {
  //     print('Error in profile');
  //     return StudProModel.fromJson(data);
  //   }
  // }

  Future profileData() async {
    isLoading = true;
    LoadingIcon();
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parent/studentprofile"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        var jsonData = await json.decode(response.body);
        //  log(jsonData.toString());
        //  print("corect..........");
        mapResponse = await json.decode(response.body);
        dataResponse = await mapResponse!['studentDetails'];
        // studResponse = await dataResponse!['studentPhoto'];
        // print(studResponse);
        print("corect..........");
        print(dataResponse);
        StudentProfileModel std =
            StudentProfileModel.fromJson(mapResponse!['studentDetails']);
        //   StudentPhoto asa = StudentPhoto.fromJson(dataResponse!['studentPhoto']);
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

        // print(address);

        // print(studName);
        // print("corect2..........");
        isLoading = false;
        notifyListeners();

        // print(response.body);
      } else {
        print("Error in Response");
      }
    } catch (e) {
      print(e);
    }
  }

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
          Uri.parse("${UIGuide.baseURL}/mobileapp/parent/flashnews"),
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

  Future siblingsAPI() async {
    //SiblingsNameModel siblingsNameModel;

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
      throw ("Something went wrong in Response");
    }
  }
}
