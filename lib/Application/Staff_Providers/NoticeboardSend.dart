import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;

import 'package:Ess_test/Domain/Staff/NoticeboardSendModel.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map? noticeboardInitialStf;
List? noticeCourseStf;
List? noticeCategoryStf;
List? staffNoticeView;
Map? staffNoticeViewAttach;

class StaffNoticeboardSendProviders with ChangeNotifier {
  bool? isClassTeacher;

  Future sendNoticeboard() async {
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
      final data = await json.decode(response.body);
      noticeboardInitialStf = await data['initialValues'];
      noticeCourseStf = await noticeboardInitialStf!['courseList'];
      noticeCategoryStf = await noticeboardInitialStf!['category'];
      // print(noticeCourseStf);
      NoticeboardInitialValues sd =
          NoticeboardInitialValues.fromJson(data['initialValues']);

      isClassTeacher = sd.isClassTeacher;
      // print('fghfhgjhgh.......$isClassTeacher');
      //log(data.toString());

      notifyListeners();
    } else {
      print('Error in Notice stf');
    }
    return true;
  }

  //Division List

  List<NoticeBoardDivision> noticeDivision = [];
  addSelectedDivision(NoticeBoardDivision item) {
    if (noticeDivision.contains(item)) {
      print("removing");
      noticeDivision.remove(item);
      notifyListeners();
    } else {
      print("adding");
      noticeDivision.add(item);
      notifyListeners();
    }
  }

  removeDivision(NoticeBoardDivision item) {
    noticeDivision.remove(item);
    notifyListeners();
  }

  removeDivisionAll() {
    noticeDivision.clear();
  }

  isDivisionSelected(
    NoticeBoardDivision item,
  ) {
    if (noticeDivision.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  divisionClear() {
    divisionlistt.clear();
    notifyListeners();
  }

  List<NoticeBoardDivision> divisionlistt = [];

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

      List<NoticeBoardDivision> templist = List<NoticeBoardDivision>.from(
          data["divisions"].map((x) => NoticeBoardDivision.fromJson(x)));
      divisionlistt.addAll(templist);

      notifyListeners();
    } else {
      print('Error in DivisionNotice stf');
    }
    return true;
  }

  String? id;
  Future noticeImageSave(BuildContext context, String path) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${UIGuide.baseURL}/files/single/School'));
    request.fields.addAll({'': ''});
    request.files.add(await http.MultipartFile.fromPath('', '$path'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      NoticeImageId idd = NoticeImageId.fromJson(data);
      id = idd.id;
      print('...............   $id');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Uploaded Successfully',
          textAlign: TextAlign.center,
        ),
      ));
    } else {
      print(response.reasonPhrase);
    }
  }

  //Noticeboard  save

  Future noticeBoardSave(
      BuildContext context,
      String entryDate,
      String DisplayStartDate,
      String DisplayEndDate,
      String Titlee,
      String Matter,
      String CourseId,
      String DivisionId,
      String CategoryId,
      String AttachmentId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('POST',
        Uri.parse('${UIGuide.baseURL}/mobileapp/staffdet/noticeboard/save'));
    request.body = json.encode({
      "entryDate": entryDate,
      "DisplayStartDate": DisplayStartDate,
      "DisplayEndDate": DisplayEndDate,
      "Title": Titlee,
      "Matter": Matter,
      "DisplayTo": "student",
      "StaffRole": "null",
      "CourseId": [CourseId],
      "DivisionId": [DivisionId],
      "SectionList": null,
      "CategoryId": CategoryId,
      "ForClassTeachersOnly": "false",
      "AttachmentId": AttachmentId
    });
    print(request.body = json.encode({
      "entryDate": entryDate,
      "DisplayStartDate": DisplayStartDate,
      "DisplayEndDate": DisplayEndDate,
      "Title": Titlee,
      "Matter": Matter,
      "DisplayTo": "student",
      "StaffRole": "null",
      "CourseId": [CourseId],
      "DivisionId": [DivisionId],
      "SectionList": null,
      "CategoryId": CategoryId,
      "ForClassTeachersOnly": "false",
      "AttachmentId": AttachmentId
    }));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('Correct........______________________________');
      print(await response.stream.bytesToString());
      await AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              headerAnimationLoop: false,
              title: 'Success',
              desc: 'Successfully send',
              btnOkOnPress: () {
                return;
              },
              btnOkIcon: Icons.cancel,
              btnOkColor: Colors.green)
          .show();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Something Went Wrong....',
          textAlign: TextAlign.center,
        ),
      ));
      print('Error Response notice send stf');
    }
  }

  //Noticeboard idd ......Received

  List<NoticeBoardReceivedstaff> noticeBoard = [];

  Future getnoticeList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/staffdet/noticeBoard/view"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        staffNoticeView = data["noticeBoardView"];
        notifyListeners();
      } else {
        print("Error in Response");
      }
    } catch (e) {
      print(e);
    }
  }

  //noticeBoard Attachment View

  String? name;
  String? extension;
  String? url;
  String? createdAt;

  Future staffNoticeBoardAttach(String id) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/staffdet/noticeboard-attachment/$id"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print("corect");
        final data = json.decode(response.body);
        staffNoticeViewAttach = data['noticeBoardAttatchment'];

        NoticeBoardAttatchmentStaffReceived notice =
            NoticeBoardAttatchmentStaffReceived.fromJson(
                data['noticeBoardAttatchment']);

        name = notice.name;
        extension = notice.extension;
        url = notice.url;
        createdAt = notice.createdAt;
        print(name);

        notifyListeners();
      } else {
        print("Error in staffNoticeAttach response");
      }
    } catch (e) {
      print(e);
    }
  }
}
