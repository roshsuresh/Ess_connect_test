import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Admin/StaffListModel.dart';
import 'package:Ess_test/Domain/Staff/NotifcationSendModel.dart';
import 'package:Ess_test/Presentation/Admin/Communication/ToStaff.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

class NotificationToStaffAdminProviders with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //view
  List<StaffReportNotification> stafflist = [];
  Future<bool> getNotificationView(String section) async {
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    notifyListeners();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${UIGuide.baseURL}/mobileapp/admin/viewStaffReport?section=$section'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      // log(data.toString());

      List<StaffReportNotification> templist =
          List<StaffReportNotification>.from(data["staffReport"]
              .map((x) => StaffReportNotification.fromJson(x)));
      stafflist.addAll(templist);

      print('correct');
      setLoading(false);
      notifyListeners();
    } else {
      print('Error in notificationView Admin to staff');
    }
    return true;
  }

  clearStaffList() {
    stafflist.clear();
    notifyListeners();
  }

  bool isSelected(StaffReportNotification model) {
    StaffReportNotification selected =
        stafflist.firstWhere((element) => element.id == model.id);
    return selected.selected ??= false;
  }

  List<StaffReportNotification> selectedList = [];
  void selectItem(StaffReportNotification model) {
    StaffReportNotification selected =
        stafflist.firstWhere((element) => element.id == model.id);

    if (selected.selected == null) {
      selected.selected = true;
    } else {
      selected.selected = !selected.selected!;
    }
    StaffReportNotification? selectedListItem =
        selectedList.firstWhereOrNull((element) => element.id == model.id);

    if (selectedListItem == null) {
      selectedList.add(model);
      print("adding to selected list");
    }

    notifyListeners();
  }

  bool isSelectAllStaff = false;
  void selectAllStaff() {
    if (stafflist.first.selected == true) {
      stafflist.forEach((element) {
        element.selected = false;
      });
      isSelectAllStaff = false;
    } else {
      stafflist.forEach((element) {
        element.selected = true;
      });
      isSelectAllStaff = true;
    }

    notifyListeners();
  }
//send notification

  sendNotification(
      BuildContext context, String body, String content, List<String> to,
      {required String sentTo}) async {
    Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    print(_pref.getString('token'));
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request('POST',
        Uri.parse('${UIGuide.baseURL}/mobileapp/token/saveusernotification'));
    print(Uri.parse('${UIGuide.baseURL}/mobileapp/token/saveusernotification'));
    request.body = json.encode({
      // "SchoolId": data["SchoolId"],
      "Title": body,
      "Body": content,
      "FromStaffId":
          data['role'] == "Guardian" ? data['StudentId'] : data["StaffId"],
      "SentTo": sentTo,
      "ToId": to,
      "IsSeen": false
    });
    print({
      // "SchoolId": data["SchoolId"],
      "Title": body,
      "Body": content,
      "FromStaffId":
          data['role'] == "Guardian" ? data['StudentId'] : data["StaffId"],
      "SentTo": sentTo,
      "ToId": to,
      "IsSeen": false
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Notification sent successfully',
          textAlign: TextAlign.center,
        ),
      ));
      debugPrint(await response.stream.bytesToString());
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
      debugPrint(response.reasonPhrase);
    }
  }

  List<StaffReportNotification> selectedStaffList = [];
  submitStaff(BuildContext context) {
    selectedStaffList.clear();
    selectedStaffList =
        stafflist.where((element) => element.selected == true).toList();
    if (selectedStaffList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Please Select....',
          textAlign: TextAlign.center,
        ),
      ));
    } else {
      print('v ${selectedStaffList.map((e) => e.id).toList().length}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => Text_Matter_NotificationAdminToStaff(
                    toList: selectedStaffList.map((e) => e.id).toList(),
                    type: "Staff",
                  )));
    }
  }

  List<AdminStaffNotificationHistory> historyList = [];
  Future getNotificationHistory() async {
    Map<String, dynamic> parse = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse("${UIGuide.baseURL}/mobileapp/token/sentlist"));
    request.body = json.encode({
      // "SchoolId": _pref.getString('schoolId'),
      "CreatedDate": null,
      "StaffGuardianStudId": parse['StaffId'],
      "Type": "Staff"
    });
    print(json.encode({
      // "SchoolId": _pref.getString('schoolId'),
      "CreatedDate": null,
      "StaffGuardianStudId": parse['StaffId'],
      "Type": "Staff"
    }));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        print("corect");

        Map<String, dynamic> data =
            jsonDecode(await response.stream.bytesToString());

        //    log(data.toString());

        List<AdminStaffNotificationHistory> templist =
            List<AdminStaffNotificationHistory>.from(data["results"]
                .map((x) => AdminStaffNotificationHistory.fromJson(x)));
        historyList.addAll(templist);
        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in Notification screen send Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
