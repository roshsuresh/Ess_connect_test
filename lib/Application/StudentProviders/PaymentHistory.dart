import 'dart:convert';
import 'dart:developer';

import 'package:Ess_test/Domain/Student/PatmentHistory.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PaymentHistoryProvider with ChangeNotifier {
  List<OnlineFeePaymentHistoryDetails> historyList = [];

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future getHistoryList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/paymenthistory"),
        headers: headers);
    try {
      if (response.statusCode == 200) {
        // print("corect");
        final data = json.decode(response.body);
        // historyResponse = data['onlineFeePaymentHistoryDetails'];
        print(data);

        List<OnlineFeePaymentHistoryDetails> templist =
            List<OnlineFeePaymentHistoryDetails>.from(
                data["onlineFeePaymentHistoryDetails"]
                    .map((x) => OnlineFeePaymentHistoryDetails.fromJson(x)));
        historyList.addAll(templist);
        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in historyList Response");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  //attachment
  String? name;
  String? extension;
  String? path;
  String? url;
  Future feeHistoryAttachment(String orderId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/paymenthistory/printfeespayment/$orderId"),
        headers: headers);
    print(response);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        FeeHistoryAttachment reattach = FeeHistoryAttachment.fromJson(data);
        name = reattach.name;
        url = reattach.url;
        extension = reattach.extension;
        //log('.................$url');
        //  print(data);
        notifyListeners();
      } else {
        print("Error in fee history response");
      }
    } catch (e) {
      print(e);
    }
  }
}
