import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Admin/Course&DivsionList.dart';
import '../../Domain/Staff/NoticeboardSendModel.dart';

Map? noticeboardInitialaAdmin;

List? noticeCategoryAdmin;

class NoticeBoardAdminProvider with ChangeNotifier {
  //category

  Future noticeboardCategory() async {
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
      noticeboardInitialaAdmin = await data['initialValues'];

      noticeCategoryAdmin = await noticeboardInitialaAdmin!['category'];

      NoticeboardInitialValues sd =
          NoticeboardInitialValues.fromJson(data['initialValues']);

      notifyListeners();
    } else {
      print('Error in Notice stf');
    }
    return true;
  }

//Course
  List<CourseListModel> courseList = [];
  List<MultiSelectItem> courseDropDown = [];
  Future getCourseList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/mobileapp/common/courselist'));
    //  request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<CourseListModel> templist = List<CourseListModel>.from(
          data["courseList"].map((x) => CourseListModel.fromJson(x)));
      courseList.addAll(templist);

      courseDropDown = courseList.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.name!);
      }).toList();

      notifyListeners();
    } else {
      print("Error in Course response");
    }
  }

  int courseLen = 0;
  courseCounter(int len) async {
    courseLen = 0;
    if (len == 0) {
      courseLen = 0;
    } else {
      courseLen = len;
    }

    notifyListeners();
  }

  int divisionLen = 0;
  divisionCounter(int leng) async {
    divisionLen = 0;
    if (leng == 0) {
      divisionLen = 0;
    } else {
      divisionLen = leng;
    }

    notifyListeners();
  }

  //Division

  List<DivisionListModel> divisionList = [];
  List<MultiSelectItem> divisionDropDown = [];
  Future<bool> getDivisionList(String courseId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/staffdet/studentreport/divisions/$courseId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('object');
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());
      List<DivisionListModel> templist = List<DivisionListModel>.from(
          data["divisionbyCourse"].map((x) => DivisionListModel.fromJson(x)));
      divisionList.addAll(templist);
      divisionDropDown = divisionList.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.text!);
      }).toList();
      notifyListeners();
    } else {
      print('Error in DivisionList stf');
    }
    return true;
  }

  divisionClear() {
    divisionList.clear();
    notifyListeners();
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
      print('...............   $id');
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
      print(response.reasonPhrase);
    }
  }

  // save NoticeBoard

  final List course = [];
  final List division = [];
  Future noticeBoardSave(
      BuildContext context,
      String entryDate,
      String DisplayStartDate,
      String DisplayEndDate,
      String Titlee,
      String Matter,
      String toggle,
      course,
      division,
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
      "DisplayTo": toggle,
      "StaffRole": "null",
      "CourseId": course,
      "DivisionId": division,
      "SectionList": "null",
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
      "DisplayTo": toggle,
      "StaffRole": "null",
      "CourseId": course,
      "DivisionId": division,
      "SectionList": "null",
      "CategoryId": CategoryId,
      "ForClassTeachersOnly": "false",
      "AttachmentId": AttachmentId
    }));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('Correct______..........______');

      AwesomeDialog(
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
      print('Error Response notice send admin');
    }
  }
}
