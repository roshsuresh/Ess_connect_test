import 'dart:convert';
import 'dart:developer';

import 'package:Ess_test/Domain/Staff/GallerySendStaff.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GallerySendProvider_Stf with ChangeNotifier {
  bool? isClassTeacher;

  String filtersDivision = "";
  String filterCourse = "";

  addFilterCourse(String course) {
    filterCourse = course;
    notifyListeners();
  }

  addFilters(String f) {
    filtersDivision = f;
  }

  clearAllFilters() {
    filtersDivision = "";
    filterCourse = "";

    notifyListeners();
  }

  List<GalleryCourseListStaff> galleryCourse = [];
  addSelectedCourse(GalleryCourseListStaff item) {
    if (galleryCourse.contains(item)) {
      print("removing");
      galleryCourse.remove(item);
      notifyListeners();
    } else {
      print("adding");
      galleryCourse.add(item);
      notifyListeners();
    }
  }

  removeCourse(GalleryCourseListStaff item) {
    galleryCourse.remove(item);
    notifyListeners();
  }

  removeCourseAll() {
    galleryCourse.clear();
  }

  isCourseSelected(
    GalleryCourseListStaff item,
  ) {
    if (galleryCourse.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  courseClear() {
    courselistt.clear();
  }

  List<GalleryCourseListStaff> courselistt = [];
  Future<bool> sendGallery() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/staffdet/noticeBoard/initialValues"),
        headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = await json.decode(response.body);
      Map<String, dynamic> galleryiniti = await data['initialValues'];

      List<GalleryCourseListStaff> templist = List<GalleryCourseListStaff>.from(
          galleryiniti["courseList"]
              .map((x) => GalleryCourseListStaff.fromJson(x)));
      courselistt.addAll(templist);

      //  noticeboardInitialStf = await data['initialValues'];
      // noticeCourseStf = await noticeboardInitialStf!['courseList'];

      // // print(noticeCourseStf);
      // NoticeboardInitialValues sd =
      //     NoticeboardInitialValues.fromJson(data['initialValues']);

      //isClassTeacher = sd.isClassTeacher;

      notifyListeners();
    } else {
      print('Error in gallerycourse stf');
    }
    return true;
  }

  //Division List

  List<GalleryDivisionListStaff> galleryDivision = [];
  addSelectedDivision(GalleryDivisionListStaff item) {
    if (galleryDivision.contains(item)) {
      print("removing");
      galleryDivision.remove(item);
      notifyListeners();
    } else {
      print("adding");
      galleryDivision.add(item);
      notifyListeners();
    }
  }

  removeDivision(GalleryDivisionListStaff item) {
    galleryDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    galleryDivision.clear();
  }

  isDivisionSelected(
    GalleryDivisionListStaff item,
  ) {
    if (galleryDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    divisionlistt.clear();
  }

  List<GalleryDivisionListStaff> divisionlistt = [];

  Future<bool> getDivisionList(String courseId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/noticeboard/divisions/$courseId'));
    request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<GalleryDivisionListStaff> templist =
          List<GalleryDivisionListStaff>.from(data["divisions"]
              .map((x) => GalleryDivisionListStaff.fromJson(x)));
      divisionlistt.addAll(templist);

      notifyListeners();
    } else {
      print('Error in DivisionNotice stf');
    }
    return true;
  }
}
