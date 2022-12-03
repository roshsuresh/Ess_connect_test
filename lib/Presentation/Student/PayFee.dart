import 'dart:math';
import 'package:Ess_test/Application/StudentProviders/InternetConnection.dart';
import 'package:Ess_test/Application/StudentProviders/PAYTM_provider.dart';
import 'package:Ess_test/Presentation/Student/NoInternetScreen.dart';
import 'package:Ess_test/Presentation/Student/PartialPay.dart';
import 'package:Ess_test/Presentation/Student/Student_home.dart';
import 'package:Ess_test/utils/ProgressBarFee.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Application/StudentProviders/FeesProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class PayFee extends StatelessWidget {
  PayFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ConnectivityProvider>(context, listen: false);
    });
    return Consumer<ConnectivityProvider>(
      builder: (context, connection, child) => connection.isOnline == false
          ? NoInternetConnection()
          : DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: AppBar(
                    title: Text('Payment'),
                    titleSpacing: 00.0,
                    centerTitle: true,
                    toolbarHeight: 50.2,
                    toolbarOpacity: 0.8,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                    ),
                    backgroundColor: UIGuide.light_Purple,
                    bottom: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: UIGuide.light_Purple,
                      indicatorWeight: 0.1,
                      tabs: [
                        const Tab(
                          text: "Installment",
                        ),
                        Consumer<FeesProvider>(builder: ((context, pro, child) {
                          if (pro.allowPartialPayment != false) {
                            return const Tab(
                              text: 'Partial',
                            );
                          } else {
                            return Text('');
                          }
                        }))
                      ],
                    ),
                  ),
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      FeePayInstallment(),
                      Consumer<FeesProvider>(builder: ((context, snap, child) {
                        if (snap.allowPartialPayment != false) {
                          return FeePartialPayment();
                        }
                        return Text('');
                      }))
                    ],
                  )),
            ),
    );
  }
}

class FeePayInstallment extends StatefulWidget {
  const FeePayInstallment({Key? key}) : super(key: key);

  @override
  State<FeePayInstallment> createState() => _FeePayInstallmentState();
}

class _FeePayInstallmentState extends State<FeePayInstallment> {
  final ScrollController _controller = ScrollController();

  final ScrollController _controller2 = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<FeesProvider>(context, listen: false);

      p.gatewayName();
      p.selecteCategorys.clear();
      p.selectedBusFee.clear();
      p.feesData();
      p.busFeeList.clear();
      p.feeList.clear();
      p.totalFees = 0;
      p.total = 0;
      p.totalBusFee = 0;
      p.transactionList.clear();
    });
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _controller2.dispose();
  //   Provider.of<FeesProvider>(context, listen: false).dispose();
  //   super.dispose();
  // }

  // void _selectAll(int index) {
  //   _selecteCategorys.addAll(feeResponse![index]['installmentNetDue']);
  // }

  // void _onFeeSelected(bool selected, feeName, int index, feeNetDue) {
  //   if (selected == true) {
  //     //  setState(() {
  //     _selecteCategorys.add(feeName);
  //     print(index);
  //     final double tot = feeNetDue;
  //     print(feeName);
  //     print(tot);
  //     totalFees = tot + totalFees;
  //     print(totalFees);
  //     total = totalFees + totalBusFee;
  //     print(total);
  //     //  });
  //   } else {
  //     //  setState(() {
  //     // _selecteCategorys.remove(fee_Name);
  //     // print('removed  $fee_Name');
  //     // final double tot = feeResponse![index]['installmentNetDue'];
  //     // print(fee_Name);
  //     // print(tot);
  //     // totalFees = tot - totalFees;
  //     // print('totalFees: $totalFees');
  //     if (_selecteCategorys.remove(feeName)) {
  //       final double tot = feeNetDue;
  //       totalFees = totalFees - tot;
  //       total = totalFees + totalBusFee;
  //       print(total);
  //     }
  //     //   });
  //   }
  // }

  //bus fee
  // final List _selectedBusFee = [];

  // double totalBusFee = 0;

  // void _onBusSelected(bool selected, busfeeName, int index, feeNetDue) {
  //   if (selected == true) {
  //     //   setState(() {
  //     _selectedBusFee.add(busfeeName);
  //     print(index);
  //     final double tot = feeNetDue;
  //     print(busfeeName);
  //     print(tot);
  //     totalBusFee = tot + totalBusFee;
  //     print(totalBusFee);
  //     //  total = totalFees + totalBusFee;
  //     print(total);
  //     //  });
  //   } else {
  //     //   setState(() {
  //     if (_selectedBusFee.remove(busfeeName)) {
  //       final double tot = feeNetDue;
  //       totalBusFee = totalBusFee - tot;
  //       // total = totalFees + totalBusFee;
  //       print(total);
  //     }
  //     //   });
  //   }
  // }

  // double? total = 0;

  // void totalFee() async {
  //   //  setState(() {
  //   // total = totalFees + totalBusFee;
  //   print(total);
  //   //  });
  // }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool enable = true;
  @override
  Widget build(BuildContext cont) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Consumer<FeesProvider>(
            builder: (context, value, child) => value.loading
                ? ProgressBarFee()
                : ListView(
                    children: [
                      kheight20,
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Installment',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: UIGuide.light_Purple),
                            ),
                            Consumer<FeesProvider>(
                                builder: (context, snap, child) {
                              //   child:
                              return Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Checkbox(
                                  value: snap.isselectAll,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value = snap.isselectAll;
                                    });
                                  },
                                  //       },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Scrollbar(
                        controller: _controller,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 8),
                          child: LimitedBox(
                              maxHeight: 160,
                              child: Consumer<FeesProvider>(
                                builder: (context, value, child) =>
                                    ListView.builder(
                                        shrinkWrap: true,
                                        controller: _controller,
                                        itemCount: value.feeList.length == null
                                            ? 0
                                            : value.feeList.length,

                                        // feeResponse == null ? 0 : feeResponse!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          print(value.feeList.length);
                                          return CheckboxListTile(
                                            activeColor: const Color.fromARGB(
                                                255, 238, 236, 236),
                                            checkColor: UIGuide.light_Purple,
                                            selectedTileColor:
                                                UIGuide.light_Purple,
                                            value: value.selecteCategorys.contains(
                                                value.feeList[index]
                                                        .installmentName ??
                                                    '--'
                                                // feeResponse![index]['installmentName']
                                                ),
                                            onChanged: (bool? selected) async {
                                              // selected == true;

                                              //if (index == 1 && enable == false) {
                                              //  enable = true;
                                              value.onFeeSelected(
                                                  selected!,
                                                  value.feeList[index]
                                                      .installmentName,
                                                  index,
                                                  value.feeList[index].netDue);
                                            },
                                            title: Text(
                                              value.feeList[index].netDue ==
                                                      null
                                                  ? '--'
                                                  : value.feeList[index].netDue
                                                      .toString(),
                                              textAlign: TextAlign.end,
                                            ),
                                            secondary: Text(
                                              value.feeList[index]
                                                      .installmentName ??
                                                  '--',
                                            ),
                                          );
                                        }),
                              )

                              // return ListView.builder(
                              //   shrinkWrap: true,
                              //   controller: _controller,
                              //   itemCount: feeResponse == null
                              //       ? 0
                              //       : feeResponse!.length,
                              //   itemBuilder: ((context, index) {
                              //     return Table(
                              //       //  border: TableBorder.all(),
                              //       children: [
                              //         TableRow(
                              //             decoration: const BoxDecoration(
                              //                 // color: Color.fromARGB(
                              //                 //     255, 230, 227, 227),
                              //                 ),
                              //             children: [
                              //               Text(
                              //                   "\n${feeResponse![index]['installmentName']}"),
                              //               Center(
                              //                   child: Text(
                              //                       '\n${feeResponse![index]['installmentNetDue'].toString()}')),
                              //               Center(child: CheckBoxButton()),
                              //             ]),
                              //       ],
                              //     );
                              //   }),
                              // );
                              //   },
                              // ),
                              ),
                        ),
                        thumbVisibility: true,
                        thickness: 6,
                        radius: Radius.circular(20),
                      ),
                      Consumer<FeesProvider>(
                        builder: (context, value, child) => Center(
                          child: Text(
                            'TotalFee:  ${value.totalFees}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Consumer<FeesProvider>(
                        builder: (context, bus, child) {
                          if (bus.busFeeList.isNotEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                  controller: _controller2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 8),
                                    child: LimitedBox(
                                        maxHeight: 280,
                                        child: Consumer<FeesProvider>(
                                          builder: (context, value, child) =>
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  controller: _controller2,
                                                  itemCount: value
                                                          .busFeeList.isEmpty
                                                      ? 0
                                                      : value.busFeeList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    // print(
                                                    //     '-----=====--------${value.busFeeList[index]}');
                                                    var list = [];
                                                    list.addAll([
                                                      value.busFeeList[index]
                                                    ]);
                                                    //  print(list);
                                                    return CheckboxListTile(
                                                      activeColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              238,
                                                              236,
                                                              236),
                                                      checkColor:
                                                          UIGuide.light_Purple,
                                                      selectedTileColor:
                                                          UIGuide.light_Purple,
                                                      value: value
                                                          .selectedBusFee
                                                          .contains(value
                                                              .busFeeList[index]
                                                              .installmentName),
                                                      onChanged:
                                                          (bool? selected) {
                                                        value.onBusSelected(
                                                            selected!,
                                                            value
                                                                .busFeeList[
                                                                    index]
                                                                .installmentName,
                                                            index,
                                                            value
                                                                .busFeeList[
                                                                    index]
                                                                .netDue);

                                                        print(selected);
                                                      },
                                                      title: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 75),
                                                        child: Text(
                                                          value
                                                              .busFeeList[index]
                                                              .netDue
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                      ),
                                                      secondary: Text(value
                                                              .busFeeList[index]
                                                              .installmentName ??
                                                          '--'),
                                                    );
                                                  }),
                                        )),
                                  ),
                                  thumbVisibility: true,
                                  thickness: 6,
                                  radius: const Radius.circular(20),
                                ),
                                Consumer<FeesProvider>(
                                  builder: (context, value, child) => Center(
                                    child: Text(
                                      'TotalBus fee :  ${value.totalBusFee}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
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
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Total : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            // totalFee()
                            Consumer<FeesProvider>(
                                builder: (context, value, child) =>
                                    Text(value.total.toString()))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
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
                        height: 100,
                      ),
                    ],
                  ),
          ),
          Positioned(
            bottom: 2,
            left: 10,
            right: 10,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 5),
              child: Consumer<FeesProvider>(
                builder: (_, trans, child) {
                  return MaterialButton(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   side: BorderSide(color: UIGuide.THEME_LIGHT),
                    // ),
                    height: 50,
                    onPressed: () async {
                      if (trans.lastOrderStatus == 'Success' ||
                          trans.lastOrderStatus == 'Failed') {
                        if (trans.total != 0) {
                          /////////////////////////////////////////////////////////////////////////
                          ////////////////////   get data of one             //////////////////////
                          /////////////////////////////////////////////////////////////////////////

                          if (trans.transactionList.length == 1) {
                            print('1111111111111111');
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
                                    trans.totalFees.toString(),
                                    trans.total.toString(),
                                    gateWay);

                            await AwesomeDialog(
                              context: cont,
                              animType: AnimType.scale,
                              dialogType: DialogType.info,
                              title: 'Do you want to continue the payment',
                              desc:
                                  "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
                              btnOkOnPress: () async {
                                String mid1 = trans.mid1 ?? '--';
                                String orderId1 = trans.txnorderId1 ?? '--';
                                String amount1 = trans.txnAmount1 ?? '--';
                                String txntoken = trans.txnToken1 ?? '';
                                print(txntoken);
                                String callbackURL1 =
                                    trans.callbackUrl1 ?? '--';
                                bool staging1 = trans.isStaging1 ?? true;

                                if (txntoken.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      duration: Duration(seconds: 1),
                                      margin: EdgeInsets.only(
                                          bottom: 80, left: 30, right: 30),
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
                            print('-------------22222222-------------------');

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
                            await Provider.of<FeesProvider>(context,
                                    listen: false)
                                .getDataTwo(
                                    transType1,
                                    transID1,
                                    trans.totalFees.toString(),
                                    transType2,
                                    transID2,
                                    trans.totalBusFee.toString(),
                                    trans.total.toString(),
                                    gateway.toString());

                            await AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.info,
                              title: 'Do you want to continue the payment',
                              desc:
                                  "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
                              btnOkOnPress: () async {
                                String mid2 = trans.mid2 ?? '--';
                                String orderId2 = trans.txnorderId2 ?? '--';
                                String amount2 = trans.txnAmount2 ?? '--';
                                String txntoken = trans.txnToken2 ?? '';
                                print(txntoken);
                                String callbackURL2 =
                                    trans.callbackUrl2 ?? '--';
                                bool staging2 = trans.isStaging2 ?? true;

                                if (txntoken.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      duration: Duration(seconds: 1),
                                      margin: EdgeInsets.only(
                                          bottom: 80, left: 30, right: 30),
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
                                      mid2,
                                      orderId2,
                                      amount2,
                                      callbackURL2,
                                      staging2);
                                }
                              },
                              btnCancelOnPress: () {
                                Navigator.of(_scaffoldKey.currentContext!)
                                    .pop();
                                //      Navigator.pop(context);
                              },
                            ).show();
                          } else if (trans.transactionList.length == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Something Went Wrong.....!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              duration: Duration(seconds: 1),
                              margin: EdgeInsets.only(
                                  bottom: 80, left: 30, right: 30),
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Select Fees.....!',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      } else if (trans.lastOrderStatus == 'Processing') {
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

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
//   Future<void> _startTransaction(
//     String txnToken,
//     String mid,
//     String orderId,
//     String amount,
//     String callbackUrl,
//     bool isStaging,
//   ) async {
//     if (txnToken.isEmpty) {
//       return;
//     }
//     // var sendMap = <String, dynamic>{
//     //   "mid": mid,
//     //   "orderId": orderId,
//     //   "amount": amount,
//     //   "txnToken": txnToken,
//     //   "callbackUrl": callbackUrl,
//     //   "isStaging": isStaging,
//     //   "restrictAppInvoke": restrictAppInvoke,
//     // };
//     // print(sendMap);
//     print('sendMap');

//     try {
//       var response = AllInOneSdk.startTransaction(
//         mid,
//         orderId,
//         amount,
//         txnToken,
//         "",
//         isStaging,
//         restrictAppInvoke,
//       );
//       response.then((value) {
//         print(value);
//         setState(() {
//           result = value.toString();
//         });
//       }).catchError((onError) {
//         if (onError is PlatformException) {
//           setState(() {
//             result = onError.message.toString() +
//                 " \n  " +
//                 onError.details.toString();
//           });
//         } else {
//           setState(() {
//             result = onError.toString();
//           });
//         }
//       });
//     } catch (err) {
//       result = err.toString();
//     }
//   }
// }

// //pdf download

class PdfDownload extends StatelessWidget {
  PdfDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeesProvider>(
      builder: (context, value, child) => WillPopScope(
        onWillPop: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentHome()),
          );
          throw (e);
        },
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  kWidth,
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => StudentHome()),
                            (Route<dynamic> route) => false);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  kWidth,
                  kWidth,
                  kWidth,
                  const Text('Payment'),
                ],
              ),
              titleSpacing: 00.0,
              centerTitle: true,
              toolbarHeight: 50.2,
              toolbarOpacity: 0.8,
              backgroundColor: UIGuide.light_Purple,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: DownloandPdf(
                    isUseIcon: true,
                    pdfUrl: value.url.toString() == null
                        ? '--'
                        : value.url.toString(),
                    fileNames: value.name.toString() == null
                        ? '---'
                        : value.name.toString(),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: SfPdfViewer.network(
              value.url.toString() == null ? '--' : value.url.toString(),
            )),
      ),
    );
  }
}
