import 'package:Ess_test/Application/Staff_Providers/GallerySendProviderStaff.dart';
import 'package:Ess_test/Application/Staff_Providers/NoticeboardSend.dart';
import 'package:Ess_test/Presentation/Staff/GalleryList.dart';
import 'package:Ess_test/Presentation/Staff/GalleryReceived.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';
import '../../utils/constants.dart';

class StaffGallery extends StatelessWidget {
  const StaffGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Gallery'),
              titleSpacing: 20.0,
              centerTitle: true,
              toolbarHeight: 40,
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
                  Tab(text: "Received"),
                  Tab(
                    text: "Send",
                  ),
                  Tab(
                    text: "List",
                  ),
                ],
              ),
              backgroundColor: UIGuide.light_Purple,
            ),
            body: TabBarView(children: [
              StaffGalleryView(),
              StaffGalleryUPload(),
              GalleryListStaff()
            ])));
  }
}

class StaffGalleryUPload extends StatefulWidget {
  const StaffGalleryUPload({Key? key}) : super(key: key);

  @override
  State<StaffGalleryUPload> createState() => _StaffGalleryUPloadState();
}

class _StaffGalleryUPloadState extends State<StaffGalleryUPload> {
  DateTime? _mydatetime;

  String? datee;

  DateTime? _mydatetimeFrom;

  DateTime? _mydatetimeTo;

  String time = '--';

  String timeNow = '--';

  String? checkname;

  final coursevalueController = TextEditingController();
  final coursevalueController1 = TextEditingController();
  final divisionvalueController = TextEditingController();
  final divisionvalueController1 = TextEditingController();
  final titleController = TextEditingController();
  String attachmentid = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<GallerySendProvider_Stf>(context, listen: false);
      p.sendGallery();
      p.clearAllFilters();
      p.galleryCourse.clear();
      p.courseClear();
      p.divisionClear();
      p.removeCourseAll();
      p.removeDivisionAll();
      titleController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    allowMultiple: true,
                    allowedExtensions: ['png', 'jpeg', 'jpg']);
                if (result == null) {
                  return;
                }
                final file = result.files.first;
                print('Name: ${file.name}');
                print('Path: ${file.path}');
                print('Extension: ${file.extension}');
                await Provider.of<GallerySendProvider_Stf>(context,
                        listen: false)
                    .galleryImageSave(context, file.path.toString());
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
              minWidth: size.width - 216,
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
              minWidth: size.width - 216,
              child: Center(child: Text('To  $timeNow')),
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
              child: Consumer<GallerySendProvider_Stf>(
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
                                    itemCount: snapshot.courselistt.length,
                                    itemBuilder: (context, index) {
                                      print('hii');
                                      print(snapshot.courselistt[index].value);
                                      print('hii');
                                      //snapshot.removeCourseAll();
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,
                                        onTap: () async {
                                          coursevalueController.text = snapshot
                                                  .courselistt[index].value ??
                                              '--';
                                          coursevalueController1.text = snapshot
                                                  .courselistt[index].text ??
                                              '--';
                                          String courseId =
                                              coursevalueController.text
                                                  .toString();
                                          await snapshot.addSelectedCourse(
                                              snapshot.courselistt[index]);
                                          print(courseId);
                                          await Provider.of<
                                                      GallerySendProvider_Stf>(
                                                  context,
                                                  listen: false)
                                              .getDivisionList(courseId);
                                          Navigator.of(context).pop();
                                        },
                                        title: Text(
                                          snapshot.courselistt[index].text ??
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
              child: Consumer<GallerySendProvider_Stf>(
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
                                          snapshot.addSelectedDivision(
                                              snapshot.divisionlistt[index]);

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
                if (titleController.text.isNotEmpty &&
                    coursevalueController.text.isNotEmpty &&
                    divisionvalueController.text.isNotEmpty &&
                    attachmentid.isNotEmpty) {
                  await Provider.of<GallerySendProvider_Stf>(context,
                          listen: false)
                      .gallerySave(
                          context,
                          datee.toString(),
                          time,
                          timeNow,
                          titleController.text,
                          coursevalueController.text,
                          divisionvalueController.text,
                          attachmentid);
                }

                print(datee);
                print(time);
                print(timeNow);
                print(titleController);

                print(coursevalueController);
                print(divisionvalueController);

                print(attachmentid);
                coursevalueController.clear();
                titleController.clear();
                divisionvalueController.clear();
                divisionvalueController1.clear();
                coursevalueController1.clear();
                await Provider.of<GallerySendProvider_Stf>(context,
                        listen: false)
                    .removeCourseAll();
                await Provider.of<GallerySendProvider_Stf>(context,
                        listen: false)
                    .courseClear();
                await Provider.of<GallerySendProvider_Stf>(context,
                        listen: false)
                    .removeDivisionAll();
                await Provider.of<GallerySendProvider_Stf>(context,
                        listen: false)
                    .divisionClear();

                if (attachmentid.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Select Image..',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 1),
                  ));
                }
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Enter Title..',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 1),
                  ));
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
