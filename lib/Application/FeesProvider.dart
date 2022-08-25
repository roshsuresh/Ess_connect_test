
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Domain/FeesModel.dart';
import '../utils/constants.dart';

Map? mapResponse;
Map? dataResponse;
Map? feeResponse;
Map? busfeeResponse;
List? dataRsponse;

class FeesProvider with ChangeNotifier {

  late String installment;
  late double amount;

  Future feesData() async {
    Map<String, dynamic> data = await parseJWT();
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
        //  print("corect..........");
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse!['onlineFeePaymentStudentDetails'];
        feeResponse = dataResponse!['feeFeesInstallments'];

        FeesModel fee =
        FeesModel.fromJson(mapResponse!['onlineFeePaymentStudentDetails']);
        FeesInstallment feesdata = FeesInstallment.fromJson(
            dataResponse!['feeFeesInstallments']);

        installment = feesdata.installmentName;
        amount = feesdata.netDue;
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