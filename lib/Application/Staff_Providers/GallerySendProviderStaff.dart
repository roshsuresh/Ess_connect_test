import 'dart:convert';
import 'dart:developer';

import 'package:Ess_test/Domain/Staff/GalleryListViewStaff.dart';
import 'package:Ess_test/Domain/Staff/GallerySendStaff.dart';

import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
    notifyListeners();
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
    notifyListeners();
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
    notifyListeners();
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
//find image id

  String? id;
  Future galleryImageSave(BuildContext context, String path) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${UIGuide.baseURL}/files/single/School'));
    request.fields.addAll({'': ''});
    request.files.add(await http.MultipartFile.fromPath('', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      GalleryImageId idd = GalleryImageId.fromJson(data);
      id = idd.id;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Uploaded Successfully")));
      print('...............   $id');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went Wrong")));
      print(response.reasonPhrase);
    }
  }

  //gallery save

  Future gallerySave(
      context,
      String entryDate,
      String DisplayStartDate,
      String DisplayEndDate,
      String Titlee,
      String CourseId,
      String DivisionId,
      String AttachmentId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request =
        http.Request('POST', Uri.parse('${UIGuide.baseURL}/gallery/create'));
    request.body = json.encode({
      "EntryDate": entryDate,
      "DisplayStartDate": DisplayStartDate,
      "DisplayEndDate": DisplayEndDate,
      "Title": Titlee,
      "CourseId": [CourseId],
      "DivisionId": [DivisionId],
      "ForClassTeacherOnly": "false",
      "DisplayTo": "student",
      "StaffRole": "null",
      "PhotoList": [
        {"PhotoCaption": "null", "FileId": AttachmentId, "IsMaster": "true"},
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Correct...______________________________');

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Uploaded Successfully")));
      return AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              headerAnimationLoop: false,
              title: 'Success',
              desc: 'Uploaded Successfully',
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              btnOkColor: Colors.green)
          .show();

      //print(await response.stream.bytesToString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Something went wrong...")));
      print('Error in gallery save respo');
    }
  }

  //gallery view staff
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<GalleryViewList_staff> galleryViewList = [];
  Future<bool> galleryViewListStaff(BuildContext context) async {
    setLoading(true);

    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/mobileapp/staffdet/gallery-list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      log(data.toString());

      List<GalleryViewList_staff> templist = List<GalleryViewList_staff>.from(
          data["galleryView"].map((x) => GalleryViewList_staff.fromJson(x)));
      galleryViewList.addAll(templist);
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
      print('Error in galleryViewList stf');
    }
    return true;
  }

//delete gallery

  Future galleryDeleteStaff(BuildContext context, String eventID) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('DELETE',
        Uri.parse('${UIGuide.baseURL}/gallery/delete-event/$eventID'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 204) {
      print(await response.stream.bytesToString());
      print('correct');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Deleted Successfully")));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
      print('Error in galleryDelete stf');
    }
  }

//Gallery Received

  bool _loadingg = false;
  bool get loadingg => _loading;
  setLoadingg(bool value) {
    _loading = value;
    notifyListeners();
  }

//Gallery Received
  List<GalleryEventListReceived> galleryReceived = [];
  Future getGalleyReceived() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoadingg(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    setLoadingg(true);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/staffdet/getgalleryview"),
        headers: headers);
    //print(response);
    try {
      if (response.statusCode == 200) {
        setLoadingg(true);
        print("corect");
        final data = json.decode(response.body);
        print(data);
        List<GalleryEventListReceived> templist =
            List<GalleryEventListReceived>.from(data["galleryEventList"]
                .map((x) => GalleryEventListReceived.fromJson(x)));
        galleryReceived.addAll(templist);

        setLoadingg(false);
        notifyListeners();
      } else {
        setLoadingg(false);
        print("Error in galleryEventList Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  bool _load = false;
  bool get load => _load;
  setLoad(bool value) {
    _load = value;
    notifyListeners();
  }

  List? galleryAttachResponse;
  Future galleyAttachment(String galleryId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoad(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/systemadmindashboard/gallery-photos/$galleryId"),
        headers: headers);
    setLoad(true);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        galleryAttachResponse = data;

        setLoad(false);
        notifyListeners();
      } else {
        setLoad(false);
        print("error in gallery response");
      }
    } catch (e) {
      setLoad(false);
      print(e);
    }
  }
}
