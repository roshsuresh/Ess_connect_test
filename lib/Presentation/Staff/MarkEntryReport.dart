import 'package:Ess_test/Application/Staff_Providers/MarkReportProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class MarkEntryReport extends StatefulWidget {
  MarkEntryReport({Key? key}) : super(key: key);

  @override
  State<MarkEntryReport> createState() => _MarkEntryReportState();
}

class _MarkEntryReportState extends State<MarkEntryReport> {
  String courseId = '';

  final courseController = TextEditingController();

  final courseController1 = TextEditingController();

  final divisionController = TextEditingController();

  final divisionController1 = TextEditingController();

  final partController = TextEditingController();

  final partController1 = TextEditingController();

  final examController = TextEditingController();

  final examController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<MarkEntryReportProvider_stf>(context, listen: false);
      p.markReportcourse();
      p.removeCourseAll();
      // p.selectedCourse.clear();
      p.courseClear();
      p.divisionClear();
      p.removeDivisionAll();
      // p.clearStudentList();
      // p.selectedList.clear();
      // p.selectAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Entry Report',
          style: TextStyle(fontSize: 20),
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
      body:
          //  Consumer<MarkEntryReportProvider_stf>(
          //   builder: (context, value, child) =>

          ListView(
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
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
                                          snapshot.markReportCourseList.length,
                                      itemBuilder: (context, index) {
                                        print(snapshot
                                            .markReportCourseList.length);
                                        //    value.removeCourseAll();
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isCourseSelected(
                                              snapshot
                                                  .markReportCourseList[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportCourseList.length);
                                            courseController.text = snapshot
                                                    .markReportCourseList[index]
                                                    .id ??
                                                '--';
                                            courseController1.text = snapshot
                                                    .markReportCourseList[index]
                                                    .courseName ??
                                                '--';
                                            courseId = courseController.text
                                                .toString();

                                            snapshot.addSelectedCourse(snapshot
                                                .markReportCourseList[index]);
                                            print(courseId);
                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportDivisionList(
                                                    courseId);
                                            await Provider.of<
                                                        MarkEntryReportProvider_stf>(
                                                    context,
                                                    listen: false)
                                                .markReportPart(courseId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportCourseList[index]
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
                              controller: courseController1,
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
                              controller: courseController,
                              decoration: const InputDecoration(
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
                child: Consumer<MarkEntryReportProvider_stf>(
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
                                          snapshot.markReportDivisions.length,
                                      itemBuilder: (context, index) {
                                        print(snapshot
                                            .markReportDivisions.length);
                                        //    value.removeCourseAll();
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isDivisionSelected(
                                              snapshot
                                                  .markReportDivisions[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportDivisions.length);
                                            divisionController.text = snapshot
                                                    .markReportDivisions[index]
                                                    .value ??
                                                '--';
                                            divisionController1.text = snapshot
                                                    .markReportDivisions[index]
                                                    .text ??
                                                '--';
                                            courseId = courseController.text
                                                .toString();

                                            snapshot.addSelectedDivision(
                                                snapshot.markReportDivisions[
                                                    index]);
                                            print(courseId);
                                            // await Provider.of<
                                            //             MarkEntryReportProvider_stf>(
                                            //         context,
                                            //         listen: false)
                                            //     .getMarkEntryDivisionValues(
                                            //         courseId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportDivisions[index]
                                                    .text ??
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
                              controller: divisionController1,
                              decoration: const InputDecoration(
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
                              textAlign: TextAlign.center,
                              controller: divisionController,
                              decoration: const InputDecoration(
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
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<MarkEntryReportProvider_stf>(
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
                                          snapshot.markReportPartList.length,
                                      itemBuilder: (context, index) {
                                        print(
                                            snapshot.markReportPartList.length);
                                        //    value.removeCourseAll();
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isPartSelected(
                                              snapshot
                                                  .markReportPartList[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportPartList.length);
                                            partController.text = snapshot
                                                    .markReportPartList[index]
                                                    .value ??
                                                '--';
                                            partController1.text = snapshot
                                                    .markReportPartList[index]
                                                    .text ??
                                                '--';

                                            snapshot.addSelectedPart(snapshot
                                                .markReportPartList[index]);
                                            print(courseId);

                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportPartList[index]
                                                    .text ??
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
                              controller: partController1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                labelText: "Select Part",
                                hintText: "Part",
                              ),
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: partController,
                              decoration: const InputDecoration(
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
                child: Consumer<MarkEntryReportProvider_stf>(
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
                                          snapshot.markReportDivisions.length,
                                      itemBuilder: (context, index) {
                                        print(snapshot
                                            .markReportDivisions.length);
                                        //    value.removeCourseAll();
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isDivisionSelected(
                                              snapshot
                                                  .markReportDivisions[index]),
                                          onTap: () async {
                                            print(snapshot
                                                .markReportDivisions.length);
                                            divisionController.text = snapshot
                                                    .markReportDivisions[index]
                                                    .value ??
                                                '--';
                                            divisionController1.text = snapshot
                                                    .markReportDivisions[index]
                                                    .text ??
                                                '--';
                                            courseId = courseController.text
                                                .toString();

                                            snapshot.addSelectedDivision(
                                                snapshot.markReportDivisions[
                                                    index]);
                                            print(courseId);
                                            // await Provider.of<
                                            //             MarkEntryReportProvider_stf>(
                                            //         context,
                                            //         listen: false)
                                            //     .getMarkEntryDivisionValues(
                                            //         courseId);
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.markReportDivisions[index]
                                                    .text ??
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
                              controller: divisionController1,
                              decoration: const InputDecoration(
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
                              textAlign: TextAlign.center,
                              controller: divisionController,
                              decoration: const InputDecoration(
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
          kheight20,
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
                          'English',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                    ]),
              ],
            ),
          ),
          LimitedBox(
              maxHeight: 440,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(1.5),
                              // 3: FlexColumnWidth(1.5),
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
                                      'ADAM ARUN ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      '10',
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                            ],
                          ),
                          kheight20,
                        ],
                      ),
                    );
                  }))),
        ],
      ),
      //  ),
    );
  }
}
