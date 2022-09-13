import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Student/NotificationModel.dart';
import '../../utils/constants.dart';

class NotificationHistoryBloc with ChangeNotifier {
  RecieveNotificationModel? recieveNotificationModel;

  void getNotification() async {
    Map<String, dynamic> data1 = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    print(_pref.getString('token'));
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/mobileapp/token/receivedlist'));
    request.body = json.encode({
      "SchoolId": data1["SchoolId"],
      "AcademicyearId": data1["AcademicYearId"],
      "CreatedDate": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "StaffGuardianStudId": data1['role'] == "Guardian"
          ? data1['PresentDetailId']
          : data1["StaffId"],
      "Type": data1['role'] == "Guardian" ? "Student" : "Staff"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
