import 'package:Ess_test/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:Ess_test/Application/AdminProviders/StudstattiticsProvider.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Domain/Staff/StudentReport_staff.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class Student_statistics_admin extends StatelessWidget {
  Student_statistics_admin({Key? key}) : super(key: key);
  String course = '';
  String section = '';
  List subjectData = [];
  List diviData = [];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
      p.stdReportSectionStaff();
      p.courseDrop.clear();
      p.dropDown.clear();
      p.stdReportInitialValues.clear();
      p.courselist.clear();
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Statistics'),
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
                          section = subjectData.join(',');
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .courseDropClear();
                          diviData.clear();
                          // await Provider.of<SchoolPhotoProviders>(context,
                          //         listen: false)
                          //     .courseListClear();
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .getCourseList(section);
                          print("data $subjectData");

                          print(subjectData.join(','));
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
                          course = diviData.join(',');
                          await Provider.of<SchoolPhotoProviders>(context,
                                  listen: false)
                              .getDivisionList(course);

                          print(diviData.join(','));
                          print(course);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 100, color: UIGuide.light_Purple,
                  //   style: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () async {
                    Provider.of<StudStatiticsProvider>(context, listen: false)
                        .statiticsList
                        .clear();
                    Provider.of<StudStatiticsProvider>(context, listen: false)
                        .totalList
                        .clear();
                    await Provider.of<StudStatiticsProvider>(context,
                            listen: false)
                        .getstatitics(section, course);
                  },
                  child: Text(
                    'View',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: const [
                  TableRow(
                      decoration: BoxDecoration(
                        //  border: Border.all(),
                        color: Color.fromARGB(255, 228, 224, 224),
                      ),
                      children: [
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Sl No.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Course',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Female',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                      ]),
                ],
              ),
            ),
            Consumer<StudStatiticsProvider>(builder: (context, value, child) {
              return LimitedBox(
                  maxHeight: 440,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.statiticsList.isEmpty
                          ? 0
                          : value.statiticsList.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Table(
                              //  border: TableBorder.all(color: Colors.grey),
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(1),
                                4: FlexColumnWidth(1),
                              },
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(),
                                    children: [
                                      Text(
                                        (index + 1).toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        value.statiticsList[index].course ??
                                            '--',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        value.statiticsList[index].male
                                                    .toString() ==
                                                null
                                            ? '--'
                                            : value.statiticsList[index].male
                                                .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        value.statiticsList[index].feMale
                                                    .toString() ==
                                                null
                                            ? '--'
                                            : value.statiticsList[index].feMale
                                                .toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        value.statiticsList[index].totalCount
                                                    .toString() ==
                                                null
                                            ? '--'
                                            : value
                                                .statiticsList[index].totalCount
                                                .toString(),
                                        textAlign: TextAlign.center,
                                      )
                                    ]),
                              ],
                            ),
                            kheight20,
                          ],
                        );
                      })));
            }),
            Consumer<StudStatiticsProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  itemCount:
                      value.totalList.isEmpty ? 0 : value.totalList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1),
                        4: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(
                              //  border: Border.all(),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            children: [
                              const SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  '    ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )),
                              ),
                              const SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  '   Total:     ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: UIGuide.light_Purple,
                                      fontSize: 12),
                                )),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    value.totalList[index].netMaleCount == null
                                        ? '--'
                                        : value.totalList[index].netMaleCount
                                            .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: UIGuide.light_Purple,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  value.totalList[index].netFemaleCount == null
                                      ? '--'
                                      : value.totalList[index].netFemaleCount
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: UIGuide.light_Purple,
                                      fontSize: 12),
                                )),
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  value.totalList[index].netTotal == null
                                      ? '--'
                                      : value.totalList[index].netTotal
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: UIGuide.light_Purple,
                                      fontSize: 12),
                                )),
                              ),
                            ]),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
