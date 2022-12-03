import 'package:Ess_test/Application/StudentProviders/FeesProvider.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Student_home.dart';

class FeeDemo extends StatefulWidget {
  const FeeDemo({Key? key}) : super(key: key);

  @override
  State<FeeDemo> createState() => _FeeDemoState();
}

class _FeeDemoState extends State<FeeDemo> {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool enable = true;
  @override
  Widget build(BuildContext cont) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Please Wait   ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: UIGuide.light_Purple),
                ),
                SpinKitCircle(
                  color: UIGuide.light_Purple,
                  size: 50,
                )
              ],
            ),
          ),
        ));
  }

  //      Stack(
  //       children: [
  //         Consumer<FeesProvider>(
  //           builder: (context, value, child) => Stack(
  //             children: [
  //               ListView(
  //                 children: [
  //                   kheight20,
  //                   Padding(
  //                     padding: EdgeInsets.only(left: 20, bottom: 10),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         const Text(
  //                           'Installment',
  //                           style: TextStyle(
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.w900,
  //                               color: UIGuide.light_Purple),
  //                         ),
  //                         Consumer<FeesProvider>(
  //                             builder: (context, snap, child) {
  //                           //   child:
  //                           return Padding(
  //                             padding: const EdgeInsets.only(right: 20.0),
  //                             child: Checkbox(
  //                               value: snap.isselectAll,
  //                               onChanged: (bool? value) {
  //                                 setState(() {
  //                                   value = snap.isselectAll;
  //                                 });
  //                               },
  //                               //       },
  //                             ),
  //                           );
  //                         }),
  //                       ],
  //                     ),
  //                   ),
  //                   Scrollbar(
  //                     controller: _controller,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 20.0, right: 8),
  //                       child: LimitedBox(
  //                           maxHeight: 160,
  //                           child: Consumer<FeesProvider>(
  //                             builder: (context, value, child) =>
  //                                 ListView.builder(
  //                                     shrinkWrap: true,
  //                                     controller: _controller,
  //                                     itemCount: value.feeList.length == null
  //                                         ? 0
  //                                         : value.feeList.length,

  //                                     // feeResponse == null ? 0 : feeResponse!.length,
  //                                     itemBuilder:
  //                                         (BuildContext context, int index) {
  //                                       print(value.feeList.length);
  //                                       return CheckboxListTile(
  //                                         activeColor: const Color.fromARGB(
  //                                             255, 238, 236, 236),
  //                                         checkColor: UIGuide.light_Purple,
  //                                         selectedTileColor:
  //                                             UIGuide.light_Purple,
  //                                         value: value.selecteCategorys
  //                                             .contains(value.feeList[index]
  //                                                     .installmentName ??
  //                                                 '--'),
  //                                         onChanged: (bool? selected) async {
  //                                           value.onFeeSelected(
  //                                               selected!,
  //                                               value.feeList[index]
  //                                                   .installmentName,
  //                                               index,
  //                                               value.feeList[index].netDue);
  //                                         },
  //                                         title: Text(
  //                                           value.feeList[index].netDue == null
  //                                               ? '--'
  //                                               : value.feeList[index].netDue
  //                                                   .toString(),
  //                                           textAlign: TextAlign.end,
  //                                         ),
  //                                         secondary: Text(
  //                                           value.feeList[index]
  //                                                   .installmentName ??
  //                                               '--',
  //                                         ),
  //                                       );
  //                                     }),
  //                           )),
  //                     ),
  //                     thumbVisibility: true,
  //                     thickness: 6,
  //                     radius: Radius.circular(20),
  //                   ),
  //                   Consumer<FeesProvider>(
  //                     builder: (context, value, child) => Center(
  //                       child: Text(
  //                         'TotalFee:  ${value.totalFees}',
  //                         style: TextStyle(fontSize: 12),
  //                       ),
  //                     ),
  //                   ),
  //                   Consumer<FeesProvider>(
  //                     builder: (context, bus, child) {
  //                       if (bus.busFeeList.isNotEmpty) {
  //                         return Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           children: [
  //                             const Padding(
  //                               padding: EdgeInsets.only(
  //                                   left: 20, bottom: 10, top: 10),
  //                               child: Text(
  //                                 'Bus Fee',
  //                                 style: TextStyle(
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.w900,
  //                                     color: UIGuide.light_Purple),
  //                               ),
  //                             ),
  //                             Scrollbar(
  //                               controller: _controller2,
  //                               child: Padding(
  //                                 padding:
  //                                     const EdgeInsets.only(left: 20, right: 8),
  //                                 child: LimitedBox(
  //                                     maxHeight: 280,
  //                                     child: Consumer<FeesProvider>(
  //                                       builder: (context, value, child) =>
  //                                           ListView.builder(
  //                                               shrinkWrap: true,
  //                                               controller: _controller2,
  //                                               itemCount: value
  //                                                       .busFeeList.isEmpty
  //                                                   ? 0
  //                                                   : value.busFeeList.length,
  //                                               itemBuilder:
  //                                                   (BuildContext context,
  //                                                       int index) {
  //                                                 var list = [];
  //                                                 list.addAll([
  //                                                   value.busFeeList[index]
  //                                                 ]);
  //                                                 //  print(list);
  //                                                 bool? busEna;
  //                                                 return CheckboxListTile(
  //                                                   activeColor:
  //                                                       const Color.fromARGB(
  //                                                           255, 238, 236, 236),
  //                                                   checkColor:
  //                                                       UIGuide.light_Purple,
  //                                                   selectedTileColor:
  //                                                       UIGuide.light_Purple,
  //                                                   value: value.selectedBusFee
  //                                                       .contains(value
  //                                                           .busFeeList[index]
  //                                                           .installmentName),
  //                                                   onChanged: (selected) {
  //                                                     int i = 0;

  //                                                     if (index == 0 &&
  //                                                         selected == true) {
  //                                                       value.onBusSelected(
  //                                                           selected!,
  //                                                           value
  //                                                               .busFeeList[
  //                                                                   index]
  //                                                               .installmentName,
  //                                                           index,
  //                                                           value
  //                                                               .busFeeList[
  //                                                                   index]
  //                                                               .netDue);
  //                                                     }

  //                                                     print(selected);
  //                                                   },
  //                                                   title: Padding(
  //                                                     padding:
  //                                                         const EdgeInsets.only(
  //                                                             left: 75),
  //                                                     child: Text(
  //                                                       value.busFeeList[index]
  //                                                           .netDue
  //                                                           .toString(),
  //                                                       textAlign:
  //                                                           TextAlign.end,
  //                                                     ),
  //                                                   ),
  //                                                   secondary: Text(value
  //                                                           .busFeeList[index]
  //                                                           .installmentName ??
  //                                                       '--'),
  //                                                 );
  //                                               }),
  //                                     )),
  //                               ),
  //                               thumbVisibility: true,
  //                               thickness: 6,
  //                               radius: const Radius.circular(20),
  //                             ),
  //                             Consumer<FeesProvider>(
  //                               builder: (context, value, child) => Center(
  //                                 child: Text(
  //                                   'TotalBus fee :  ${value.totalBusFee}',
  //                                   style: TextStyle(fontSize: 12),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         );
  //                       } else {
  //                         return Container(
  //                           height: 0,
  //                           width: 0,
  //                         );
  //                       }
  //                     },
  //                   ),
  //                   kheight20,
  //                   kheight20,
  //                   Center(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const Text(
  //                           'Total : ',
  //                           style: TextStyle(
  //                               fontSize: 16, fontWeight: FontWeight.w700),
  //                         ),
  //                         // totalFee()
  //                         Consumer<FeesProvider>(
  //                             builder: (context, value, child) =>
  //                                 Text(value.total.toString()))
  //                       ],
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 40,
  //                   ),
  //                   GestureDetector(
  //                     child: const Text(
  //                       'Last Transaction Details',
  //                       style: TextStyle(
  //                         color: UIGuide.light_Purple,
  //                         decoration: TextDecoration.underline,
  //                         decorationStyle: TextDecorationStyle.dashed,
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                     onTap: () async {
  //                       _showAlert(context);
  //                     },
  //                   ),
  //                   const SizedBox(
  //                     height: 100,
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 child: value.loading ? spinkitLoader() : Container(),
  //               )
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //           bottom: 2,
  //           left: 10,
  //           right: 10,
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
  //             child: Consumer<FeesProvider>(
  //               builder: (_, trans, child) {
  //                 return MaterialButton(
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     side: BorderSide(color: UIGuide.THEME_LIGHT),
  //                   ),
  //                   height: 60,
  //                   onPressed: () async {
  //                     if (trans.total != 0) {
  //                       /////////////////////////////////////////////////////////////////////////
  //                       ////////////////////   get data of one             //////////////////////
  //                       /////////////////////////////////////////////////////////////////////////

  //                       if (trans.transactionList.length == 1) {
  //                         print('1111111111111111');
  //                         String transType =
  //                             trans.transactionList[0].name ?? '--';
  //                         String transId1 = trans.transactionList[0].id ?? '--';
  //                         String gateWay = trans.gateway ?? '--';
  //                         print(transType);
  //                         print(transId1);

  //                         await Provider.of<FeesProvider>(context,
  //                                 listen: false)
  //                             .getDataOne(
  //                                 transType,
  //                                 transId1,
  //                                 trans.totalFees.toString(),
  //                                 trans.total.toString(),
  //                                 gateWay);

  //                         await AwesomeDialog(
  //                           context: cont,
  //                           animType: AnimType.scale,
  //                           dialogType: DialogType.info,
  //                           title: 'Do you want to continue the payment',
  //                           desc:
  //                               "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
  //                           btnOkOnPress: () async {
  //                             String mid1 = trans.mid1 ?? '--';
  //                             String orderId1 = trans.txnorderId1 ?? '--';
  //                             String amount1 = trans.txnAmount1 ?? '--';
  //                             String txntoken = trans.txnToken1 ?? '';
  //                             print(txntoken);
  //                             String callbackURL1 = trans.callbackUrl1 ?? '--';
  //                             bool staging1 = trans.isStaging1 ?? true;

  //                             if (txntoken.isEmpty) {
  //                               ScaffoldMessenger.of(context).showSnackBar(
  //                                 const SnackBar(
  //                                   elevation: 10,
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius:
  //                                         BorderRadius.all(Radius.circular(10)),
  //                                   ),
  //                                   duration: Duration(seconds: 1),
  //                                   margin: EdgeInsets.only(
  //                                       bottom: 80, left: 30, right: 30),
  //                                   behavior: SnackBarBehavior.floating,
  //                                   content: Text(
  //                                     'Something went wrong...',
  //                                     textAlign: TextAlign.center,
  //                                   ),
  //                                 ),
  //                               );
  //                             } else {}
  //                           },
  //                           btnCancelOnPress: () {
  //                             Navigator.of(_scaffoldKey.currentContext!).pop();
  //                             //      Navigator.pop(context);
  //                           },
  //                         ).show();
  //                       }

  //                       /////////////////////////////////////////////////////////////////////////
  //                       ////////////////////   get data of two             //////////////////////
  //                       /////////////////////////////////////////////////////////////////////////

  //                       else if (trans.transactionList.length == 2) {
  //                         print('-------------22222222-------------------');

  //                         String transType1 =
  //                             trans.transactionList[0].name ?? '--';
  //                         String transType2 =
  //                             trans.transactionList[1].name ?? '--';
  //                         String transID1 = trans.transactionList[0].id ?? '--';
  //                         String transID2 = trans.transactionList[1].id ?? '--';
  //                         String gateway = trans.gateway ?? '--';
  //                         print(transType1);
  //                         print(transType2);
  //                         await Provider.of<FeesProvider>(context,
  //                                 listen: false)
  //                             .getDataTwo(
  //                                 transType1,
  //                                 transID1,
  //                                 trans.totalFees.toString(),
  //                                 transType2,
  //                                 transID2,
  //                                 trans.totalBusFee.toString(),
  //                                 trans.total.toString(),
  //                                 gateway.toString());

  //                         await AwesomeDialog(
  //                           context: context,
  //                           animType: AnimType.scale,
  //                           dialogType: DialogType.info,
  //                           title: 'Do you want to continue the payment',
  //                           desc:
  //                               "Please don't go 𝐁𝐚𝐜𝐤 once the payment has been initialized!",
  //                           btnOkOnPress: () async {
  //                             String mid2 = trans.mid2 ?? '--';
  //                             String orderId2 = trans.txnorderId2 ?? '--';
  //                             String amount2 = trans.txnAmount2 ?? '--';
  //                             String txntoken = trans.txnToken2 ?? '';
  //                             print(txntoken);
  //                             String callbackURL2 = trans.callbackUrl2 ?? '--';
  //                             bool staging2 = trans.isStaging2 ?? true;

  //                             if (txntoken.isEmpty) {
  //                               ScaffoldMessenger.of(context).showSnackBar(
  //                                 const SnackBar(
  //                                   elevation: 10,
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius:
  //                                         BorderRadius.all(Radius.circular(20)),
  //                                   ),
  //                                   duration: Duration(seconds: 1),
  //                                   margin: EdgeInsets.only(
  //                                       bottom: 80, left: 30, right: 30),
  //                                   behavior: SnackBarBehavior.floating,
  //                                   content: Text(
  //                                     'Something went wrong...',
  //                                     textAlign: TextAlign.center,
  //                                   ),
  //                                 ),
  //                               );
  //                             } else {}
  //                           },
  //                           btnCancelOnPress: () {
  //                             Navigator.of(_scaffoldKey.currentContext!).pop();
  //                             //      Navigator.pop(context);
  //                           },
  //                         ).show();
  //                       } else if (trans.transactionList.length == 0) {
  //                         ScaffoldMessenger.of(context).showSnackBar(
  //                           const SnackBar(
  //                             content: Text(
  //                               'Something Went Wrong.....!',
  //                               textAlign: TextAlign.center,
  //                             ),
  //                           ),
  //                         );
  //                       } else {
  //                         print(
  //                           trans.transactionList.length,
  //                         );
  //                         print('Something Went wrong');
  //                         ScaffoldMessenger.of(context).showSnackBar(
  //                           const SnackBar(
  //                             content: Text(
  //                               'Something Went Wrong.....!',
  //                               textAlign: TextAlign.center,
  //                             ),
  //                           ),
  //                         );
  //                       }
  //                     } else {
  //                       ScaffoldMessenger.of(context).showSnackBar(
  //                         const SnackBar(
  //                           elevation: 10,
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(20)),
  //                           ),
  //                           duration: Duration(seconds: 1),
  //                           margin: EdgeInsets.only(
  //                               bottom: 80, left: 30, right: 30),
  //                           behavior: SnackBarBehavior.floating,
  //                           content: Text(
  //                             'Select Fees.....!',
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         ),
  //                       );
  //                     }
  //                   },
  //                   child: const Text(
  //                     'Proceed to Pay',
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w800,
  //                         fontSize: 16),
  //                   ),
  //                   color: UIGuide.light_Purple,
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _showAlert(BuildContext context) {
  //   var size = MediaQuery.of(context).size;

  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => AlertDialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20)),
  //             content: Container(
  //               height: size.height / 4.5,
  //               width: size.width * 3,
  //               child: Stack(
  //                 clipBehavior: Clip.none,
  //                 alignment: AlignmentDirectional.center,
  //                 children: [
  //                   Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       SizedBox(
  //                         height: size.height / 10,
  //                       ),
  //                       const Text(
  //                         "TRANSACTION FAILED",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w800,
  //                             fontSize: 20,
  //                             color: UIGuide.light_Purple),
  //                       ),
  //                       kheight20,
  //                       Expanded(
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             ElevatedButton(
  //                                 style: ButtonStyle(
  //                                   backgroundColor: MaterialStateProperty.all(
  //                                       UIGuide.light_Purple),
  //                                 ),
  //                                 onPressed: () {
  //                                   Navigator.of(context).pushAndRemoveUntil(
  //                                       MaterialPageRoute(
  //                                           builder: (context) =>
  //                                               StudentHome()),
  //                                       (Route<dynamic> route) => false);
  //                                 },
  //                                 child: const Text(
  //                                   'Back to Home',
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.w800,
  //                                       fontSize: 18,
  //                                       color: UIGuide.WHITE),
  //                                 ))
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   Positioned(
  //                     top: -80,
  //                     child: CircleAvatar(
  //                         radius: 70,
  //                         backgroundColor: Colors.white,
  //                         child: SvgPicture.asset(UIGuide.success)),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ));
  // }
}
