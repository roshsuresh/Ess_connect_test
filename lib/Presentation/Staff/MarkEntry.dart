
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../Application/Staff_Providers/MarkEntryProvider.dart';
import '../../Application/Staff_Providers/StudListProvider.dart';
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
      p.getMarkEntryInitialValues();
      //p.getMarkEntryDivisionValues();
    });
  }

  String courseId = '';
  final markEntryInitialValuesController = TextEditingController();
  final markEntryDivisionListController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Entry',
          style: TextStyle(fontSize: 16),
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
      body: ListView(
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
                                        snapshot.removeCourseAll();
                                        return Column(
                                          children: [
                                            ListTile(
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
                                                        .courseName ??
                                                    '--';
                                                courseId = snapshot
                                                        .markEntryInitialValues[
                                                            index]
                                                        .id ??
                                                    -snapshot.addSelectedCourse(
                                                        snapshot.markEntryInitialValues[
                                                            index]);
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
                      child: TextField(
                        controller: markEntryInitialValuesController,
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
                                      itemCount:
                                          snapshot.markEntryDivisionList.length,
                                      itemBuilder: (context, index) {
                                        print(snapshot
                                            .markEntryDivisionList.length);
                                        snapshot.removeDivisionAll();
                                        return ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: UIGuide.PRIMARY2,
                                          selected: snapshot.isDivisonSelected(
                                              snapshot.markEntryDivisionList[
                                                  index]),
                                          onTap: () {
                                            print(snapshot
                                                .markEntryDivisionList.length);
                                            markEntryDivisionListController
                                                .text = snapshot
                                                    .markEntryDivisionList[
                                                        index]
                                                    .text ??
                                                '---';
                                            snapshot.addSelectedDivision(
                                                snapshot.markEntryDivisionList[
                                                    index]);

                                            Navigator.of(context).pop();
                                          },
                                          title: Text(snapshot
                                                  .markEntryDivisionList[index]
                                                  .text ??
                                              '---'),
                                        );
                                      }),
                                ],
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: markEntryDivisionListController,
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
                  );
                }),
              ),
            ],
          ),
          Row(
            children: [
              // MaterialButton(
              //   minWidth: size.width - 200,
              //   child: Row(
              //     children: [
              //       Text('Select Course'),
              //       //Icon(Icons.arrow_downward_outlined)
              //     ],
              //   ),
              //   color: Colors.white70,
              //   onPressed: (() {}),
              // ),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<StudReportListProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: ListView.builder(
                                    itemCount: snapshot.courselist.length,
                                    itemBuilder: (context, index) {
                                      print(snapshot.courselist.length);
                                      //  snap.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,
                                        // selected: snapshot.isCourseSelected(
                                        //     snapshot.courselist[index]),
                                        onTap: () {
                                          print(snapshot.courselist.length);
                                          // courseController.text =
                                          //     snapshot.courselist[index].name;
                                          // snapshot.addSelectedCourse(
                                          //     snapshot.courselist[index]);

                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                            snapshot.courselist[index].name),
                                      );
                                    }));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        //  controller: courseController,
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
                  );
                }),
              ),
              Spacer(),
              // MaterialButton(
              //   minWidth: size.width - 200,
              //   child: Row(
              //     children: [
              //       const Text('Select Division'),
              //       // Icon(Icons.arrow_downward_outlined)
              //     ],
              //   ),
              //   color: Colors.white70,
              //   onPressed: (() {}),
              // ),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<StudReportListProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: ListView.builder(
                                    itemCount: snapshot.courselist.length,
                                    itemBuilder: (context, index) {
                                      print(snapshot.courselist.length);
                                      //  snap.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,
                                        // selected: snapshot.isCourseSelected(
                                        //     snapshot.courselist[index]),
                                        onTap: () {
                                          print(snapshot.courselist.length);
                                          // courseController.text =
                                          //     snapshot.courselist[index].name;
                                          // snapshot.addSelectedCourse(
                                          //     snapshot.courselist[index]);

                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                            snapshot.courselist[index].name),
                                      );
                                    }));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        //  controller: courseController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 238, 237, 237),
                          border: OutlineInputBorder(),
                          labelText: "Select Subject",
                          hintText: "Subject",
                        ),
                        enabled: false,
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
                child: Consumer<StudReportListProvider_stf>(
                    builder: (context, snapshot, child) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: ListView.builder(
                                    itemCount: snapshot.courselist.length,
                                    itemBuilder: (context, index) {
                                      print(snapshot.courselist.length);
                                      //  snap.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,
                                        // selected: snapshot.isCourseSelected(
                                        //     snapshot.courselist[index]),
                                        onTap: () {
                                          print(snapshot.courselist.length);
                                          // courseController.text =
                                          //     snapshot.courselist[index].name;
                                          // snapshot.addSelectedCourse(
                                          //     snapshot.courselist[index]);

                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                            snapshot.courselist[index].name),
                                      );
                                    }));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        //  controller: courseController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 238, 237, 237),
                          border: OutlineInputBorder(),
                          labelText: "Select Subject",
                          hintText: "Subject",
                        ),
                        enabled: false,
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
              onPressed: (() {}),
            ),
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
                          'Attendance',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'Mark',
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
                              3: FlexColumnWidth(1.5),
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
                                      'A',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 22,
                                      width: 10,
                                      child: TextField(
                                        //keyboardType: TextInputType.number,
                                        // maxLines: 1,
                                        // maxLength: 4,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            errorStyle: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold)),
                                        //style: TextStyle(height: 0),
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
              ),
              kWidth
            ],
          )
        ],
      ),
    );
  }
}
