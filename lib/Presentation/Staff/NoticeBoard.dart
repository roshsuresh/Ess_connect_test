import 'package:Ess_test/Application/Staff_Providers/NoticeboardSend.dart';
import 'package:Ess_test/Presentation/Staff/ReceivedNoticeBoard.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class StaffNoticeBoard extends StatelessWidget {
  StaffNoticeBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Notice Board'),
              titleSpacing: 20.0,
              centerTitle: true,
              toolbarHeight: 30.2,
              toolbarOpacity: 0.8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: "Send",
                  ),
                  Tab(text: "Received"),
                ],
              ),
              backgroundColor: UIGuide.light_Purple,
            ),
            body: TabBarView(children: [
              Consumer<StaffNoticeboardSendProviders>(
                builder: (context, value, child) {
                  if (value.isClassTeacher != false) {
                    return StaffNoticeBoard_sent();
                  } else {
                    return Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.sentiment_dissatisfied_outlined,
                              size: 60,
                              color: Colors.grey,
                            ),
                            kheight10,
                            Text(
                              "Sorry you don't have access",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
              StaffNoticeBoardReceived(),
            ])));
  }
}

class StaffNoticeBoard_sent extends StatefulWidget {
  StaffNoticeBoard_sent({Key? key}) : super(key: key);

  @override
  State<StaffNoticeBoard_sent> createState() => _StaffNoticeBoard_sentState();
}

class _StaffNoticeBoard_sentState extends State<StaffNoticeBoard_sent> {
  DateTime? _mydatetime;

  String? datee;

  DateTime? _mydatetimeFrom;

  DateTime? _mydatetimeTo;

  String time = '--';

  String timeNow = '--';

  String? checkname;

  final coursevalueController = TextEditingController();
  final coursevalueController1 = TextEditingController();

  final categoryvalueController = TextEditingController();
  final categoryvalueController1 = TextEditingController();
  final divisionvalueController = TextEditingController();
  final divisionvalueController1 = TextEditingController();

  final titleController = TextEditingController();
  final mattercontroller = TextEditingController();

  String? attachmentid;
  @override
  Widget build(BuildContext context) {
    Provider.of<StaffNoticeboardSendProviders>(context, listen: false)
        .sendNoticeboard();
    var size = MediaQuery.of(context).size;
    datee = DateFormat('dd/MMM/yyyy').format(DateTime.now());

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                minWidth: size.width - 250,
                color: Colors.white70,
                child: Text('Date: ${datee.toString()}'),
                onPressed: () async {
                  return;
                }),
            Spacer(),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.49,
              child: Consumer<StaffNoticeboardSendProviders>(
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
                                    itemCount: noticeCategoryStf!.length,
                                    itemBuilder: (context, index) {
                                      // print(snapshot

                                      //     .attendenceInitialValues.length);

                                      // value.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,

                                        // selected: snapshot.isCourseSelected(
                                        //     attendecourse![index]),

                                        onTap: () async {
                                          print({noticeCategoryStf![index]});
                                          categoryvalueController.text =
                                              await noticeCategoryStf![index]
                                                      ['value'] ??
                                                  '--';
                                          categoryvalueController1.text =
                                              await noticeCategoryStf![index]
                                                      ['text'] ??
                                                  '--';
                                          // courseId =
                                          //     markEntryInitialValuesController
                                          //         .text
                                          //         .toString();

                                          // snapshot.addSelectedCourse(
                                          //     attendecourse![index]);
                                          //   print(courseId);
                                          // await Provider.of<
                                          //             AttendenceStaffProvider>(
                                          //         context,
                                          //         listen: false)
                                          //     .getAttendenceDivisionValues(
                                          //         courseId);
                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                          noticeCategoryStf![index]['text'] ??
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
                            controller: categoryvalueController1,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 238, 237, 237),
                              border: OutlineInputBorder(),
                              labelText: "Select Category",
                              hintText: "Category",
                            ),
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          height: 0,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: categoryvalueController,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: titleController,
            minLines: 1,
            maxLines: 1,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: 'Title*',
              hintText: 'Enter Title',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: mattercontroller,
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: 'Matter*',
              hintText: 'Enter Matter',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 120,
            child: MaterialButton(
              // minWidth: size.width - 200,
              child: Text(
                  checkname == null ? 'Choose File' : checkname.toString()),

              color: Colors.white70,
              onPressed: (() async {
                final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'png', 'jpeg', 'jpg']);
                if (result == null) {
                  return;
                }
                final file = result.files.first;
                print('Name: ${file.name}');
                print('Path: ${file.path}');
                print('Extension: ${file.extension}');
                await Provider.of<StaffNoticeboardSendProviders>(context,
                        listen: false)
                    .noticeImageSave(file.path.toString());
                //openFile(file);
                if (file.name.length >= 6) {
                  setState(() {
                    checkname = file.name.replaceRange(6, file.name.length, '');
                  });

                  print(checkname);
                }
              }),
            ),
          ),
        ),
        Row(
          children: [
            MaterialButton(
              minWidth: size.width - 200,
              child: Center(child: Text('From  $time')),
              color: Colors.white,
              onPressed: (() async {
                _mydatetimeFrom = await showDatePicker(
                    context: context,
                    initialDate: _mydatetimeFrom ?? DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 0)),
                    lastDate: DateTime(2030));
                setState(() {
                  time = DateFormat('dd/MMM/yyyy').format(_mydatetimeFrom!);
                  print(time);
                });
              }),
            ),
            Spacer(),
            MaterialButton(
              minWidth: size.width - 200,
              child: Center(child: Text('To  ${timeNow}')),
              color: Colors.white,
              onPressed: (() async {
                _mydatetimeTo = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 0)),
                  lastDate: DateTime(2100),
                );
                // _mydatetimeTo = await showDatePicker(
                //     context: context,
                //     initialDate: _mydatetimeTo ?? DateTime.now(),
                //     firstDate: DateTime(2022),
                //     lastDate: DateTime(2030));
                setState(() {
                  timeNow = DateFormat('dd/MMM/yyyy').format(_mydatetimeTo!);
                  print(timeNow);
                });
              }),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.49,
              child: Consumer<StaffNoticeboardSendProviders>(
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
                                    itemCount: noticeCourseStf!.length,
                                    itemBuilder: (context, index) {
                                      // print(snapshot

                                      //     .attendenceInitialValues.length);

                                      // value.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,

                                        // selected: snapshot.isCourseSelected(
                                        //     attendecourse![index]),

                                        onTap: () async {
                                          print(
                                              'guh.....${noticeCourseStf![index]}');
                                          coursevalueController.text =
                                              await noticeCourseStf![index]
                                                      ['value'] ??
                                                  '--';
                                          coursevalueController1.text =
                                              await noticeCourseStf![index]
                                                      ['text'] ??
                                                  '--';
                                          String courseId =
                                              coursevalueController.text
                                                  .toString();

                                          print(courseId);
                                          await Provider.of<
                                                      StaffNoticeboardSendProviders>(
                                                  context,
                                                  listen: false)
                                              .getDivisionList(courseId);
                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                          noticeCourseStf![index]['text'] ??
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
                            controller: coursevalueController1,
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
                            controller: coursevalueController,
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
              child: Consumer<StaffNoticeboardSendProviders>(
                  builder: (context, snapshot, child) {
                attachmentid = snapshot.id ?? '';
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
                                    itemCount: snapshot.divisionlistt.length,
                                    itemBuilder: (context, index) {
                                      // print(snapshot

                                      //     .attendenceInitialValues.length);

                                      // value.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,
                                        // selected: snapshot.isDivisionSelected(
                                        //     snapshot.noticeDivision[index]),
                                        onTap: () async {
                                          divisionvalueController.text =
                                              snapshot.divisionlistt[index]
                                                      .value ??
                                                  '--';

                                          print(divisionvalueController.text);
                                          divisionvalueController1.text =
                                              snapshot.divisionlistt[index]
                                                      .text ??
                                                  '--';
                                          String divisionId =
                                              divisionvalueController.text
                                                  .toString();

                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                          snapshot.divisionlistt[index].text ??
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
                            controller: divisionvalueController1,
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
                            textAlign: TextAlign.center,
                            controller: divisionvalueController,
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
        kheight20,
        kheight20,
        Center(
          child: SizedBox(
            width: 150,
            child: MaterialButton(
              minWidth: size.width - 150,
              child: const Text(
                'Save',
                textAlign: TextAlign.center,
              ),
              color: Color.fromARGB(179, 145, 143, 143),
              onPressed: (() async {
                if (titleController.text.isEmpty &&
                    mattercontroller.text.isEmpty &&
                    coursevalueController.text.isEmpty &&
                    divisionvalueController.text.isEmpty &&
                    categoryvalueController.text.isEmpty) {
                  return await AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          headerAnimationLoop: false,
                          title: 'Error',
                          desc: 'Select mandatory fields',
                          btnOkOnPress: () {
                            return;
                          },
                          btnOkIcon: Icons.cancel,
                          btnOkColor: Colors.red)
                      .show();
                } else {
                  await Provider.of<StaffNoticeboardSendProviders>(context,
                          listen: false)
                      .noticeBoardSave(
                          datee.toString(),
                          time,
                          timeNow,
                          titleController.text,
                          mattercontroller.text,
                          coursevalueController.text,
                          divisionvalueController.text,
                          categoryvalueController.text,
                          attachmentid!);

                  print(datee);
                  print(time);
                  print(timeNow);
                  print(titleController);
                  print(mattercontroller);
                  print(coursevalueController);
                  print(divisionvalueController);
                  print(categoryvalueController);
                  print(attachmentid);

                  await AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          headerAnimationLoop: false,
                          title: 'Success',
                          desc: 'Successfully send',
                          btnOkOnPress: () {
                            return;
                          },
                          btnOkIcon: Icons.cancel,
                          btnOkColor: Colors.green)
                      .show();

                  titleController.clear();
                  mattercontroller.clear();
                  coursevalueController.clear();
                  divisionvalueController.clear();
                  categoryvalueController.clear();
                  coursevalueController1.clear();
                  divisionvalueController1.clear();
                  categoryvalueController1.clear();
                }
              }),
            ),
          ),
        ),
      ],
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

//Notification Send Page TExt & Matter

