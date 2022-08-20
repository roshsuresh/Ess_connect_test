import 'dart:convert';

import 'package:Ess_Conn/Domain/activation_model.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Domain/profileModel.dart';

Map? mapResponse;
Map? dataResponse;

class ProfileProvider with ChangeNotifier {
  String? studName;
  String? admissionNo;
  String? division;

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
  Future profileData() async {
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
        var jsonData = json.decode(response.body);
        // print(jsonData);
        //  print("corect..........");
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse!['studentDetails'];
        // print(dataResponse);
        StudentProfileModel std =
            StudentProfileModel.fromJson(mapResponse!['studentDetails']);
        studName = std.studentName;
        admissionNo = std.admissionNo;
        division = std.division;
        rollNo = std.rollNo;
        dob = std.dob;
        gender = std.gender;
        height = std.height;
        weight = std.weight;
        address = std.address;
        fatherName = std.fatherName;
        fatherMail = std.fatherMail;
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
        notifyListeners();

        // print(response.body);
      } else {
        print("wrong");
      }
    } catch (e) {
      print(e);
    }
  }
}


   // StudentProfileModel pro = StudentProfileModel.fromJson(jsonData);
      // studentName = pro.studentName!;
      // print(studentName);
      // print("corect2..........");
      // subDomain = ac.subDomain!;
      // SharedPreferences _pref = await SharedPreferences.getInstance();
      // _pref.setString("schoolId", ac.schoolId!);

// print(response.statusCode);
    // return response.statusCode;

//
    //
    // print('Response.........');
    // Map<String, dynamic> data = await parseJWT();
    // SharedPreferences _pref = await SharedPreferences.getInstance();
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    // };
    // print(headers);
    // var request = await http.Request(
    //   'GET',
    //   Uri.parse("${UIGuide.baseURL}/mobileapp/parent/studentprofile"),
    // );
    // request.body = json.encode({"studentName": data["studentName"]});
    // print("${request.body}");
    // request.headers.addAll(headers);
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   print("Response............");
    //   //var dh = StudentProfileModel.fromJson(jsonDecode(request.body));
    //   // print(dh);
    //   var jsonData = json.decode(request.body);
    //   StudentProfileModel prof = StudentProfileModel.fromJson(jsonData);
    //   studentName = prof.studentName;
    //   print(studentName);
    //   print("Response$response");
    // }