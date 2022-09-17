import 'dart:convert';
import 'package:Ess_Conn/utils/LoadingIndication.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Student/FeesModel.dart';
import '../../utils/constants.dart';

Map? mapResponses;
Map? dataResponss;
List? feeResponse;
List? busfeeResponse;
//List? listResponses;

class FeesProvider with ChangeNotifier {
  bool isLoading = false;
  late String installmentTerm;
  late int installamount;
  bool? allowPartialPayment;
  // List<FeeFeesInstallments> feeList = [];
  Future feesData() async {
    isLoading = true;
    notifyListeners();

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
        print("Fee Response..........");

        mapResponses = json.decode(response.body);
        dataResponss = mapResponses!['onlineFeePaymentStudentDetails'];
        feeResponse = dataResponss!['feeFeesInstallments'];
        busfeeResponse = dataResponss!['feeBusInstallments'];
        // print(dataResponss);
        // print('Bus Response     $busfeeResponse');

        // print('fee Response      $feeResponse');
        OnlineFeePayModel fee = OnlineFeePayModel.fromJson(
            mapResponses!['onlineFeePaymentStudentDetails']);
        allowPartialPayment = fee.allowPartialPayment;
        //  print(allowPartialPayment);

        // FeeFeesInstallments feesdata =
        //     FeeFeesInstallments.fromJson(dataResponss!['feeFeesInstallments']);
        // installmentTerm = feesdata.installmentName.toString();
        // Map<String, dynamic> data =
        //     jsonDecode(await response.bodyBytes.toString());
        // //print(await response.stream.bytesToString());
        // print(data);
        // List<FeeFeesInstallments> templist = List<FeeFeesInstallments>.from(
        //     data["feeFeesInstallments"]
        //         .map((x) => FeeFeesInstallments.fromJson(x)));
        // feeList.addAll(templist);

        // print(installmentTerm);
        isLoading = false;
        notifyListeners();

        // print(response.body);
      } else {
        print("Error in fee response");
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<OnlineFeePayModel> getFee() async {
  //   SharedPreferences _pref = await SharedPreferences.getInstance();
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
  //   };
  //   // print(headers);
  //   var response = await http.get(
  //       Uri.parse("${UIGuide.baseURL}/mobileapp/parents/feevalues"),
  //       headers: headers);
  //   var data = jsonDecode(response.body.toString());
  //   print('ghj...........$data');

  //   if (response.statusCode == 200) {
  //     return OnlineFeePayModel.fromJson(data);
  //     // var jsonrespo = json.decode(response.body);
  //     // List<FeeFeesInstallments> fees = [];
  //     // for (var u in jsonrespo) {
  //     //   // FeeFeesInstallments fee = FeeFeesInstallments(
  //     //   //     feesDetailsId: u['feesDetailsId'],
  //     //   //     installmentName: u['installmentName'],
  //     //   //     installmentNetDue: u['installmentNetDue']);

  //     //   fees.add(fee);

  //   } else {
  //     print('Error');
  //     return OnlineFeePayModel.fromJson(data);
  //   }
  // }
}
