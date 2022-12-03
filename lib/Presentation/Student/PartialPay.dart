import 'dart:developer';

import 'package:Ess_test/Application/StudentProviders/FeesProvider.dart';
import 'package:Ess_test/Application/StudentProviders/PAYTM_provider.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Presentation/Student/PayFee.dart';
import 'package:Ess_test/Presentation/Student/Student_home.dart';
import 'package:Ess_test/utils/ProgressBarFee.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:provider/provider.dart';

class FeePartialPayment extends StatefulWidget {
  FeePartialPayment({Key? key}) : super(key: key);

  @override
  State<FeePartialPayment> createState() => _FeePartialPaymentState();
}

class _FeePartialPaymentState extends State<FeePartialPayment> {
  final ScrollController _controllerr = ScrollController();

  final ScrollController _controllerr2 = ScrollController();
  final _busController = TextEditingController();
  final _feeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<FeesProvider>(context, listen: false);
      //  p.gatewayName();

      p.busFeeList.clear();
      p.feeList.clear();
      p.feesData();
      totalPartial = 0;
      totalBusPartial = 0;
      totallPartial = 0;
      totalFeePartial = 0;
      totalFeeCollect = 0;
      p.transactionList.clear();
      p.gatewayName();
    });
  }

  double totalPartial = 0;
  double totalBusPartial = 0;
  double totallPartial = 0;
  double totalFeePartial = 0;
  double totalFeeCollect = 0;

  feeDate() {
    totalFeePartial = totalFeePartial + totallPartial;
    print("totalFeePartial:  $totalFeePartial");
  }

  busFee() {
    totalBusPartial = (totalBusPartial + totalPartial);
    print('totalbusfee:   $totalBusPartial');
  }

  totalFeeCollection() {
    if (_feeController.text.isEmpty) {
      _feeController.text == 0;
      totalFeeCollect = 0 + double.parse(_busController.text);

      print(totalFeeCollect);
    } else if (_busController.text.isEmpty) {
      _busController.text == 0;
      totalFeeCollect = 0 + double.parse(_feeController.text);

      print(totalFeeCollect);
    } else {
      totalFeeCollect =
          double.parse(_feeController.text) + double.parse(_busController.text);
      print(totalFeeCollect);
    }
  }

  // @override
  // void dispose() {
  //   _controllerr.dispose();
  //   _controllerr2.dispose();
  //   Provider.of<FeesProvider>(context, listen: false).dispose();
  //   _busController.dispose();
  //   _feeController.dispose();
  //   super.dispose();
  // }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext cont) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<FeesProvider>(
        builder: (context, value, child) => value.loading
            ? ProgressBarFee()
            : Stack(
                children: [
                  ListView(
                    children: [
                      kheight20,
                      const Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Installment',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: UIGuide.light_Purple),
                        ),
                      ),
                      Scrollbar(
                        controller: _controllerr,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 8),
                          child: LimitedBox(
                              maxHeight: 160,
                              child: Consumer<FeesProvider>(
                                builder: (context, valuee, child) =>
                                    ListView.builder(
                                        shrinkWrap: true,
                                        controller: _controllerr,
                                        itemCount: valuee.feeList.length == null
                                            ? 0
                                            : valuee.feeList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          totallPartial =
                                              valuee.feeList[index].netDue!;

                                          feeDate();

                                          return ListTile(
                                            trailing: Text(
                                              valuee.feeList[index].netDue ==
                                                      null
                                                  ? '--'
                                                  : valuee.feeList[index].netDue
                                                      .toString(),
                                            ),
                                            title: Text(
                                              valuee.feeList[index]
                                                      .installmentName ??
                                                  '--',
                                            ),
                                          );
                                        }),
                              )),
                        ),
                        thumbVisibility: true,
                        thickness: 6,
                        radius: Radius.circular(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: SizedBox(
                              height: 30,
                              width: size.width / 3.5,
                              child: TextField(
                                controller: _feeController,
                                cursorColor: UIGuide.light_Purple,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    focusColor: const Color.fromARGB(
                                        255, 213, 215, 218),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: UIGuide.light_Purple,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor: Colors.grey,
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "verdana_regular",
                                      fontWeight: FontWeight.w400,
                                    ),
                                    labelText: 'Amount',
                                    labelStyle: const TextStyle(
                                        color: Color.fromARGB(
                                            255, 106, 107, 109))),
                                onChanged: (value) {
                                  if (double.parse(_feeController.text) == 0) {
                                    _feeController.clear();
                                  } else if (double.parse(_feeController.text) -
                                          1 >=
                                      totalFeePartial) {
                                    _feeController.clear();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      kheight10,
                      Consumer<FeesProvider>(
                        builder: (context, buss, child) {
                          if (buss.busFeeList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 10, top: 10),
                                  child: Text(
                                    'Bus Fee',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: UIGuide.light_Purple),
                                  ),
                                ),
                                Scrollbar(
                                  controller: _controllerr2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 8),
                                    child: LimitedBox(
                                        maxHeight: 280,
                                        child: Consumer<FeesProvider>(
                                            builder: (context, val, child) {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              controller: _controllerr2,
                                              itemCount: val.busFeeList.isEmpty
                                                  ? 0
                                                  : val.busFeeList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                totalPartial = val
                                                    .busFeeList[index].netDue!;
                                                busFee();
                                                return ListTile(
                                                  trailing: Text(
                                                    val.busFeeList[index].netDue
                                                        .toString(),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  title: Text(val
                                                          .busFeeList[index]
                                                          .installmentName ??
                                                      '--'),
                                                );
                                              });
                                        })),
                                  ),
                                  thumbVisibility: true,
                                  thickness: 6,
                                  radius: const Radius.circular(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 25.0),
                                      child: SizedBox(
                                        height: 30,
                                        width: size.width / 3.5,
                                        child: TextFormField(
                                          controller: _busController,
                                          cursorColor: UIGuide.light_Purple,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              focusColor: const Color.fromARGB(
                                                  255, 213, 215, 218),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: UIGuide.light_Purple,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              fillColor: Colors.grey,
                                              hintStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontFamily: "verdana_regular",
                                                fontWeight: FontWeight.w400,
                                              ),
                                              labelText: 'Amount',
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 106, 107, 109))),
                                          onChanged: (value) {
                                            if (double.parse(
                                                        _busController.text) ==
                                                    0 ||
                                                _busController.text.isEmpty) {
                                              _busController.clear();
                                            } else if (double.parse(
                                                        _busController.text) -
                                                    1 >=
                                                totalBusPartial) {
                                              _busController.clear();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              height: 0,
                              width: 0,
                            );
                          }
                        },
                      ),
                      kheight20,
                      kheight20,
                      GestureDetector(
                        child: const Text(
                          'Last Transaction Details',
                          style: TextStyle(
                            color: UIGuide.light_Purple,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Consumer<FeesProvider>(
                                      builder: (context, provider, child) {
                                    String date =
                                        provider.lastTransactionStartDate ??
                                            '--';
                                    var updatedDate =
                                        DateFormat('yyyy-MM-dd').parse(date);
                                    String newDate = updatedDate.toString();
                                    String finalDate =
                                        newDate.replaceRange(10, 23, '');
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          kheight10,
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Your last transaction  details',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: UIGuide.light_Purple),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Transaction Date: ',
                                                ),
                                                Flexible(
                                                  child: RichText(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    strutStyle:
                                                        const StrutStyle(),
                                                    maxLines: 3,
                                                    text: TextSpan(
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: UIGuide
                                                                .light_Purple),
                                                        text:
                                                            // provider.title ??
                                                            finalDate),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Transaction amount: ',
                                                ),
                                                Text(
                                                  provider.lastTransactionAmount ==
                                                          null
                                                      ? ''
                                                      : provider
                                                          .lastTransactionAmount
                                                          .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          UIGuide.light_Purple),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Transaction Status: ',
                                                ),
                                                Consumer<FeesProvider>(
                                                  builder:
                                                      (context, value, child) {
                                                    String stats =
                                                        provider.lastOrderStatus ==
                                                                null
                                                            ? ''
                                                            : provider
                                                                .lastOrderStatus
                                                                .toString();
                                                    if (stats == "Success") {
                                                      return const Text(
                                                        "Success",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.green),
                                                      );
                                                    } else if (stats ==
                                                        "Failed") {
                                                      return const Text(
                                                        "Failed",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      );
                                                    } else if (stats ==
                                                        "Cancelled") {
                                                      return const Text(
                                                        "Cancelled",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    192,
                                                                    56,
                                                                    7)),
                                                      );
                                                    } else if (stats ==
                                                        "Processing") {
                                                      return const Text(
                                                        "Processing",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.orange),
                                                      );
                                                    } else {
                                                      return const Text(
                                                        "--",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: UIGuide
                                                                .light_Purple),
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    provider.lastOrderStatus ==
                                                            null
                                                        ? ''
                                                        : provider
                                                            .lastOrderStatus
                                                            .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: UIGuide
                                                            .light_Purple),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Consumer<FeesProvider>(
                                            builder: (context, value, child) {
                                              String status =
                                                  provider.lastOrderStatus ==
                                                          null
                                                      ? ''
                                                      : provider.lastOrderStatus
                                                          .toString();
                                              if (status == 'Success' ||
                                                  status == 'Failed') {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'Download receipt: ',
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          String orderID =
                                                              await provider
                                                                          .orderId ==
                                                                      null
                                                                  ? ''
                                                                  : provider
                                                                      .orderId
                                                                      .toString();
                                                          // await Provider.of<
                                                          //             FeesProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .payStatus(
                                                          //         orderID);

                                                          await Provider.of<
                                                                      FeesProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .pdfDownload(
                                                                  orderID);
                                                          String extenstion =
                                                              await provider
                                                                      .extension ??
                                                                  '--';

                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback(
                                                                  (_) {
                                                            Navigator
                                                                .pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PdfDownload()),
                                                            );
                                                          });
                                                        },
                                                        child: const Icon(
                                                            Icons.download,
                                                            color: UIGuide
                                                                .light_Purple),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 0,
                                                  width: 0,
                                                );
                                              }
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                kWidth,
                                                MaterialButton(
                                                  height: 30,
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: UIGuide.WHITE),
                                                  ),
                                                  color: UIGuide.light_Purple,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              });
                        },
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 10, right: 10),
                      child: Consumer<FeesProvider>(
                        builder: (context, trans, child) => MaterialButton(
                          height: 50,
                          onPressed: () async {
                            if (value.lastOrderStatus == 'Success' ||
                                value.lastOrderStatus == 'Failed') {
                              if (_busController.text.isEmpty &&
                                  _feeController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    duration: Duration(seconds: 1),
                                    margin: EdgeInsets.only(
                                        bottom: 80, left: 30, right: 30),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      'Enter Amount...',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                await totalFeeCollection();
                                print("totalFeeCollect $totalFeeCollect");
                                /////////////////////////////////////////////////////////////////////////
                                ////////////////////   get data of one             //////////////////////
                                /////////////////////////////////////////////////////////////////////////

                                if (trans.transactionList.length == 1) {
                                  print(
                                      '---------------1111111111--------------------');
                                  String transType =
                                      trans.transactionList[0].name ?? '--';
                                  String transId1 =
                                      trans.transactionList[0].id ?? '--';
                                  String gateWay = trans.gateway ?? '--';
                                  print(transType);
                                  print(transId1);

                                  await Provider.of<FeesProvider>(context,
                                          listen: false)
                                      .getDataOne(
                                          transType,
                                          transId1,
                                          _feeController.text.toString(),
                                          totalFeeCollect.toString(),
                                          gateWay);

                                  await AwesomeDialog(
                                    context: cont,
                                    animType: AnimType.scale,
                                    dialogType: DialogType.info,
                                    title:
                                        'Do you want to continue the payment',
                                    desc:
                                        "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
                                    btnOkOnPress: () async {
                                      String mid1 = trans.mid1 ?? '--';
                                      String orderId1 =
                                          trans.txnorderId1 ?? '--';
                                      String amount1 = trans.txnAmount1 ?? '--';
                                      String txntoken = trans.txnToken1 ?? '';
                                      print(txntoken);
                                      String callbackURL1 =
                                          trans.callbackUrl1 ?? '--';
                                      bool staging1 = trans.isStaging1 ?? true;

                                      if (txntoken.isEmpty) {
                                        ScaffoldMessenger.of(cont).showSnackBar(
                                          const SnackBar(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            duration: Duration(seconds: 1),
                                            margin: EdgeInsets.only(
                                                bottom: 80,
                                                left: 30,
                                                right: 30),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              'Something went wrong...',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
                                      } else {
                                        await _startTransaction(
                                            txntoken,
                                            mid1,
                                            orderId1,
                                            amount1,
                                            callbackURL1,
                                            staging1);
                                      }
                                    },
                                    btnCancelOnPress: () {
                                      Navigator.of(_scaffoldKey.currentContext!)
                                          .pop();
                                      //      Navigator.pop(context);
                                    },
                                  ).show();
                                }

                                /////////////////////////////////////////////////////////////////////////
                                ////////////////////   get data of two             //////////////////////
                                /////////////////////////////////////////////////////////////////////////

                                else if (trans.transactionList.length == 2) {
                                  print(
                                      '-------------22222222-------------------');

                                  String transType1 =
                                      trans.transactionList[0].name ?? '--';
                                  String transType2 =
                                      trans.transactionList[1].name ?? '--';
                                  String transID1 =
                                      trans.transactionList[0].id ?? '--';
                                  String transID2 =
                                      trans.transactionList[1].id ?? '--';
                                  String gateway = trans.gateway ?? '--';
                                  print(transType1);
                                  print(transType2);
///////////////////////////            _feeController.text.isEmpty                  /////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
                                  if (_feeController.text.isEmpty &&
                                      _busController.text.isNotEmpty) {
                                    String feeZero = "0";
                                    await Provider.of<FeesProvider>(context,
                                            listen: false)
                                        .getDataTwo(
                                            transType1,
                                            transID1,
                                            feeZero,
                                            transType2,
                                            transID2,
                                            _busController.text.toString(),
                                            totalFeeCollect.toString(),
                                            gateway.toString());

                                    await AwesomeDialog(
                                      context: cont,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.info,
                                      title:
                                          'Do you want to continue the payment',
                                      desc:
                                          "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
                                      btnOkOnPress: () async {
                                        String mid2 = trans.mid2 ?? '--';
                                        String orderId2 =
                                            trans.txnorderId2 ?? '--';
                                        String amount2 =
                                            trans.txnAmount2 ?? '--';
                                        String txntoken = trans.txnToken2 ?? '';
                                        print(txntoken);
                                        String callbackURL2 =
                                            trans.callbackUrl2 ?? '--';
                                        bool staging2 =
                                            trans.isStaging2 ?? true;

                                        if (txntoken.isEmpty) {
                                          ScaffoldMessenger.of(cont)
                                              .showSnackBar(
                                            const SnackBar(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              duration: Duration(seconds: 1),
                                              margin: EdgeInsets.only(
                                                  bottom: 80,
                                                  left: 30,
                                                  right: 30),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                'Something went wrong...',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );
                                        } else {
                                          await _startTransaction(
                                              txntoken,
                                              mid2,
                                              orderId2,
                                              amount2,
                                              callbackURL2,
                                              staging2);
                                        }
                                      },
                                      btnCancelOnPress: () {
                                        Navigator.of(
                                                _scaffoldKey.currentContext!)
                                            .pop();
                                        //      Navigator.pop(context);
                                      },
                                    ).show();
                                  }

                                  /////////            _busController.text.isEmpty                  /////////////////////
                                  ///////////////////////////////////////////////////////////////////////////////////////
                                  else if (_feeController.text.isNotEmpty &&
                                      _busController.text.isEmpty) {
                                    String busZero = '0';
                                    await Provider.of<FeesProvider>(context,
                                            listen: false)
                                        .getDataTwo(
                                            transType1,
                                            transID1,
                                            _feeController.text.toString(),
                                            transType2,
                                            transID2,
                                            busZero,
                                            totalFeeCollect.toString(),
                                            gateway.toString());

                                    await AwesomeDialog(
                                      context: cont,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.info,
                                      title:
                                          'Do you want to continue the payment',
                                      desc:
                                          "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
                                      btnOkOnPress: () async {
                                        String mid2 = trans.mid2 ?? '--';
                                        String orderId2 =
                                            trans.txnorderId2 ?? '--';
                                        String amount2 =
                                            trans.txnAmount2 ?? '--';
                                        String txntoken = trans.txnToken2 ?? '';
                                        print(txntoken);
                                        String callbackURL2 =
                                            trans.callbackUrl2 ?? '--';
                                        bool staging2 =
                                            trans.isStaging2 ?? true;

                                        if (txntoken.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              duration: Duration(seconds: 1),
                                              margin: EdgeInsets.only(
                                                  bottom: 80,
                                                  left: 30,
                                                  right: 30),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                'Something went wrong...',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );
                                        } else {
                                          await _startTransaction(
                                              txntoken,
                                              mid2,
                                              orderId2,
                                              amount2,
                                              callbackURL2,
                                              staging2);
                                        }
                                      },
                                      btnCancelOnPress: () {
                                        Navigator.of(
                                                _scaffoldKey.currentContext!)
                                            .pop();
                                        //      Navigator.pop(context);
                                      },
                                    ).show();
                                  } else if (_feeController.text.isNotEmpty &&
                                      _busController.text.isNotEmpty) {
                                    await Provider.of<FeesProvider>(context,
                                            listen: false)
                                        .getDataTwo(
                                            transType1,
                                            transID1,
                                            _feeController.text.toString(),
                                            transType2,
                                            transID2,
                                            _busController.text.toString(),
                                            totalFeeCollect.toString(),
                                            gateway.toString());

                                    await AwesomeDialog(
                                      context: cont,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.info,
                                      title:
                                          'Do you want to continue the payment',
                                      desc:
                                          "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
                                      btnOkOnPress: () async {
                                        String mid2 = trans.mid2 ?? '--';
                                        String orderId2 =
                                            trans.txnorderId2 ?? '--';
                                        String amount2 =
                                            trans.txnAmount2 ?? '--';
                                        String txntoken = trans.txnToken2 ?? '';
                                        print(txntoken);
                                        String callbackURL2 =
                                            trans.callbackUrl2 ?? '--';
                                        bool staging2 =
                                            trans.isStaging2 ?? true;

                                        if (txntoken.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              duration: Duration(seconds: 1),
                                              margin: EdgeInsets.only(
                                                  bottom: 80,
                                                  left: 30,
                                                  right: 30),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                'Something went wrong...',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );
                                        } else {
                                          await _startTransaction(
                                              txntoken,
                                              mid2,
                                              orderId2,
                                              amount2,
                                              callbackURL2,
                                              staging2);
                                        }
                                      },
                                      btnCancelOnPress: () {
                                        Navigator.of(
                                                _scaffoldKey.currentContext!)
                                            .pop();
                                        //      Navigator.pop(context);
                                      },
                                    ).show();
                                  } else {
                                    ScaffoldMessenger.of(cont).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Something Went Wrong.....!',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }
                                } else if (trans.transactionList.length == 0) {
                                  ScaffoldMessenger.of(cont).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Something Went Wrong.....!',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                } else {
                                  print(
                                    trans.transactionList.length,
                                  );
                                  print('Something Went wrong');
                                  ScaffoldMessenger.of(cont).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Something Went Wrong.....!',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              }
                            } else if (value.lastOrderStatus == 'Processing') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  duration: Duration(seconds: 5),
                                  margin: EdgeInsets.only(
                                      bottom: 80, left: 30, right: 30),
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Please wait for 30 minutes...\n Your payment is under 𝗣𝗿𝗼𝗰𝗲𝘀𝘀𝗶𝗻𝗴',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  duration: Duration(seconds: 5),
                                  margin: EdgeInsets.only(
                                      bottom: 80, left: 30, right: 30),
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Please wait for 30 minutes...\n Your payment is under 𝐏𝐫𝐨𝐜𝐞𝐬𝐬𝐢𝐧𝐠 / 𝐒𝐮𝐜𝐜𝐞𝐬𝐬 / 𝐅𝐚𝐢𝐥𝐞𝐝 / 𝐂𝐚𝐧𝐜𝐞𝐥𝐥𝐞𝐝',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Proceed to Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                          ),
                          color: UIGuide.light_Purple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////

  String result = "";
  bool restrictAppInvoke = true;

  Future<void> _startTransaction(
    String txnToken,
    String mid,
    String orderId,
    String amount,
    String callbackUrl,
    bool isStaging,
  ) async {
    if (txnToken.isEmpty) {
      return;
    }

    print('sendMap');
    var size = MediaQuery.of(context).size;
    try {
      var response = AllInOneSdk.startTransaction(
        mid,
        orderId,
        amount,
        txnToken,
        callbackUrl,
        isStaging,
        restrictAppInvoke,
      );
      response.then((value) {
        print(value);
        log(value.toString());
        setState(() {
          result = value.toString();
        });
        print('-----------------------------------------------------------');
        _showAlert(context, orderId);
      }).catchError((onError) {
        if (onError is PlatformException) {
          print('-------------------Failed-----------------');
          _showAlert(context, orderId);
          setState(() {
            result = onError.message.toString() +
                " \n  " +
                onError.details.toString();
          });
        } else {
          setState(() {
            print('-------------------Pending-----------------');
            _showAlert(context, orderId);
            result = onError.toString();
          });
        }
      });
    } catch (err) {
      _showAlert(context, orderId);
      print('-------------------ERROR-----------------');
      result = err.toString();
    }
  }

  void _showAlert(BuildContext context, String orderID) async {
    var size = MediaQuery.of(context).size;
    await Provider.of<PaytmFinalStatusProvider>(context, listen: false)
        .transactionStatus(orderID);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Consumer<PaytmFinalStatusProvider>(
              builder: (context, paytm, child) {
                if (paytm.reponseCode == '01') {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Container(
                      height: size.height / 4.5,
                      width: size.width * 3,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height / 10,
                              ),
                              const Text(
                                "TRANSACTION SUCCESS",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: UIGuide.light_Purple),
                              ),
                              kheight20,
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  UIGuide.light_Purple),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              StudentHome()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        },
                                        child: const Text(
                                          'Back to Home',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: UIGuide.WHITE),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: -80,
                            child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(UIGuide.success)),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (paytm.reponseCode == '810' ||
                    paytm.reponseCode == '501' ||
                    paytm.reponseCode == '401' ||
                    paytm.reponseCode == '335' ||
                    paytm.reponseCode == '334' ||
                    paytm.reponseCode == '295' ||
                    paytm.reponseCode == '235' ||
                    paytm.reponseCode == '227') {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Container(
                      height: size.height / 4.5,
                      width: size.width * 3,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height / 10,
                              ),
                              const Text(
                                "TRANSACTION FAILED",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: UIGuide.light_Purple),
                              ),
                              kheight20,
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  UIGuide.light_Purple),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              StudentHome()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        },
                                        child: const Text(
                                          'Back to Home',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: UIGuide.WHITE),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: -80,
                            child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(UIGuide.failed)),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (paytm.reponseCode == '400' ||
                    paytm.reponseCode == '402') {
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Container(
                      height: size.height / 4.5,
                      width: size.width * 3,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height / 10,
                              ),
                              const Text(
                                "TRANSACTION PENDING",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: UIGuide.light_Purple),
                              ),
                              kheight20,
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  UIGuide.light_Purple),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              StudentHome()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        },
                                        child: const Text(
                                          'Back to Home',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: UIGuide.WHITE),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: -90,
                            child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset(UIGuide.pending)),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Container(
                      height: size.height / 4.5,
                      width: size.width * 3,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height / 10,
                              ),
                              const Text(
                                "Something went wrong",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: UIGuide.light_Purple),
                              ),
                              kheight20,
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  UIGuide.light_Purple),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              StudentHome()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        },
                                        child: const Text(
                                          'Back to Home',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: UIGuide.WHITE),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Positioned(
                            top: -80,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.warning,
                                size: 80,
                                color: UIGuide.BLACK,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                  child: Container(
                    child: Text('Something went wrong'),
                  ),
                );
              },
            ));
  }
}
