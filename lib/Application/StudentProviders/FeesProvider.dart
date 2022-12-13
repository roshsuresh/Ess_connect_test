import 'dart:convert';
import 'dart:developer';
import 'package:Ess_test/Domain/Student/RazorPayModel.dart';
import 'package:Ess_test/Domain/Student/TransactionModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Domain/Student/FeesModel.dart';
import '../../utils/constants.dart';

List<FeeFeesInstallments> feesList = [];

class FeesProvider with ChangeNotifier {
  late String installmentTerm;
  late int installamount;
  bool? allowPartialPayment;

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<FeeFeesInstallments> feeList = [];
  List<FeeBusInstallments> busFeeList = [];
  List<Transactiontype> transactionList = [];

  String? lastOrderStatus;
  String? lastTransactionStartDate;
  double? lastTransactionAmount;
  String? paymentGatewayId;
  String? readableOrderId;
  int? orderId;

  Future<Object> feesData() async {
    setLoading(true);
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    setLoading(true);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/onlinepayment/initialvalues"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        setLoading(true);
        print("Fee Response..........");

        Map<String, dynamic> data = json.decode(response.body);
        Map<String, dynamic> feeinitial =
            data['onlineFeePaymentStudentDetails'];
        Map<String, dynamic> feedata = feeinitial['feeOrder'];
        FeeOrder fee = FeeOrder.fromJson(feedata);
        lastOrderStatus = fee.lastOrderStatus;
        lastTransactionStartDate = fee.lastTransactionStartDate;
        lastTransactionAmount = fee.lastTransactionAmount;
        readableOrderId = fee.readableOrderId;
        paymentGatewayId = fee.paymentGatewayId;
        orderId = fee.lastOrderId;
        setLoading(true);
        List<FeeFeesInstallments> templist = List<FeeFeesInstallments>.from(
            feeinitial['feeFeesInstallments']
                .map((x) => FeeFeesInstallments.fromJson(x)));
        feeList.addAll(templist);
        setLoading(true);
        List<FeeBusInstallments> templistt = List<FeeBusInstallments>.from(
            feeinitial['feeBusInstallments']
                .map((x) => FeeBusInstallments.fromJson(x)));
        busFeeList.addAll(templistt);
        List<Transactiontype> templis = List<Transactiontype>.from(
            feeinitial['transactiontype']
                .map((x) => Transactiontype.fromJson(x)));
        transactionList.addAll(templis);
        print(transactionList.length);

        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
        print("Error in fee response");
      }
    } catch (e) {
      setLoading(false);
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
      print("selecteCategorys   $selecteCategorys");
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

  // pdf download

  String? extension;
  String? name;
  String? url;

  Future pdfDownload(String orderID) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/paymenthistory/printfeespayment/$orderID"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        FilePathPdfDownload att = FilePathPdfDownload.fromJson(data);
        extension = att.extension;
        name = att.name;
        url = att.url;
        print(url);

        notifyListeners();
      } else {
        setLoading(false);
        print("Error in   pdf download  response");
      }
    } catch (e) {
      print(e);
    }
  }

  //status Payment

  String? statusss;

  Future payStatusButton(String orderId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/onlinepayment/get-order-details/$orderId"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        StatusPayment att = StatusPayment.fromJson(data);
        log(data.toString());

        statusss = att.status;
        print(statusss);

        notifyListeners();
      } else {
        setLoading(false);
        print("Error in  status  response");
      }
    } catch (e) {
      print(e);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////    get data  1 index  PAYTM    ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

  String? mid1;
  String? txnorderId1;
  String? callbackUrl1;
  String? txnAmount1;
  String? customerID1;
  String? mobile1;
  String? emailID1;
  bool? isStaging1;
  String? txnToken1;

  Future getDataOne(String fees, String idFee, String feeAmount, String amount,
      String gateName) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);

    final http.Response response = await http.post(
      Uri.parse(
          '${UIGuide.baseURL}/online-payment/paytm/get-data?ismobileapp=true'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
      },
      body: jsonEncode({
        "Description": "Online Fees Payment",
        "TransactionType": [
          {"name": fees, "id": idFee, "amount": feeAmount}
        ],
        "ReturnUrl": "",
        "Amount": amount,
        "PaymentGateWay": gateName
      }),
    );

    print(json.encode({
      "Description": "Online Fees Payment",
      "TransactionType": [
        {"name": fees, "id": idFee, "amount": feeAmount}
      ],
      "ReturnUrl": "",
      "Amount": amount,
      "PaymentGateWay": gateName
    }));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await json.decode(response.body);

        print(data);
        TransactionModel txn = TransactionModel.fromJson(data);
        mid1 = txn.mid;
        txnorderId1 = txn.orderId;
        callbackUrl1 = txn.callbackUrl;
        isStaging1 = txn.isStaging;
        txnToken1 = txn.txnToken;
        print(mid1);

        Map<String, dynamic> txnAmnt = data['txnAmount'];
        TxnAmount amnt = TxnAmount.fromJson(txnAmnt);
        txnAmount1 = amnt.value;

        Map<String, dynamic> userInf = data['userInfo'];
        UserInfo user = UserInfo.fromJson(userInf);
        customerID1 = user.custId;
        emailID1 = user.email;
        mobile1 = user.mobile;

        notifyListeners();
      } else {
        setLoading(false);
        print("Error in  transaction index one  response");
      }
    } catch (e) {
      print(e);
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
//////////////////////////    get data  2 index PAYTM   //////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

  String? mid2;
  String? txnorderId2;
  String? callbackUrl2;
  String? txnAmount2;
  String? customerID2;
  String? mobile2;
  String? emailID2;
  bool? isStaging2;
  String? txnToken2;

  Future getDataTwo(String fees, String idFee, String feeAmount, String buss,
      String idBus, String busAmount, String amount, String gateName) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);

    final http.Response response = await http.post(
      Uri.parse(
          '${UIGuide.baseURL}/online-payment/paytm/get-data?ismobileapp=true'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
      },
      body: jsonEncode({
        "Description": "Online Fees Payment",
        "TransactionType": [
          {"name": fees, "id": idFee, "amount": feeAmount},
          {"name": buss, "id": idBus, "amount": busAmount}
        ],
        "ReturnUrl": "",
        "Amount": amount,
        "PaymentGateWay": gateName
      }),
    );

    print(json.encode({
      "Description": "Online Fees Payment",
      "TransactionType": [
        {"name": fees, "id": idFee, "amount": feeAmount},
        {"name": buss, "id": idBus, "amount": busAmount}
      ],
      "ReturnUrl": "",
      "Amount": amount,
      "PaymentGateWay": gateName
    }));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = await json.decode(response.body);

      print(data);
      TransactionModel txn = TransactionModel.fromJson(data);
      mid2 = txn.mid;
      txnorderId2 = txn.orderId;
      callbackUrl2 = txn.callbackUrl;
      isStaging2 = txn.isStaging;
      txnToken2 = txn.txnToken;
      print(mid2);

      Map<String, dynamic> txnAmnt = data['txnAmount'];
      TxnAmount amnt = TxnAmount.fromJson(txnAmnt);
      txnAmount2 = amnt.value;

      Map<String, dynamic> userInf = data['userInfo'];
      UserInfo user = UserInfo.fromJson(userInf);
      customerID2 = user.custId;
      emailID2 = user.email;
      mobile2 = user.mobile;

      notifyListeners();
    } else {
      setLoading(false);
      print("Error in  transaction index TWO  response");
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////               RAZORPAY         ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////    get data  1 index  RAZORPAY    ////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////

  String? key1Razo;
  String? amount1Razo;
  String? name1Razo;
  String? description1Razo;
  String? customer1Razo;
  String? email1Razo;
  String? contact1Razo;
  String? order1;
  String? readableOrderid1;

  Future getDataOneRAZORPAY(String fees, String idFee, String feeAmount,
      String amount, String gateName) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);

    final http.Response response = await http.post(
      Uri.parse('${UIGuide.baseURL}/online-payment/razor-pay/get-data'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
      },
      body: jsonEncode({
        "Description": "Online Fees Payment",
        "TransactionType": [
          {"name": fees, "id": idFee, "amount": feeAmount}
        ],
        "ReturnUrl": "",
        "Amount": amount,
        "PaymentGateWay": gateName
      }),
    );

    print(json.encode({
      "Description": "Online Fees Payment",
      "TransactionType": [
        {"name": fees, "id": idFee, "amount": feeAmount}
      ],
      "ReturnUrl": "",
      "Amount": amount,
      "PaymentGateWay": gateName
    }));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await json.decode(response.body);

        print(data);
        RazorPayModel raz = RazorPayModel.fromJson(data);
        key1Razo = raz.key;
        amount1Razo = raz.amount;
        name1Razo = raz.name;
        description1Razo = raz.description;
        order1 = raz.orderId;

        Map<String, dynamic> pre = data['prefill'];
        Prefill info = Prefill.fromJson(pre);
        customer1Razo = info.name;
        email1Razo = info.email;
        contact1Razo = info.contact;

        Map<String, dynamic> note = data['notes'];
        Notes inf = Notes.fromJson(note);
        readableOrderid1 = inf.readableOrderid;

        notifyListeners();
      } else {
        setLoading(false);
        print("Error in  transaction index one RAZORPAY response");
      }
    } catch (e) {
      print(e);
    }
  }

///////////////////////////////////////////////////////////////////////////////////////

//////////////////////////    get data  2 index RAZORPAY   ///////////////////////////

/////////////////////////////////////////////////////////////////////////////////////

  String? key2Razo;
  String? amount2Razo;
  String? name2Razo;
  String? description2Razo;
  String? order2;
  String? customer2Razo;
  String? email2Razo;
  String? contact2Razo;
  String? readableOrderid2;

  Future getDataTwoRAZORPAY(
      String fees,
      String idFee,
      String feeAmount,
      String buss,
      String idBus,
      String busAmount,
      String amount,
      String gateName) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);

    final http.Response response = await http.post(
      Uri.parse('${UIGuide.baseURL}/online-payment/razor-pay/get-data'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
      },
      body: jsonEncode({
        "Description": "Online Fees Payment",
        "TransactionType": [
          {"name": fees, "id": idFee, "amount": feeAmount},
          {"name": buss, "id": idBus, "amount": busAmount}
        ],
        "ReturnUrl": "",
        "Amount": amount,
        "PaymentGateWay": gateName
      }),
    );

    print(json.encode({
      "Description": "Online Fees Payment",
      "TransactionType": [
        {"name": fees, "id": idFee, "amount": feeAmount},
        {"name": buss, "id": idBus, "amount": busAmount}
      ],
      "ReturnUrl": "",
      "Amount": amount,
      "PaymentGateWay": gateName
    }));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = await json.decode(response.body);

      print(data);
      RazorPayModel raz = RazorPayModel.fromJson(data);
      key2Razo = raz.key;
      amount2Razo = raz.amount;
      name2Razo = raz.name;
      description2Razo = raz.description;
      order2 = raz.orderId;

      Map<String, dynamic> pre = data['prefill'];
      Prefill info = Prefill.fromJson(pre);
      customer2Razo = info.name;
      email2Razo = info.email;
      contact2Razo = info.contact;

      Map<String, dynamic> note = data['notes'];
      Notes inf = Notes.fromJson(note);
      readableOrderid2 = inf.readableOrderid;

      notifyListeners();
    } else {
      setLoading(false);
      print("Error in  transaction index TWO  response");
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  //////////////////////        gateway NAME          /////////////////////////

  ////////////////////////////////////////////////////////////////////////////
  String? gateway;
  Future gatewayName() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/payment-gateway-selector/check-default-paymentgateway"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        GateWayName att = GateWayName.fromJson(data);

        gateway = att.gateway;
        print('gateway  $gateway');

        notifyListeners();
      } else {
        setLoading(false);
        print("Error in  status  response");
      }
    } catch (e) {
      print(e);
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  //////////////////////       vendor Mapping          ////////////////////////

  ////////////////////////////////////////////////////////////////////////////
  bool? existMap;
  Future vendorMapping() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/vendor-mapping/exist-vendor-map"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        VendorMapModel ven = VendorMapModel.fromJson(data);

        existMap = ven.existMap;
        print('existMap  $existMap');

        notifyListeners();
      } else {
        setLoading(false);
        print("Error in  vendor Mapping   response");
      }
    } catch (e) {
      print(e);
    }
  }
}
