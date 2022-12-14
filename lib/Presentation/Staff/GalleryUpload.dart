import 'package:Ess_test/Application/Staff_Providers/GallerySendProviderStaff.dart';
import 'package:Ess_test/Presentation/Staff/GalleryList.dart';
import 'package:Ess_test/Presentation/Staff/GalleryReceived.dart';
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
            body: const TabBarView(children: [
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    datee = DateFormat('dd/MMM/yyyy').format(DateTime.now());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<GallerySendProvider_Stf>(context, listen: false);
      p.sendGallery();
      p.clearAllFilters();
      p.galleryCourse.clear();
      p.courseClear();
      p.divisionClear();
      p.removeCourseAll();
      p.removeDivisionAll();
      // titleController.clear();
    });
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
              labelStyle: const TextStyle(color: UIGuide.light_Purple),
              hintText: 'Enter Title',
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: UIGuide.light_Purple, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
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
                final result =
                    await FilePicker.platform.pickFiles(type: FileType.custom,
                        //  allowMultiple: true,
                        allowedExtensions: ['png', 'jpeg', 'jpg']);
                if (result == null) {
                  return;
                }

                final file = result.files.first;
                print('Name: ${file.name}');
                print('Path: ${file.path}');
                print('Extension: ${file.extension}');
                print('Size : ${file.size}');
                int sizee = file.size;

                if (sizee <= 200000) {
                  await Provider.of<GallerySendProvider_Stf>(context,
                          listen: false)
                      .galleryImageSave(context, file.path.toString());
                  if (file.name.length >= 6) {
                    setState(() {
                      checkname =
                          file.name.replaceRange(6, file.name.length, '');
                    });

                    print(checkname);
                  }
                } else {
                  print('Size Exceed');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    duration: Duration(seconds: 1),
                    margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      "Size Exceed(Less than 200KB allowed)",
                      textAlign: TextAlign.center,
                    ),
                  ));
                }
              }),
            ),
          ),
        ),
        const Center(
            child: Text(
          'Maximum allowed file size is 200 KB',
          style:
              TextStyle(fontSize: 9, color: Color.fromARGB(255, 241, 104, 94)),
        )),
        Row(
          children: [
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: MaterialButton(
                // minWidth: size.width - 216,
                child: Center(child: Text('From  $time')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeFrom = await showDatePicker(
                    context: context,
                    initialDate: _mydatetimeFrom ?? DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 0)),
                    lastDate: DateTime(2030),
                    builder: (context, child) {
                      return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor: UIGuide.light_Purple,
                            colorScheme: const ColorScheme.light(
                              primary: UIGuide.light_Purple,
                            ),
                            buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary),
                          ),
                          child: child!);
                    },
                  );
                  setState(() {
                    time = DateFormat('dd/MMM/yyyy').format(_mydatetimeFrom!);
                    print(time);
                  });
                }),
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: MaterialButton(
                //  minWidth: size.width - 216,
                child: Center(child: Text('To  $timeNow')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeTo = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 0)),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor: UIGuide.light_Purple,
                            colorScheme: const ColorScheme.light(
                              primary: UIGuide.light_Purple,
                            ),
                            buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary),
                          ),
                          child: child!);
                    },
                  );

                  setState(() {
                    timeNow = DateFormat('dd/MMM/yyyy').format(_mydatetimeTo!);
                    print(timeNow);
                  });
                }),
              ),
            ),
            Spacer()
          ],
        ),
        Row(
          children: [
            Spacer(),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.49,
              child: Consumer<GallerySendProvider_Stf>(
                  builder: (context, snapshot, child) {
                return InkWell(
                  onTap: () async {
                    await Provider.of<GallerySendProvider_Stf>(context,
                            listen: false)
                        .courseClear();
                    await Provider.of<GallerySendProvider_Stf>(context,
                            listen: false)
                        .sendGallery();
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
                                      print(snapshot.courselistt[index].value);

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
                                              .divisionClear();
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: UIGuide.light_Purple, width: 1),
                          ),
                          height: 40,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: coursevalueController1,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 0, top: 0),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Color.fromARGB(255, 238, 237, 237),
                              border: OutlineInputBorder(),
                              labelText: "  Select Course",
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
              child: Consumer<GallerySendProvider_Stf>(
                  builder: (context, snapshot, child) {
                attachmentid = snapshot.id ?? '';
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
                                    itemCount: snapshot.divisionlistt.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        selectedTileColor: Colors.blue.shade100,
                                        selectedColor: UIGuide.PRIMARY2,
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: UIGuide.light_Purple, width: 1),
                          ),
                          height: 40,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: divisionvalueController1,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 0, top: 0),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Color.fromARGB(255, 238, 237, 237),
                              border: OutlineInputBorder(),
                              labelText: "  Select Division",
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
            Spacer()
          ],
        ),
        kheight20,
        kheight20,
        Center(
          child: SizedBox(
            width: 100,
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              minWidth: size.width - 150,
              child: const Text(
                'Save',
                style: TextStyle(color: UIGuide.WHITE, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              color: UIGuide.light_Purple,
              onPressed: (() async {
                if (attachmentid.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    duration: Duration(seconds: 1),
                    margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      'Select Image..',
                      textAlign: TextAlign.center,
                    ),
                  ));
                }
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    duration: Duration(seconds: 1),
                    margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      'Enter Title..',
                      textAlign: TextAlign.center,
                    ),
                  ));
                }
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
