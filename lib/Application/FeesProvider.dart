import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Domain/FeesModel.dart';
import '../utils/constants.dart';

Map? mapResponses;
Map? dataResponss;
List? feeResponse;
List? busfeeResponse;
//List? listResponses;

class FeesProvider with ChangeNotifier {
  late String installmentTerm;
  late int installamount;

  Future feesData() async {
    late FeeFeesInstallments feeFeesInstallments;
    //Map<String, dynamic> data = await parseJWT();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/feevalues"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        var jsonData = json.decode(response.body);
        //  log(jsonData.toString());
        print("corect..........");
        mapResponses = json.decode(response.body);
        dataResponss = mapResponses!['onlineFeePaymentStudentDetails'];
        feeResponse = dataResponss!['feeFeesInstallments'];
        busfeeResponse = dataResponss!['feeBusInstallments'];
        //  print(dataResponss);
        // print('Bus Response     $busfeeResponse');

        print('fee Response      $feeResponse');
        OnlineFeePayModel fee = OnlineFeePayModel.fromJson(
            mapResponses!['onlineFeePaymentStudentDetails']);
        // FeeFeesInstallments feesdata = FeeFeesInstallments.fromJson(data);
        // installmentTerm = feesdata.installmentName.toString();
        // print(installmentTerm);
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
