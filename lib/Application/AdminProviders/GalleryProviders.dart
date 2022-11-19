import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Admin/Course&DivsionList.dart';
import 'package:Ess_test/Domain/Admin/GalleryEdit.dart';
import 'package:Ess_test/Domain/Staff/GallerySendStaff.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Domain/Staff/GalleryListViewStaff.dart';

List? galleryAdm;
Map? editGallery;

class GalleryProviderAdmin with ChangeNotifier {
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
    // request.body = json.encode({"SchoolId": _pref.getString('schoolId')});
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

      log(data.toString());

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
      print('...............   $id');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image Uploaded")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Something went wrong...")));
      print(response.reasonPhrase);
    }
  }

  //gallery save
  final List coursee = [];
  final List divisionn = [];
  Future gallerySave(
      context,
      String entryDate,
      String DisplayStartDate,
      String DisplayEndDate,
      String Titlee,
      coursee,
      divisionn,
      String toggle,
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
      "CourseId": coursee,
      "DivisionId": divisionn,
      "ForClassTeacherOnly": "false",
      "DisplayTo": toggle,
      "StaffRole": "null",
      "PhotoList": [
        {"PhotoCaption": "null", "FileId": AttachmentId, "IsMaster": "true"},
      ]
    });
    print(json.encode({
      "EntryDate": entryDate,
      "DisplayStartDate": DisplayStartDate,
      "DisplayEndDate": DisplayEndDate,
      "Title": Titlee,
      "CourseId": coursee,
      "DivisionId": divisionn,
      "ForClassTeacherOnly": "false",
      "DisplayTo": toggle,
      "StaffRole": "null",
      "PhotoList": [
        {"PhotoCaption": "null", "FileId": AttachmentId, "IsMaster": "true"},
      ]
    }));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Correct...______________________________');
      await AwesomeDialog(
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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Uploaded Successfully")));
      //  print(await response.stream.bytesToString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Something went wrong...")));
      print('Error in gallery save respo');
    }
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<GalleryViewList_staff> galleryViewList = [];
  Future<bool> galleryViewListAdmin() async {
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

      // log(data.toString());

      List<GalleryViewList_staff> templist = List<GalleryViewList_staff>.from(
          data["galleryView"].map((x) => GalleryViewList_staff.fromJson(x)));
      galleryViewList.addAll(templist);
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print('Error in galleryViewList stf');
    }
    return true;
  }

//delete gallery

  Future galleryDelete(String eventID, BuildContext context) async {
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
      print('Error in galleryDelete stf');
    }
  }

  //gallery edit
  String? title;
  String? displayStartDate;
  String? displayEndDate;
  String? entryDate;
  String? url;
  bool _loadd = false;
  bool get loadd => _loading;
  setLoadd(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<PhotoEdit> galleryList = [];
  Future galleryEdit(String eventID) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoad(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/mobileapp/staffdet/gallery-event/$eventID"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        setLoad(true);
        print("corect..........");
        Map<String, dynamic> data = await json.decode(response.body);
        print(data);
        GalleryEditAdmin gall = GalleryEditAdmin.fromJson(data);
        title = gall.title;
        displayStartDate = gall.displayStartDate;
        displayEndDate = gall.displayEndDate;
        entryDate = gall.entryDate;
        print(title);
        print(displayEndDate);
        print("corect..........");
        List<PhotoEdit> templist = List<PhotoEdit>.from(
            data["photo"].map((x) => PhotoEdit.fromJson(x)));
        galleryList.addAll(templist);

        // galleryAdm = data['photo'];
        // editGallery = galleryAdm['f'];
        // File as = File.fromJson(data['photo']);
        // url = as.url;
        //log(url.toString());
        // Map<String, dynamic> gallery =
        setLoad(false);
        notifyListeners();
      } else {
        print("Error in Response");
      }
    } catch (e) {
      print(e);
    }
  }

  clearPhotoList() {
    galleryList.clear();
    notifyListeners();
  }

//gallery Aproove

  Future galleryAproove(BuildContext context, String eventID) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/gallery/approve-event/$eventID'));
    request.headers.addAll(headers);
    print(http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/gallery/approve-event/$eventID')));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print('correct');

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Approved Successfully")));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something went wrong")));
      print('Error in galleryApprove');
    }
  }
//gallery received

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

//attachment
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
