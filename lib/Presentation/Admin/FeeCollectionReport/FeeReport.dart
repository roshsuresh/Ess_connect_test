import 'package:Ess_test/Application/AdminProviders/FeeReportProvider.dart';
import 'package:Ess_test/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Domain/Staff/StudentReport_staff.dart';
import '../../../utils/constants.dart';

class FeeReport extends StatefulWidget {
  const FeeReport({Key? key}) : super(key: key);

  @override
  State<FeeReport> createState() => _FeeReportState();
}

class _FeeReportState extends State<FeeReport> {
  DateTime? _mydatetimeFrom;
  DateTime? _mydatetimeTo;
  List subjectData = [];
  List diviData = [];
  String time = '--';
  String timeNow = '--';
  String course = '';
  String section = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
      p.stdReportSectionStaff();
      p.courseDrop.clear();
      var c = Provider.of<FeeReportProvider>(context, listen: false);
      c.clearcollectionList();

      p.dropDown.clear();
      p.stdReportInitialValues.clear();
      p.courselist.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Collection Report'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Consumer<SchoolPhotoProviders>(
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: size.width * .42,
                    height: 50,
                    child: MultiSelectDialogField(
                      // height: 200,
                      items: value.dropDown,

                      listType: MultiSelectListType.CHIP,
                      title: const Text(
                        "Select Section",
                        style: TextStyle(color: Colors.grey),
                      ),
                      selectedItemsTextStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: UIGuide.light_Purple),
                      confirmText: Text(
                        'OK',
                        style: TextStyle(color: UIGuide.light_Purple),
                      ),
                      cancelText: Text(
                        'Cancel',
                        style: TextStyle(color: UIGuide.light_Purple),
                      ),
                      separateSelectedItems: true,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.grey,
                      ),
                      buttonText: Text(
                        "Select Section",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      chipDisplay: MultiSelectChipDisplay.none(),
                      onConfirm: (results) async {
                        subjectData = [];
                        for (var i = 0; i < results.length; i++) {
                          StudReportSectionList data =
                              results[i] as StudReportSectionList;
                          print(data.text);
                          print(data.value);
                          subjectData.add(data.value);
                          subjectData.map((e) => data.value);
                          print("${subjectData.map((e) => data.value)}");
                        }
                        section = subjectData.join('&');
                        await Provider.of<SchoolPhotoProviders>(context,
                                listen: false)
                            .getCourseList(section);
                        print("data $subjectData");

                        print(subjectData.join('&'));
                      },
                    ),
                  ),
                ),
              ),
              Spacer(),
              Consumer<SchoolPhotoProviders>(
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: size.width * .42,
                    height: 50,
                    child: MultiSelectDialogField(
                      // height: 200,
                      items: value.courseDrop,
                      listType: MultiSelectListType.CHIP,
                      title: const Text(
                        "Select Course",
                        style: TextStyle(color: Colors.black),
                      ),
                      // selectedColor: Color.fromARGB(255, 157, 232, 241),
                      selectedItemsTextStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: UIGuide.light_Purple),
                      confirmText: Text(
                        'OK',
                        style: TextStyle(color: UIGuide.light_Purple),
                      ),
                      cancelText: Text(
                        'Cancel',
                        style: TextStyle(color: UIGuide.light_Purple),
                      ),
                      separateSelectedItems: true,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.grey,
                      ),
                      buttonText: Text(
                        "Select Course",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      chipDisplay: MultiSelectChipDisplay.none(),
                      onConfirm: (results) async {
                        diviData = [];
                        for (var i = 0; i < results.length; i++) {
                          StudReportCourse data =
                              results[i] as StudReportCourse;
                          print(data.value);
                          print(data.text);
                          diviData.add(data.value);
                          diviData.map((e) => data.value);
                          print("${diviData.map((e) => data.value)}");
                        }
                        course = diviData.join('&');
                        await Provider.of<SchoolPhotoProviders>(context,
                                listen: false)
                            .getDivisionList(course);

                        print(diviData.join('&'));
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            'From Date and To date should not exceed 30 days',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11.5, color: Color.fromARGB(255, 241, 128, 128)),
          ),
          Row(
            children: [
              MaterialButton(
                minWidth: size.width - 230,
                child: Center(child: Text('From ${time}')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeFrom = await showDatePicker(
                      context: context,
                      initialDate: _mydatetimeFrom ?? DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030));
                  setState(() {
                    time = DateFormat('dd-MMM-yyyy').format(_mydatetimeFrom!);
                    print(time);
                  });
                }),
              ),
              Spacer(),
              MaterialButton(
                minWidth: size.width - 230,
                child: Center(child: Text('To ${timeNow}')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeTo = await showDatePicker(
                      context: context,
                      initialDate: _mydatetimeTo ?? DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030));
                  setState(() {
                    timeNow = DateFormat('dd-MMM-yyyy').format(_mydatetimeTo!);
                    print(timeNow);
                  });
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'View',
                  style: TextStyle(color: Colors.white),
                ),
                style:
                    TextButton.styleFrom(backgroundColor: UIGuide.light_Purple),
                onPressed: (() async {
                  // Provider.of<SchoolPhotoProviders>(context, listen: false)
                  //     .stdReportInitialValues
                  //     .clear();
                  // Provider.of<SchoolPhotoProviders>(context, listen: false)
                  //     .courselist
                  //     .clear();
                  // Provider.of<SchoolPhotoProviders>(context, listen: false)
                  //     .divisionDrop
                  //     .clear();
                  await Provider.of<FeeReportProvider>(context, listen: false)
                      .clearcollectionList();
                  await Provider.of<FeeReportProvider>(context, listen: false)
                      .getFeeReportView(section, course, time, timeNow);
                }),
              ),
            ],
          ),
          kheight20,
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(0.8),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2.5),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(1),
              },
              border:
                  TableBorder.all(color: Color.fromARGB(255, 216, 214, 214)),
              children: const [
                TableRow(
                    decoration: BoxDecoration(
                      //  border: Border.all(),
                      color: Color.fromARGB(255, 226, 230, 241),
                    ),
                    children: [
                      Center(
                        child: Text(
                          ('Sl\nNo.'),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Text(
                          ('Date'),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Text(
                          ('Name'),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Text(
                          ('Remitted\nFee'),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Text(
                          ('Details'),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ])
              ],
            ),
          ),
          Consumer<FeeReportProvider>(
            builder: (context, value, child) => value.loading
                ? const spinkitLoader()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.collectionList.isEmpty
                        ? 0
                        : value.collectionList.length,
                    itemBuilder: ((context, index) {
                      String date =
                          value.collectionList[index].remittedDate ?? '--';

                      var updatedDate = DateFormat('yyyy-MM-dd').parse(date);
                      String studID =
                          value.collectionList[index].studentId ?? '';
                      String FeeID =
                          value.collectionList[index].feeCollectionId ?? '';
                      String busID =
                          value.collectionList[index].busFeeCollectionId ?? '';
                      var newdate =
                          updatedDate.toString().replaceRange(10, 23, '');
                      print(updatedDate);

                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Table(
                          border: TableBorder.all(
                              color: Color.fromARGB(255, 245, 243, 243)),
                          columnWidths: const {
                            0: FlexColumnWidth(0.8),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(2.5),
                            3: FlexColumnWidth(2),
                            4: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(children: [
                              SizedBox(
                                child: Text(
                                  (index + 1).toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Center(
                                child: Text(
                                  newdate.isEmpty ? '----' : newdate
                                  // value.collectionList[index].remittedDate ??
                                  ,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Center(
                                child: Text(
                                  value.collectionList[index].name ?? '--',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Center(
                                child: Text(
                                  value.collectionList[index].remittedFees ==
                                          null
                                      ? '---'
                                      : value.collectionList[index].remittedFees
                                          .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Consumer<FeeReportProvider>(
                                builder: (context, value, child) =>
                                    GestureDetector(
                                  onTap: () async {
                                    value.generalList.clear();
                                    value.busFeeList.clear();
                                    await Provider.of<FeeReportProvider>(
                                            context,
                                            listen: false)
                                        .getAttachmentView(
                                            studID, FeeID, busID);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                              child: LimitedBox(
                                            maxHeight: size.height - 300,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Name: ',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Flexible(
                                                        child: RichText(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          strutStyle:
                                                              StrutStyle(
                                                                  fontSize:
                                                                      13.0),
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  color: UIGuide
                                                                      .light_Purple,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              text:
                                                                  value.name ??
                                                                      '---'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Adm No: ',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        value.admissionNo ??
                                                            '---',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: UIGuide
                                                                .light_Purple),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Division: ',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        value.division ?? '---',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: UIGuide
                                                                .light_Purple),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Date: ',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        value.transactionDate ??
                                                            '---',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: UIGuide
                                                                .light_Purple),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Order Id: ',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Flexible(
                                                        child: RichText(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          strutStyle:
                                                              StrutStyle(
                                                                  fontSize:
                                                                      13.0),
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  color: UIGuide
                                                                      .light_Purple,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              text: value
                                                                      .orderId ??
                                                                  '---'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Transaction Id: ',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Flexible(
                                                        child: RichText(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          strutStyle:
                                                              StrutStyle(
                                                                  fontSize:
                                                                      13.0),
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  color: UIGuide
                                                                      .light_Purple,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                              text: value
                                                                      .transactionId ??
                                                                  '---'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                kheight10,
                                                Consumer<FeeReportProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                    if (provider
                                                        .generalList.isEmpty) {
                                                      return Container();
                                                    } else if (provider
                                                        .generalList
                                                        .isNotEmpty) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: UIGuide
                                                                      .light_Purple,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Column(
                                                            children: [
                                                              const Text(
                                                                'School Fees',
                                                                style: TextStyle(
                                                                    color: UIGuide
                                                                        .light_Purple,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    decorationStyle:
                                                                        TextDecorationStyle
                                                                            .dotted,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              LimitedBox(
                                                                maxHeight: 150,
                                                                child: Consumer<
                                                                    FeeReportProvider>(
                                                                  builder: (context,
                                                                          value,
                                                                          child) =>
                                                                      ListView.builder(
                                                                          itemCount: value.generalList.isEmpty ? 0 : value.generalList.length,
                                                                          shrinkWrap: true,
                                                                          itemBuilder: ((context, index) {
                                                                            return Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 16.0),
                                                                                  child: Text(
                                                                                    value.generalList[index].installmentname ?? '--',
                                                                                    style: TextStyle(color: UIGuide.light_Purple),
                                                                                  ),
                                                                                ),
                                                                                ListTile(
                                                                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                                                                  title: Text('Amount to be Paid'),
                                                                                  trailing: Text(
                                                                                    value.generalList[index].netDue.toString(),
                                                                                  ),
                                                                                ),
                                                                                ListTile(
                                                                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                                                                  title: Text('Paid Amount'),
                                                                                  trailing: Text(
                                                                                    value.generalList[index].paidAmount.toString(),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            );
                                                                          })),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    return Text(' ');
                                                  },
                                                ),
                                                kheight10,
                                                Consumer<FeeReportProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                    if (provider
                                                        .busFeeList.isEmpty) {
                                                      return Container();
                                                    } else if (provider
                                                        .busFeeList
                                                        .isNotEmpty) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: UIGuide
                                                                      .light_Purple,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Consumer<
                                                              FeeReportProvider>(
                                                            builder: (context,
                                                                    value,
                                                                    child) =>
                                                                Column(
                                                              children: [
                                                                const Text(
                                                                  'Bus Fees',
                                                                  style: TextStyle(
                                                                      color: UIGuide
                                                                          .light_Purple,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      decorationStyle:
                                                                          TextDecorationStyle
                                                                              .dotted,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                                LimitedBox(
                                                                  maxHeight:
                                                                      150,
                                                                  child: ListView
                                                                      .builder(
                                                                          itemCount: value.busFeeList.isEmpty
                                                                              ? 0
                                                                              : value
                                                                                  .busFeeList.length,
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemBuilder:
                                                                              ((context, index) {
                                                                            return Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 16.0),
                                                                                  child: Text(
                                                                                    value.busFeeList[index].installmentname.toString(),
                                                                                    style: TextStyle(color: UIGuide.light_Purple),
                                                                                  ),
                                                                                ),
                                                                                ListTile(
                                                                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                                                                  horizontalTitleGap: 0,
                                                                                  title: Text('Amount to be Paid'),
                                                                                  trailing: Text(
                                                                                    value.busFeeList[index].netDue.toString(),
                                                                                  ),
                                                                                ),
                                                                                ListTile(
                                                                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                                                                  title: Text('Paid Amount'),
                                                                                  trailing: Text(
                                                                                    value.busFeeList[index].paidAmount.toString(),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            );
                                                                          })),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    return Text(' ');
                                                  },
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: SizedBox(
                                                        width: 70,
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          color: UIGuide
                                                              .light_Purple,
                                                          child: const Text(
                                                            "OK",
                                                            style: TextStyle(
                                                                color: UIGuide
                                                                    .WHITE,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ));
                                        });
                                  },
                                  child: Icon(
                                    Icons.receipt,
                                    size: 18,
                                  ),
                                ),
                              )
                            ])
                          ],
                        ),
                      );
                    })),
          ),
          Consumer<FeeReportProvider>(
            builder: (context, value, child) => Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total:  ",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                Text(
                  value.allTotal.toString() == null
                      ? '---'
                      : value.allTotal.toString(),
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
