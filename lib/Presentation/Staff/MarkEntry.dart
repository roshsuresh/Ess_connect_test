import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Application/Staff_Providers/MarkEntryProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class MarkEntry extends StatefulWidget {
  const MarkEntry({Key? key}) : super(key: key);

  @override
  State<MarkEntry> createState() => _MarkEntryState();
}

class _MarkEntryState extends State<MarkEntry> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<MarkEntryProvider>(context, listen: false);

      p.clearAllFilters();
      p.selectedCourse.clear();
      p.selectedDivision.clear();
      p.courseClear();
      p.divisionClear();
      p.getMarkEntryInitialValues();
      p.removeDivisionAll();
      p.removeAllpartClear();
      p.removeAllSubjectClear();
      p.removeAllExamClear();
      p.clearStudentMEList();
      // p.getMarkEntryPartValues(courseId, divisionId);
    });
  }

  bool attend = false;
  String courseId = '';
  String partId = '';
  String subjectId = '';
  String divisionId = '';
  final markEntryInitialValuesController = TextEditingController();
  final markEntryInitialValuesController1 = TextEditingController();
  final markEntryDivisionListController = TextEditingController();
  final markEntryDivisionListController1 = TextEditingController();
  final markEntryPartListController = TextEditingController();
  final markEntryPartListController1 = TextEditingController();
  final markEntrySubjectListController = TextEditingController();
  final markEntrySubjectListController1 = TextEditingController();
  final markEntryExamListController = TextEditingController();
  final markEntryExamListController1 = TextEditingController();
  final markfieldController = TextEditingController();
  final markfieldController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Entry',
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
      body: Consumer<MarkEntryProvider>(
        builder: (context, value, child) {
          return ListView(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Consumer<MarkEntryProvider>(
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
                                          itemCount: snapshot
                                              .markEntryInitialValues.length,
                                          itemBuilder: (context, index) {
                                            print(snapshot
                                                .markEntryInitialValues.length);
                                            value.removeCourseAll();
                                            return ListTile(
                                              selectedTileColor:
                                                  Colors.blue.shade100,
                                              selectedColor: UIGuide.PRIMARY2,
                                              selected: snapshot
                                                  .isCourseSelected(snapshot
                                                          .markEntryInitialValues[
                                                      index]),
                                              onTap: () async {
                                                print(snapshot
                                                    .markEntryInitialValues
                                                    .length);
                                                markEntryInitialValuesController
                                                    .text = snapshot
                                                        .markEntryInitialValues[
                                                            index]
                                                        .id ??
                                                    '--';
                                                markEntryInitialValuesController1
                                                    .text = snapshot
                                                        .markEntryInitialValues[
                                                            index]
                                                        .courseName ??
                                                    '--';
                                                courseId =
                                                    markEntryInitialValuesController
                                                        .text
                                                        .toString();

                                                snapshot.addSelectedCourse(snapshot
                                                        .markEntryInitialValues[
                                                    index]);
                                                print(courseId);
                                                await Provider.of<
                                                            MarkEntryProvider>(
                                                        context,
                                                        listen: false)
                                                    .getMarkEntryDivisionValues(
                                                        courseId);
                                                Navigator.of(context).pop();
                                              },
                                              title: Text(
                                                snapshot
                                                        .markEntryInitialValues[
                                                            index]
                                                        .courseName ??
                                                    '--',
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
                                  controller: markEntryInitialValuesController1,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                    child: Consumer<MarkEntryProvider>(
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
                                              .markEntryDivisionList.length,
                                          itemBuilder: (context, index) {
                                            print(snapshot
                                                .markEntryDivisionList.length);
                                            // value.removeDivisionAll();
                                            return ListTile(
                                              selectedTileColor:
                                                  Colors.blue.shade100,
                                              selectedColor: UIGuide.PRIMARY2,
                                              selected: snapshot
                                                  .isDivisonSelected(snapshot
                                                          .markEntryDivisionList[
                                                      index]),
                                              onTap: () async {
                                                print(snapshot
                                                    .markEntryDivisionList
                                                    .length);
                                                markEntryDivisionListController
                                                    .text = snapshot
                                                        .markEntryDivisionList[
                                                            index]
                                                        .value ??
                                                    '---';
                                                markEntryDivisionListController1
                                                    .text = snapshot
                                                        .markEntryDivisionList[
                                                            index]
                                                        .text ??
                                                    '---';
                                                snapshot.addSelectedDivision(
                                                    snapshot.markEntryDivisionList[
                                                        index]);
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

                                                await Provider.of<
                                                            MarkEntryProvider>(
                                                        context,
                                                        listen: false)
                                                    .getMarkEntryPartValues(
                                                        courseId, divisionId);

                                                Navigator.of(context).pop();
                                              },
                                              title: Text(
                                                snapshot
                                                        .markEntryDivisionList[
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
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Consumer<MarkEntryProvider>(
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
                                          itemCount:
                                              snapshot.markEntryPartList.length,
                                          itemBuilder: (context, index) {
                                            print(snapshot
                                                .markEntryPartList.length);

                                            return ListTile(
                                              selectedTileColor:
                                                  Colors.blue.shade100,
                                              selectedColor: UIGuide.PRIMARY2,
                                              selected: snapshot.isPartSelected(
                                                  snapshot.markEntryPartList[
                                                      index]),
                                              onTap: () async {
                                                print(snapshot
                                                    .markEntryPartList.length);
                                                markEntryPartListController
                                                    .text = snapshot
                                                        .markEntryPartList[
                                                            index]
                                                        .value ??
                                                    '--';
                                                markEntryPartListController1
                                                    .text = snapshot
                                                        .markEntryPartList[
                                                            index]
                                                        .text ??
                                                    '--';
                                                snapshot.addSelectedPart(
                                                    snapshot.markEntryPartList[
                                                        index]);

                                                divisionId =
                                                    markEntryDivisionListController
                                                        .text
                                                        .toString();
                                                partId =
                                                    markEntryPartListController
                                                        .text
                                                        .toString();
                                                print(
                                                    markEntryPartListController
                                                        .text);
                                                print(
                                                    markEntryDivisionListController
                                                        .text);

                                                await Provider.of<
                                                            MarkEntryProvider>(
                                                        context,
                                                        listen: false)
                                                    .getMarkEntrySubjectValues(
                                                        divisionId, partId);

                                                Navigator.of(context).pop();
                                              },
                                              title: Text(
                                                snapshot
                                                        .markEntryPartList[
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: markEntryPartListController1,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "Select Part",
                                    hintText: "Part",
                                  ),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(
                                width: 0,
                                height: 0,
                                child: TextField(
                                  controller: markEntryPartListController,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                    child: Consumer<MarkEntryProvider>(
                        builder: (context, snapshot, child) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Dialog(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot
                                              .markEntrySubjectList.length,
                                          itemBuilder: (context, index) {
                                            print(snapshot
                                                .markEntrySubjectList.length);
                                            //  snap.removeCourseAll();
                                            return ListTile(
                                              selectedTileColor:
                                                  Colors.blue.shade100,
                                              selectedColor: UIGuide.PRIMARY2,
                                              selected: snapshot
                                                  .isSubjectSelected(snapshot
                                                          .markEntrySubjectList[
                                                      index]),
                                              onTap: () async {
                                                print(snapshot
                                                    .markEntrySubjectList
                                                    .length);
                                                markEntrySubjectListController
                                                    .text = snapshot
                                                        .markEntrySubjectList[
                                                            index]
                                                        .value ??
                                                    '---';
                                                markEntrySubjectListController1
                                                    .text = snapshot
                                                        .markEntrySubjectList[
                                                            index]
                                                        .text ??
                                                    '---';
                                                snapshot.addSelectedSubject(
                                                    snapshot.markEntrySubjectList[
                                                        index]);

                                                divisionId =
                                                    markEntryDivisionListController
                                                        .text
                                                        .toString();
                                                partId =
                                                    markEntryPartListController
                                                        .text
                                                        .toString();
                                                subjectId =
                                                    markEntrySubjectListController
                                                        .text
                                                        .toString();
                                                print(
                                                    markEntryPartListController
                                                        .text);
                                                print(
                                                    markEntryDivisionListController
                                                        .text);
                                                print(
                                                    markEntrySubjectListController
                                                        .text);

                                                await Provider.of<
                                                            MarkEntryProvider>(
                                                        context,
                                                        listen: false)
                                                    .getMarkEntryExamValues(
                                                        subjectId,
                                                        divisionId,
                                                        partId);

                                                Navigator.of(context).pop();
                                              },
                                              title: Text(
                                                snapshot
                                                    .markEntrySubjectList[index]
                                                    .text
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            );
                                          }),
                                    ],
                                  )),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LimitedBox(
                                maxHeight: 40,
                                child: TextField(
                                  style: const TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.clip),
                                  textAlign: TextAlign.center,
                                  controller: markEntrySubjectListController1,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "Select Subject",
                                    hintText: "Subject",
                                  ),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: markEntrySubjectListController,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Consumer<MarkEntryProvider>(
                        builder: (context, snapshot, child) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            snapshot.markEntryExamList.length,
                                        itemBuilder: (context, index) {
                                          print(snapshot
                                              .markEntryExamList.length);

                                          return ListTile(
                                            selectedTileColor:
                                                Colors.blue.shade100,
                                            selectedColor: UIGuide.PRIMARY2,
                                            selected: snapshot.isExamSelected(
                                                snapshot
                                                    .markEntryExamList[index]),
                                            onTap: () {
                                              print(snapshot
                                                  .markEntryExamList.length);
                                              markEntryExamListController
                                                  .text = snapshot
                                                      .markEntryExamList[index]
                                                      .text ??
                                                  '--';
                                              markEntryExamListController1
                                                  .text = snapshot
                                                      .markEntryExamList[index]
                                                      .value ??
                                                  '--';
                                              snapshot.addSelectedExam(snapshot
                                                  .markEntryExamList[index]);

                                              Navigator.of(context).pop();
                                            },
                                            title: Text(snapshot
                                                    .markEntryExamList[index]
                                                    .text ??
                                                '--'),
                                          );
                                        }),
                                  ],
                                ));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LimitedBox(
                                maxHeight: 40,
                                child: TextField(
                                  style: const TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.clip),
                                  textAlign: TextAlign.center,
                                  controller: markEntryExamListController,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "Select Exam",
                                    hintText: "Exam",
                                  ),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: markEntryExamListController1,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 238, 237, 237),
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
                  // MaterialButton(
                  //   //minWidth: size.width - 200,
                  //   child: Row(
                  //     children: [
                  //       const Text('View'),
                  //     ],
                  //   ),
                  //   color: Colors.grey,
                  //   onPressed: (() {}),
                  // ),
                  // kWidth,
                  // kWidth,
                  // kWidth,
                  // kWidth,
                  // kWidth,
                  // kWidth,
                ],
              ),
              SizedBox(
                width: 100,
                child: MaterialButton(
                  //minWidth: size.width - 200,
                  child: const Text('View'),
                  color: Colors.grey,
                  onPressed: (() async {
                    String date =
                        await DateFormat('dd/MMM/yyyy').format(DateTime.now());
                    print(DateFormat('dd/MMM/yyyy').format(DateTime.now()));

                    String course =
                        markEntryInitialValuesController.text.toString();
                    String division =
                        markEntryDivisionListController.text.toString();
                    String part = markEntryPartListController.text.toString();
                    String subject =
                        markEntrySubjectListController.text.toString();
                    String exam = markEntryExamListController.text.toString();

                    print(course);
                    print(date);

                    print(division);
                    print(exam);
                    print(part);
                    print(subject);

                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .getMarkEntryView(
                            course, date, division, exam, part, subject);

                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removeDivisionAll();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .divisionClear();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removePartAll();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removeAllpartClear();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removeSubjectAll();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removeAllSubjectClear();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removeAllExamClear();
                    await Provider.of<MarkEntryProvider>(context, listen: false)
                        .removeExamAll();
                  }),
                ),
              ),
              kheight20,
              Consumer<MarkEntryProvider>(
                builder: (context, providerr, child) => providerr.loading
                    ? spinkitLoader()
                    : Column(
                        children: [
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
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Center(
                                            child: Text(
                                          'Attendance',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Center(
                                            child: Text(
                                          'Mark',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        )),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                          Consumer<MarkEntryProvider>(
                            builder: (context, valuee, child) => LimitedBox(
                                //     <------  Box Height
                                maxHeight: 480,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: valuee.studentMEList.length,
                                    itemBuilder: ((context, index) {
                                      String pre = 'P';
                                      markfieldController.text = pre;
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          children: [
                                            Table(
                                              columnWidths: const {
                                                0: FlexColumnWidth(1),
                                                1: FlexColumnWidth(4),
                                                2: FlexColumnWidth(.7),
                                                3: FlexColumnWidth(1.5),
                                              },
                                              children: [
                                                TableRow(
                                                    decoration:
                                                        const BoxDecoration(),
                                                    children: [
                                                      Text(
                                                        valuee
                                                                    .studentMEList[
                                                                        index]
                                                                    .rollNo ==
                                                                null
                                                            ? '--'
                                                            : valuee
                                                                .studentMEList[
                                                                    index]
                                                                .rollNo
                                                                .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        valuee
                                                                    .studentMEList[
                                                                        index]
                                                                    .name ==
                                                                null
                                                            ? '--'
                                                            : valuee
                                                                .studentMEList[
                                                                    index]
                                                                .name
                                                                .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              attend = !attend;
                                                            });
                                                          },
                                                          child: Text(attend
                                                              ? "P"
                                                              : "A")),
                                                      SizedBox(
                                                        height: 22,
                                                        width: 10,
                                                        child: TextField(
                                                          onTap: () {
                                                            String abs = "A";

                                                            // setState(() {
                                                            //   markfieldController.text = pre;
                                                            //   print(markfieldController.text
                                                            //       .toString());
                                                            // });
                                                            //  markfieldController.text = abs;
                                                          },
                                                          // controller: markfieldController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration: InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              errorStyle: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          //  style: TextStyle(height: 0),
                                                        ),
                                                      )
                                                    ]),
                                              ],
                                            ),
                                            kheight20,
                                          ],
                                        ),
                                      );
                                    }))),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
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
            ),
            kWidth
          ],
        ),
      ),
    );
  }
}
