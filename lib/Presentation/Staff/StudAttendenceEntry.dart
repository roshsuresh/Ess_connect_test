import 'package:Ess_test/Application/Staff_Providers/Attendencestaff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';
import '../../utils/constants.dart';

class AttendenceEntry extends StatefulWidget {
  AttendenceEntry({Key? key}) : super(key: key);

  @override
  State<AttendenceEntry> createState() => _AttendenceEntryState();
}

class _AttendenceEntryState extends State<AttendenceEntry> {
  DateTime? _mydatetime;

  String date = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<AttendenceStaffProvider>(context, listen: false);
      Provider.of<AttendenceStaffProvider>(context, listen: false)
          .timee
          .toString();
      p.clearAllFilters();
      p.selectedCourse.clear();
      p.courseClear();
      p.divisionClear();
      p.attendenceCourseStaff();
      p.removeDivisionAll();
      p.clearStudentList();
      // p.getstudentsAttendenceView(
      //     "2022-09-23", 'da8f4f98-f340-4975-8e53-8939b09f52c6');

      // p.getMarkEntryPartValues(courseId, divisionId);
    });
  }

  String courseId = '';
  String partId = '';
  String subjectId = '';
  String divisionId = '';
  final markEntryInitialValuesController = TextEditingController();
  final markEntryInitialValuesController1 = TextEditingController();
  final markEntryDivisionListController = TextEditingController();
  final markEntryDivisionListController1 = TextEditingController();
  var dateController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // date = DateFormat('yyyy-MM-dd').format(DateTime.now());
//dateFinal = dateController1;
    String dateFinal =
        Provider.of<AttendenceStaffProvider>(context, listen: false)
            .timeNew
            .toString();
    print(dateFinal);

    var size = MediaQuery.of(context).size;
    print('object');
    print(DateFormat().format(DateTime.now()));
    Provider.of<AttendenceStaffProvider>(context, listen: false)
        .attendenceCourseStaff();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendence Entry',
          //style: TextStyle(fontSize: 20),
        ),
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
      body: Consumer<AttendenceStaffProvider>(builder: (context, value, child) {
        return ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.white,
                    child: Text(Provider.of<AttendenceStaffProvider>(context,
                                listen: false)
                            .timeNew ??
                        'select date'),
                    onPressed: () async {
                      await Provider.of<AttendenceStaffProvider>(context,
                              listen: false)
                          .getDate(context);
                    }),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Consumer<AttendenceStaffProvider>(
                      builder: (context, snapshot, child) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: attendecourse!.length,
                                        itemBuilder: (context, index) {
                                          // print(snapshot

                                          //     .attendenceInitialValues.length);

                                          // value.removeCourseAll();
                                          return Column(
                                            children: [
                                              ListTile(
                                                selectedTileColor:
                                                    Colors.blue.shade100,
                                                selectedColor: UIGuide.PRIMARY2,

                                                // selected: snapshot.isCourseSelected(
                                                //     attendecourse![index]),

                                                onTap: () async {
                                                  print(
                                                      'guh.....${attendecourse![index]}');
                                                  markEntryInitialValuesController
                                                          .text =
                                                      await attendecourse![
                                                              index]['value'] ??
                                                          '--';
                                                  markEntryInitialValuesController1
                                                          .text =
                                                      await attendecourse![
                                                              index]['text'] ??
                                                          '--';
                                                  courseId =
                                                      markEntryInitialValuesController
                                                          .text
                                                          .toString();

                                                  // snapshot.addSelectedCourse(
                                                  //     attendecourse![index]);
                                                  print(courseId);
                                                  await Provider.of<
                                                              AttendenceStaffProvider>(
                                                          context,
                                                          listen: false)
                                                      .getAttendenceDivisionValues(
                                                          courseId);
                                                  Navigator.of(context).pop();
                                                },
                                                title: Text(
                                                  attendecourse![index]
                                                          ['text'] ??
                                                      '--',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.black,
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                ),
                              ));
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: markEntryInitialValuesController1,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "Select Course",
                                  hintText: "Course",
                                ),
                                enabled: false,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: markEntryInitialValuesController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "",
                                  hintText: "",
                                ),
                                enabled: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Consumer<AttendenceStaffProvider>(
                      builder: (context, snapshot, child) {
                    return InkWell(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot
                                            .attendenceDivisionList.length,
                                        itemBuilder: (context, index) {
                                          print(snapshot
                                              .attendenceDivisionList.length);

                                          // value.removeDivisionAll();
                                          return ListTile(
                                            selectedTileColor:
                                                Colors.blue.shade100,
                                            selectedColor: UIGuide.PRIMARY2,
                                            // selected: snapshot
                                            //     .isDivisonSelected(snapshot
                                            //             .attendenceDivisionList[
                                            //         index]),
                                            onTap: () async {
                                              print(snapshot
                                                  .attendenceDivisionList
                                                  .length);
                                              markEntryDivisionListController
                                                  .text = snapshot
                                                      .attendenceDivisionList[
                                                          index]
                                                      .value ??
                                                  '---';
                                              markEntryDivisionListController1
                                                  .text = snapshot
                                                      .attendenceDivisionList[
                                                          index]
                                                      .text ??
                                                  '---';
                                              // snapshot.addSelectedDivision(
                                              //     snapshot.attendenceDivisionList[
                                              //         index]);
                                              print('jfrhrkjfr');
                                              print(
                                                  markEntryDivisionListController
                                                      .text);
                                              divisionId =
                                                  markEntryDivisionListController
                                                      .text
                                                      .toString();
                                              courseId =
                                                  markEntryInitialValuesController
                                                      .text
                                                      .toString();

                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              snapshot
                                                      .attendenceDivisionList[
                                                          index]
                                                      .text ??
                                                  '---',
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ));
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: markEntryDivisionListController1,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "Select Division",
                                  hintText: "Division",
                                ),
                                enabled: false,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                              child: TextField(
                                controller: markEntryDivisionListController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "",
                                  hintText: "",
                                ),
                                enabled: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Color.fromARGB(255, 172, 170, 170),
                    child: Text('View'),
                    onPressed: () async {
                      print(dateFinal);
                      print(divisionId);
                      dateFinal = Provider.of<AttendenceStaffProvider>(context,
                                  listen: false)
                              .timeNew ??
                          date.toString();

                      setState(() {
                        dateFinal = Provider.of<AttendenceStaffProvider>(
                                context,
                                listen: false)
                            .timeNew
                            .toString();
                      });

                      await Provider.of<AttendenceStaffProvider>(context,
                              listen: false)
                          .clearStudentList();
                      await Provider.of<AttendenceStaffProvider>(context,
                              listen: false)
                          .getstudentsAttendenceView(dateFinal, divisionId);
                    }),
              ],
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1.5),
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
                            'Roll No.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Forenoon',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Afternoon',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                      ]),
                ],
              ),
            ),
            Consumer<AttendenceStaffProvider>(builder: (context, value, child) {
              // Provider.of<AttendenceStaffProvider>(context, listen: false)
              //     .getstudentsAttendenceView(dateFinal, divisionId);
              return LimitedBox(
                  maxHeight: 440,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.studentsAttendenceView.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(4),
                                2: FlexColumnWidth(1.5),
                                3: FlexColumnWidth(1.5),
                              },
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(),
                                    children: [
                                      Text(
                                        value.studentsAttendenceView[index]
                                                    .rollNo ==
                                                null
                                            ? '0'
                                            : value
                                                .studentsAttendenceView[index]
                                                .rollNo
                                                .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        value.studentsAttendenceView[index]
                                                .name ??
                                            '--',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        value.studentsAttendenceView[index]
                                                .forenoon ??
                                            '--',
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        value.studentsAttendenceView[index]
                                                .afternoon ??
                                            '--',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                kWidth,
                Spacer(),
                MaterialButton(
                  onPressed: () {},
                  color: UIGuide.light_Purple,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                kWidth,
                MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
