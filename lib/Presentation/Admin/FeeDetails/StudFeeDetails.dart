import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../Application/AdminProviders/FeeDetailsProvider.dart';
import '../../../utils/constants.dart';

class StudFeeDetails extends StatefulWidget {
  //SearchStudReport stud;
  String studid;
  String name;
  String roll;
  String division;
  StudFeeDetails(
      {Key? key,
      required this.studid,
      required this.name,
      required this.roll,
      required this.division})
      : super(key: key);

  @override
  State<StudFeeDetails> createState() => _StudFeeDetailsState();
}

class _StudFeeDetailsState extends State<StudFeeDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<FeeDetailsProvider>(context, listen: false)
          .generalPaidListClear();
      await Provider.of<FeeDetailsProvider>(context, listen: false)
          .busPaidListClear();
      await Provider.of<FeeDetailsProvider>(context, listen: false)
          .generalDueListClear();
      await Provider.of<FeeDetailsProvider>(context, listen: false)
          .busDueListClear();
      await Provider.of<FeeDetailsProvider>(context, listen: false)
          .getFeeDetails(widget.studid);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Fee Report'),
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 50.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Consumer<FeeDetailsProvider>(builder: (context, value, child) {
          return value.load
              ? const spinkitLoader()
              : Consumer<FeeDetailsProvider>(
                  builder: (context, list, child) {
                    return list.generalFeeDueList.isEmpty &&
                            list.generalFeePaidList.isEmpty &&
                            list.busFeeDueList.isEmpty &&
                            list.busFeePaidList.isEmpty
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: size.height / 2,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png'),
                                  fit: BoxFit.fill,
                                ))),
                          ))
                        : Scrollbar(
                            thickness: 5,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 228, 224, 224),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Name : ',
                                              ),
                                              Text(
                                                widget.name == null
                                                    ? '--'
                                                    : widget.name.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Division : ',
                                              ),
                                              Text(
                                                widget.division == null
                                                    ? '--'
                                                    : widget.division
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Roll No : ',
                                                  ),
                                                  Text(
                                                    widget.roll == null
                                                        ? '--'
                                                        : widget.roll
                                                            .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                kheight10,
                                Consumer<FeeDetailsProvider>(
                                  builder: (context, due, child) {
                                    return due.generalFeeDueList.isEmpty &&
                                            due.busFeeDueList.isEmpty
                                        ? Container(
                                            height: 0,
                                            width: 0,
                                          )
                                        : SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const Center(
                                                  child: Text(
                                                    'FeeDue List',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          style: BorderStyle
                                                              .solid)),
                                                  width: size.width,
                                                  child: Column(
                                                    children: [
                                                      Consumer<
                                                          FeeDetailsProvider>(
                                                        builder: (context,
                                                            school, child) {
                                                          return school
                                                                  .generalFeeDueList
                                                                  .isEmpty
                                                              ? Container(
                                                                  height: 0,
                                                                  width: 0,
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    Container(
                                                                      width: size
                                                                          .width,
                                                                      color: UIGuide
                                                                          .THEME_LIGHT,
                                                                      child:
                                                                          const Text(
                                                                        'School Fees',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                    Table(
                                                                      columnWidths: const {
                                                                        0: FlexColumnWidth(
                                                                            3),
                                                                        1: FlexColumnWidth(
                                                                            4),
                                                                        2: FlexColumnWidth(
                                                                            4),
                                                                        3: FlexColumnWidth(
                                                                            4),
                                                                      },
                                                                      children: const [
                                                                        TableRow(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color.fromARGB(255, 228, 224, 224),
                                                                            ),
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Installment',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Fine',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'NetDue',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Paid Amount',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                            ]),
                                                                      ],
                                                                    ),
                                                                    Consumer<
                                                                        FeeDetailsProvider>(
                                                                      builder: (context, general, child) => ListView.builder(
                                                                          shrinkWrap: true,
                                                                          itemCount: general.generalFeeDueList.isEmpty ? 0 : general.generalFeeDueList.length,
                                                                          itemBuilder: ((context, index) {
                                                                            return Table(
                                                                              columnWidths: const {
                                                                                0: FlexColumnWidth(3),
                                                                                1: FlexColumnWidth(4),
                                                                                2: FlexColumnWidth(4),
                                                                                3: FlexColumnWidth(4),
                                                                              },
                                                                              children: [
                                                                                TableRow(
                                                                                    decoration: const BoxDecoration(
                                                                                      //  border: Border.all(),
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          general.generalFeeDueList[index].installmentName ?? '--',
                                                                                          style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                        )),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          general.generalFeeDueList[index].fineAmount == null ? '--' : general.generalFeeDueList[index].fineAmount.toString(),
                                                                                          style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                        )),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          general.generalFeeDueList[index].netDue == null ? '--' : general.generalFeeDueList[index].netDue.toString(),
                                                                                          style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                        )),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          general.generalFeeDueList[index].paidAmount == null ? '--' : general.generalFeeDueList[index].paidAmount.toString(),
                                                                                          style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                        )),
                                                                                      ),
                                                                                    ]),
                                                                              ],
                                                                            );
                                                                          })),
                                                                    ),
                                                                  ],
                                                                );
                                                        },
                                                      ),
                                                      kheight10,
                                                      Consumer<
                                                          FeeDetailsProvider>(
                                                        builder: (context, bus,
                                                            child) {
                                                          return bus
                                                                  .busFeeDueList
                                                                  .isEmpty
                                                              ? Container(
                                                                  height: 0,
                                                                  width: 0,
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    Container(
                                                                      width: size
                                                                          .width,
                                                                      color: UIGuide
                                                                          .THEME_LIGHT,
                                                                      child:
                                                                          const Text(
                                                                        'Bus Fees',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                    Table(
                                                                      columnWidths: const {
                                                                        0: FlexColumnWidth(
                                                                            3),
                                                                        1: FlexColumnWidth(
                                                                            4),
                                                                        2: FlexColumnWidth(
                                                                            4),
                                                                        3: FlexColumnWidth(
                                                                            4),
                                                                      },
                                                                      children: const [
                                                                        TableRow(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color.fromARGB(255, 228, 224, 224),
                                                                            ),
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Installment',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Fine',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'NetDue',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Paid Amount',
                                                                                  style: TextStyle(fontWeight: FontWeight.w500),
                                                                                )),
                                                                              ),
                                                                            ]),
                                                                      ],
                                                                    ),
                                                                    Consumer<
                                                                        FeeDetailsProvider>(
                                                                      builder: (context, busfee, child) => ListView.builder(
                                                                          shrinkWrap: true,
                                                                          itemCount: busfee.busFeeDueList.isEmpty ? 0 : busfee.busFeeDueList.length,
                                                                          itemBuilder: ((context, index) {
                                                                            return LimitedBox(
                                                                              maxHeight: 30,
                                                                              child: Table(
                                                                                columnWidths: const {
                                                                                  0: FlexColumnWidth(3),
                                                                                  1: FlexColumnWidth(4),
                                                                                  2: FlexColumnWidth(4),
                                                                                  3: FlexColumnWidth(4),
                                                                                },
                                                                                children: [
                                                                                  TableRow(
                                                                                      decoration: const BoxDecoration(
                                                                                        //  border: Border.all(),
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          height: 30,
                                                                                          child: Center(
                                                                                              child: Text(
                                                                                            busfee.busFeeDueList[index].installmentName ?? '--',
                                                                                            style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                          )),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 30,
                                                                                          child: Center(
                                                                                              child: Text(
                                                                                            busfee.busFeeDueList[index].fineAmount == null ? '--' : busfee.busFeeDueList[index].fineAmount.toString(),
                                                                                            style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                          )),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 30,
                                                                                          child: Center(
                                                                                              child: Text(
                                                                                            busfee.busFeeDueList[index].netDue == null ? '--' : busfee.busFeeDueList[index].netDue.toString(),
                                                                                            style: const TextStyle(fontWeight: FontWeight.w500),
                                                                                          )),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 30,
                                                                                          child: Center(
                                                                                              child: Text(
                                                                                            '0.00',
                                                                                            style: TextStyle(fontWeight: FontWeight.w500),
                                                                                          )),
                                                                                        ),
                                                                                      ]),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          })),
                                                                    ),
                                                                  ],
                                                                );
                                                        },
                                                      ),
                                                      Consumer<
                                                          FeeDetailsProvider>(
                                                        builder: (context,
                                                                value, child) =>
                                                            Container(
                                                                width:
                                                                    size.width,
                                                                height: 20,
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    228,
                                                                    224,
                                                                    224),
                                                                child: Table(
                                                                  columnWidths: const {
                                                                    0: FlexColumnWidth(
                                                                        3),
                                                                    1: FlexColumnWidth(
                                                                        4),
                                                                    2: FlexColumnWidth(
                                                                        4),
                                                                    3: FlexColumnWidth(
                                                                        4),
                                                                  },
                                                                  children: [
                                                                    TableRow(
                                                                        children: [
                                                                          const Text(
                                                                            'Net Total',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            value.allTotalDueFineAmount == null
                                                                                ? '--'
                                                                                : value.allTotalDueFineAmount.toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                const TextStyle(fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            value.allTotalDueNetDueAmount == null
                                                                                ? '--'
                                                                                : value.allTotalDueNetDueAmount.toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                const TextStyle(fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            value.allTotalDuePaidAmount == null
                                                                                ? '--'
                                                                                : value.allTotalDuePaidAmount.toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                const TextStyle(fontWeight: FontWeight.w700),
                                                                          )
                                                                        ])
                                                                  ],
                                                                )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                  },
                                ),
                                kheight20,
                                Consumer<FeeDetailsProvider>(
                                  builder: (context, paid, child) {
                                    return paid.generalFeePaidList.isEmpty &&
                                            paid.busFeePaidList.isEmpty
                                        ? Container(
                                            height: 0,
                                            width: 0,
                                          )
                                        : SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const Center(
                                                  child: Text(
                                                    'Fee Paid Details',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Container(
                                                  width: size.width,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          style: BorderStyle
                                                              .solid)),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: size.width,
                                                        height: 28,
                                                        color:
                                                            UIGuide.THEME_LIGHT,
                                                        child: const Center(
                                                          child: Text(
                                                            'School Fees',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                      ),

                                                      LimitedBox(
                                                        maxHeight: 250,
                                                        child: Consumer<
                                                            FeeDetailsProvider>(
                                                          builder: (context,
                                                                  generalPaid,
                                                                  child) =>
                                                              ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: generalPaid
                                                                    .generalFeePaidList
                                                                    .isEmpty
                                                                ? 0
                                                                : generalPaid
                                                                    .generalFeePaidList
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    indexx) {
                                                              String date = generalPaid
                                                                      .generalFeePaidList[
                                                                          indexx]
                                                                      .billDate ??
                                                                  '--';
                                                              var updatedDate =
                                                                  DateFormat(
                                                                          'yyyy-MM-dd')
                                                                      .parse(
                                                                          date);
                                                              String newDate =
                                                                  updatedDate
                                                                      .toString();
                                                              String finalDate =
                                                                  newDate
                                                                      .replaceRange(
                                                                          10,
                                                                          23,
                                                                          '');
                                                              print(
                                                                  updatedDate);
                                                              print(finalDate);

                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: UIGuide
                                                                              .light_Purple),
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                      color: UIGuide
                                                                          .WHITE),
                                                                  height: 63,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            const Text(
                                                                              'Date: ',
                                                                              style: TextStyle(color: UIGuide.light_Purple),
                                                                            ),
                                                                            Text(
                                                                              finalDate.isEmpty ? '--' : finalDate,
                                                                            ),
                                                                            const Spacer(),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Dialog(
                                                                                          child: Container(
                                                                                        child: SingleChildScrollView(
                                                                                          scrollDirection: Axis.vertical,
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              ListView.builder(
                                                                                                  shrinkWrap: true,
                                                                                                  itemCount: generalPaid.generalFeePaidList[indexx].schoolFees!.isEmpty ? 0 : generalPaid.generalFeePaidList[indexx].schoolFees!.length,
                                                                                                  itemBuilder: (context, index) {
                                                                                                    return Padding(
                                                                                                      padding: const EdgeInsets.all(3.0),
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(border: Border.all(color: UIGuide.light_Purple), borderRadius: const BorderRadius.all(Radius.circular(10)), color: UIGuide.WHITE),
                                                                                                        height: 90,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.only(left: 8.0),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                children: [
                                                                                                                  const Text('Installment Name: '),
                                                                                                                  Flexible(
                                                                                                                    child: RichText(
                                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                                      strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                      text: TextSpan(
                                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                                        text: generalPaid.generalFeePaidList[indexx].schoolFees![index].installmentname ?? '--',
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                height: 2,
                                                                                                              ),
                                                                                                              Row(
                                                                                                                children: [
                                                                                                                  const Text('Due Amount: '),
                                                                                                                  Flexible(
                                                                                                                    child: RichText(
                                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                                      strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                      text: TextSpan(
                                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                                        text: generalPaid.generalFeePaidList[indexx].schoolFees![index].dueAmount == null ? '0.00' : generalPaid.generalFeePaidList[indexx].schoolFees![index].dueAmount.toString(),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                height: 2,
                                                                                                              ),
                                                                                                              Row(
                                                                                                                children: [
                                                                                                                  const Text('Concession Amount: '),
                                                                                                                  Flexible(
                                                                                                                    child: RichText(
                                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                                      strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                      text: TextSpan(
                                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                                        text: generalPaid.generalFeePaidList[indexx].schoolFees![index].concessionAmount == null ? '0.00' : generalPaid.generalFeePaidList[indexx].schoolFees![index].concessionAmount.toString(),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                height: 2,
                                                                                                              ),
                                                                                                              Row(
                                                                                                                children: [
                                                                                                                  const Text('Fine Amount: '),
                                                                                                                  Flexible(
                                                                                                                    child: RichText(
                                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                                      strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                      text: TextSpan(
                                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                                        text: generalPaid.generalFeePaidList[indexx].schoolFees![index].fineAmount == null ? '0.00' : generalPaid.generalFeePaidList[indexx].schoolFees![index].fineAmount.toString(),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                height: 2,
                                                                                                              ),
                                                                                                              Row(
                                                                                                                children: [
                                                                                                                  const Text('Total Paid: '),
                                                                                                                  Flexible(
                                                                                                                    child: RichText(
                                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                                      strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                      text: TextSpan(
                                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                                        text: generalPaid.generalFeePaidList[indexx].schoolFees![index].totalPaidAmount == null ? '0.00' : generalPaid.generalFeePaidList[indexx].schoolFees![index].totalPaidAmount.toString(),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ));
                                                                                    });
                                                                              },
                                                                              child: const Icon(
                                                                                Icons.info_outline_rounded,
                                                                                //  size: 13,
                                                                              ),
                                                                            ),
                                                                            kWidth,
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            const Text(
                                                                              'Txn ID: ',
                                                                              style: TextStyle(color: UIGuide.light_Purple),
                                                                            ),
                                                                            Flexible(
                                                                              child: RichText(
                                                                                overflow: TextOverflow.ellipsis,
                                                                                strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                text: TextSpan(style: const TextStyle(color: Colors.black), text: generalPaid.generalFeePaidList[indexx].transactionId ?? '--'),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              2,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            const Text(
                                                                              'Paid Amount: ',
                                                                              style: TextStyle(color: UIGuide.light_Purple),
                                                                            ),
                                                                            Text(
                                                                              generalPaid.generalFeePaidList[indexx].totalPaidAmount == null ? "0.00" : generalPaid.generalFeePaidList[indexx].totalPaidAmount.toString(),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                      ///Bus fee
                                                      kheight10,
                                                      Consumer<
                                                          FeeDetailsProvider>(
                                                        builder: (context,
                                                            busPaid, child) {
                                                          return busPaid
                                                                  .busFeePaidList
                                                                  .isEmpty
                                                              ? Container(
                                                                  height: 0,
                                                                  width: 0,
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    Container(
                                                                      width: size
                                                                          .width,
                                                                      height:
                                                                          28,
                                                                      color: UIGuide
                                                                          .THEME_LIGHT,
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Text(
                                                                          'Bus Fees',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    LimitedBox(
                                                                      maxHeight:
                                                                          250,
                                                                      child: Consumer<
                                                                          FeeDetailsProvider>(
                                                                        builder: (context,
                                                                                busFeePaidList,
                                                                                child) =>
                                                                            ListView.builder(
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: busPaid.busFeePaidList.isEmpty
                                                                              ? 0
                                                                              : busPaid.busFeePaidList.length,
                                                                          itemBuilder:
                                                                              (context, indexx) {
                                                                            String
                                                                                date =
                                                                                busPaid.busFeePaidList[indexx].billDate ?? '--';
                                                                            var updatedDate =
                                                                                DateFormat('yyyy-MM-dd').parse(date);
                                                                            String
                                                                                newDate =
                                                                                updatedDate.toString();
                                                                            String
                                                                                finalDate =
                                                                                newDate.replaceRange(10, 23, '');
                                                                            print(updatedDate);
                                                                            print(finalDate);

                                                                            return Padding(
                                                                              padding: const EdgeInsets.all(4.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(border: Border.all(color: UIGuide.light_Purple), borderRadius: const BorderRadius.all(Radius.circular(10)), color: UIGuide.WHITE),
                                                                                height: 60,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(left: 8.0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          const Text(
                                                                                            'Date: ',
                                                                                            style: TextStyle(color: UIGuide.light_Purple),
                                                                                          ),
                                                                                          Text(
                                                                                            finalDate.isEmpty ? '--' : finalDate,
                                                                                          ),
                                                                                          const Spacer(),
                                                                                          GestureDetector(
                                                                                            onTap: () {
                                                                                              showDialog(
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return Dialog(
                                                                                                        child: Container(
                                                                                                      child: SingleChildScrollView(
                                                                                                        scrollDirection: Axis.vertical,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: [
                                                                                                            ListView.builder(
                                                                                                                shrinkWrap: true,
                                                                                                                itemCount: busPaid.busFeePaidList[indexx].busFees!.isEmpty ? 0 : busPaid.busFeePaidList[indexx].busFees!.length,
                                                                                                                itemBuilder: (context, index) {
                                                                                                                  return Padding(
                                                                                                                    padding: const EdgeInsets.all(3.0),
                                                                                                                    child: Container(
                                                                                                                      decoration: BoxDecoration(border: Border.all(color: UIGuide.light_Purple), borderRadius: const BorderRadius.all(Radius.circular(10)), color: UIGuide.WHITE),
                                                                                                                      height: 70,
                                                                                                                      child: Padding(
                                                                                                                        padding: const EdgeInsets.only(left: 4.0),
                                                                                                                        child: Column(
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                const Text('Installment Name: '),
                                                                                                                                Flexible(
                                                                                                                                  child: RichText(
                                                                                                                                    overflow: TextOverflow.ellipsis,
                                                                                                                                    strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                                    text: TextSpan(
                                                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                                                      text: busPaid.busFeePaidList[indexx].busFees![index].installmentname ?? '--',
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            const SizedBox(
                                                                                                                              height: 2,
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                const Text('Due Amount: '),
                                                                                                                                Flexible(
                                                                                                                                  child: RichText(
                                                                                                                                    overflow: TextOverflow.ellipsis,
                                                                                                                                    strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                                    text: TextSpan(
                                                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                                                      text: busPaid.busFeePaidList[indexx].busFees![index].dueAmount == null ? '--' : busPaid.busFeePaidList[indexx].busFees![index].dueAmount.toString(),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            const SizedBox(
                                                                                                                              height: 2,
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                const Text('Fine Amount: '),
                                                                                                                                Flexible(
                                                                                                                                  child: RichText(
                                                                                                                                    overflow: TextOverflow.ellipsis,
                                                                                                                                    strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                                    text: TextSpan(
                                                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                                                      text: busPaid.busFeePaidList[indexx].busFees![index].fineAmount == null ? '--' : busPaid.busFeePaidList[indexx].busFees![index].fineAmount.toString(),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            const SizedBox(
                                                                                                                              height: 2,
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                const Text('Total Paid: '),
                                                                                                                                Flexible(
                                                                                                                                  child: RichText(
                                                                                                                                    overflow: TextOverflow.ellipsis,
                                                                                                                                    strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                                                                    text: TextSpan(
                                                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                                                      text: busPaid.busFeePaidList[indexx].busFees![index].totalPaidAmount == null ? '--' : busPaid.busFeePaidList[indexx].busFees![index].totalPaidAmount.toString(),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ));
                                                                                                  });
                                                                                            },
                                                                                            child: const Icon(
                                                                                              Icons.info_outline_rounded,
                                                                                            ),
                                                                                          ),
                                                                                          kWidth,
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          const Text(
                                                                                            'Txn ID: ',
                                                                                            style: TextStyle(color: UIGuide.light_Purple),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: RichText(
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              strutStyle: const StrutStyle(fontSize: 12.0),
                                                                                              text: TextSpan(style: const TextStyle(color: Colors.black), text: busPaid.busFeePaidList[indexx].billDate ?? '--'),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 2,
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          const Text(
                                                                                            'Paid Amount: ',
                                                                                            style: TextStyle(color: UIGuide.light_Purple),
                                                                                          ),
                                                                                          Text(
                                                                                            busPaid.busFeePaidList[indexx].totalPaidAmount == null ? "0.00" : busPaid.busFeePaidList[indexx].totalPaidAmount.toString(),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                        },
                                                      ),
                                                      Container(
                                                        width: size.width,
                                                        height: 20,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 228, 227, 228),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            const Text(
                                                              'Total PaidAmount :',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            kWidth,
                                                            kWidth,
                                                            Consumer<
                                                                FeeDetailsProvider>(
                                                              builder: (context,
                                                                      value,
                                                                      child) =>
                                                                  Text(
                                                                value.allPaidAmount ==
                                                                        null
                                                                    ? '--'
                                                                    : value
                                                                        .allPaidAmount
                                                                        .toString(),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900),
                                                              ),
                                                            ),
                                                            kWidth,
                                                            kWidth,
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                  },
                                ),
                                kheight20,
                                kheight10
                              ],
                            ),
                          );
                  },
                );
        }),
      ),
    );
  }
}
