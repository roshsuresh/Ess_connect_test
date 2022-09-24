import 'dart:convert';

import 'package:Ess_Conn/Domain/Staff/StaffProfile.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Student/profileModel.dart';

Map? staffProfleRespo;
Map? staffResponse;
Map? staffPhotoResponse;

class StaffProfileProvider with ChangeNotifier {
  String? name;
  String? section;
  String? designation;
  String? mobileNo;
  String? emailid;
  String? dateOfBirth;
  String? userName;
  String? shortname;
  String? gender;
  String? address;
  String? staffRole;
  String? photo;

  Future staff_profileData() async {
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/staff/profile"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body);
        staffProfleRespo = await json.decode(response.body);
        staffResponse = await staffProfleRespo!['staffprofile'];
        Staffprofile stf =
            Staffprofile.fromJson(staffProfleRespo!['staffprofile']);

        photo = stf.photo;

        name = stf.name;
        section = stf.section;
        designation = stf.designation;
        mobileNo = stf.mobileNo;
        emailid = stf.emailid;
        dateOfBirth = stf.dateOfBirth;
        shortname = stf.shortname;
        address = stf.address;
        gender = stf.gender;

        print(name);

        // print(studName);
        // print("corect2..........");
        notifyListeners();

        // print(response.body);
      } else {
        print("Error in Staff Profile Response");
      }
    } catch (e) {
      print(e);
    }
  }
}
