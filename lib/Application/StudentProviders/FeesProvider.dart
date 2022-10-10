import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Student/FeesModel.dart';
import '../../utils/constants.dart';

Map? mapResponses;
Map? dataResponss;
List? feeResponse;
List? busfeeResponse;
List<FeeFeesInstallments> feesList = [];
//List? listResponses;

class FeesProvider with ChangeNotifier {
  bool isLoading = false;
  late String installmentTerm;
  late int installamount;
  bool? allowPartialPayment;

  List<FeeFeesInstallments> feeList = [];
  List<FeeBusInstallments> busFeeList = [];
  Future<bool> feesData() async {
    // isLoading = true;
    // notifyListeners();

    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/mobileapp/parents/feevalues"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        print("Fee Response..........");

        Map<String, dynamic> data = json.decode(response.body);
        Map<String, dynamic> feeinitial =
            data['onlineFeePaymentStudentDetails'];
        // feeResponse = dataResponss!['feeFeesInstallments'];
        // busfeeResponse = dataResponss!['feeBusInstallments'];

        List<FeeFeesInstallments> templist = List<FeeFeesInstallments>.from(
            feeinitial['feeFeesInstallments']
                .map((x) => FeeFeesInstallments.fromJson(x)));
        feeList.addAll(templist);

        List<FeeBusInstallments> templistt = List<FeeBusInstallments>.from(
            feeinitial['feeBusInstallments']
                .map((x) => FeeBusInstallments.fromJson(x)));
        busFeeList.addAll(templistt);
        // print(dataResponss);
        // print('Bus Response     $busfeeResponse');

        // print('fee Response      $feeResponse');
        // OnlineFeePayModel fee = OnlineFeePayModel.fromJson(
        //     mapResponses!['onlineFeePaymentStudentDetails']);
        // allowPartialPayment = fee.allowPartialPayment;
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
        // isLoading = false;
        notifyListeners();
      } else {
        print("Error in fee response");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  //select all fees
  bool isselectAll = false;
  void selectAll() {
    if (feesList.first.checkedFees == true) {
      feesList.forEach((element) {
        element.checkedFees = false;
      });
      isselectAll = false;
    } else {
      feesList.forEach((element) {
        element.checkedFees = true;
      });
      isselectAll = true;
    }

    notifyListeners();
  }

//fee
  double totalFees = 0;
  double? total = 0;
  double totalBusFee = 0;
  List selecteCategorys = [];
  void onFeeSelected(bool selected, feeName, int index, feeNetDue) {
    if (selected == true) {
      selecteCategorys.add(feeName);
      print(index);
      final double tot = feeNetDue;
      print(feeName);
      print(tot);
      totalFees = tot + totalFees;
      print(totalFees);
      total = totalFees + totalBusFee;
      print(total);
      notifyListeners();
    } else {
      if (selecteCategorys.remove(feeName)) {
        final double tot = feeNetDue;
        totalFees = totalFees - tot;
        total = totalFees + totalBusFee;
        print(total);
      }
      notifyListeners();
    }
  }

  //bus fee

  List selectedBusFee = [];

  void onBusSelected(bool selected, busfeeName, int index, feeNetDue) {
    if (selected == true) {
      selectedBusFee.add(busfeeName);
      print(index);
      final double tot = feeNetDue;
      print(busfeeName);
      print(tot);
      totalBusFee = tot + totalBusFee;
      print(totalBusFee);
      total = totalFees + totalBusFee;
      print(total);
      notifyListeners();
    } else {
      if (selectedBusFee.remove(busfeeName)) {
        final double tot = feeNetDue;
        totalBusFee = totalBusFee - tot;
        total = totalFees + totalBusFee;
        print(total);
      }
      notifyListeners();
    }
  }

  //total

  void totalFee() async {
    total = totalFees + totalBusFee;
    print(total);
    notifyListeners();
  }
}
