import 'package:Ess_test/Application/AdminProviders/GalleryProviders.dart';
import 'package:Ess_test/Application/Staff_Providers/GallerySendProviderStaff.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Domain/Admin/Course&DivsionList.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AdminGalleryUpload extends StatefulWidget {
  AdminGalleryUpload({Key? key}) : super(key: key);

  @override
  State<AdminGalleryUpload> createState() => _AdminGalleryUploadState();
}

class _AdminGalleryUploadState extends State<AdminGalleryUpload> {
  List courseData = [];
  List divisionData = [];
  String course = '';
  String division = '';
  DateTime? _mydatetime;

  String? datee;

  DateTime? _mydatetimeFrom;

  DateTime? _mydatetimeTo;

  String time = '--';

  String timeNow = '--';

  String? checkname;
  final titleController = TextEditingController();
  final attachmentid = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<GalleryProviderAdmin>(context, listen: false);
      p.getCourseList();
      p.courseDropDown.clear();
      p.courseList.clear();
      p.divisionList.clear();
      p.divisionDropDown.clear();
      titleController.clear();
      attachmentid.clear();
      p.divisionCounter(0);
      p.courseCounter(0);
    });
  }

  String attach = '';
  String toggleVal = 'All';
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
              labelStyle: TextStyle(color: UIGuide.light_Purple),
              hintText: 'Enter Title',
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: UIGuide.light_Purple, width: 2.0),
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
                final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpeg', 'jpg']);
                if (result == null) {
                  return;
                }
                final file = result.files.first;
                print('Name: ${file.name}');
                print('Path: ${file.path}');
                print('Extension: ${file.extension}');

                int sizee = file.size;

                if (sizee <= 200000) {
                  await Provider.of<GalleryProviderAdmin>(context,
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
                      content: Text(
                    "Size Exceed (Less than 200KB allowed)",
                    textAlign: TextAlign.center,
                  )));
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
        kheight10,
        Row(
          children: [
            Spacer(),
            SizedBox(
              width: size.width * .45,
              height: 35,
              child: MaterialButton(
                //  minWidth: size.width - 216,
                child: Center(child: Text('From  $time')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeFrom = await showDatePicker(
                      context: context,
                      initialDate: _mydatetimeFrom ?? DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 0)),
                      lastDate: DateTime(2030));
                  setState(() {
                    time = DateFormat('dd/MMM/yyyy').format(_mydatetimeFrom!);
                    print(time);
                  });
                }),
              ),
            ),
            Spacer(),
            SizedBox(
              width: size.width * .45,
              height: 35,
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
            Consumer<GalleryProviderAdmin>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width * .43,
                  height: 50,
                  child: MultiSelectDialogField(
                    // height: 200,
                    items: value.courseDropDown,
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    buttonIcon: const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    ),
                    buttonText: value.courseLen == 0
                        ? const Text(
                            "Select Course",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            "   ${value.courseLen.toString()} Selected",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                    chipDisplay: MultiSelectChipDisplay.none(),
                    onConfirm: (results) async {
                      courseData = [];
                      for (var i = 0; i < results.length; i++) {
                        CourseListModel data = results[i] as CourseListModel;
                        print(data.name);
                        print(data.courseId);
                        courseData.add(data.courseId);
                        courseData.map((e) => data.courseId);
                        print("${courseData.map((e) => data.courseId)}");
                      }
                      print("courseData${courseData}");
                      course = courseData.join(',');
                      // await Provider.of<GalleryProviderAdmin>(context,
                      //         listen: false)
                      //     .divisionClear();
                      await Provider.of<GalleryProviderAdmin>(context,
                              listen: false)
                          .courseCounter(results.length);
                      await Provider.of<GalleryProviderAdmin>(context,
                              listen: false)
                          .getDivisionList(course);
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            Consumer<GalleryProviderAdmin>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width * .43,
                  height: 50,
                  child: MultiSelectDialogField(
                    // height: 200,
                    items: value.divisionDropDown,
                    listType: MultiSelectListType.CHIP,
                    title: const Text(
                      "Select Division",
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    buttonIcon: const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    ),
                    buttonText: value.divisionLen == 0
                        ? const Text(
                            "Select Division",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            "   ${value.divisionLen.toString()} Selected",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                    chipDisplay: MultiSelectChipDisplay.none(),
                    onConfirm: (results) async {
                      divisionData = [];
                      for (var i = 0; i < results.length; i++) {
                        DivisionListModel data =
                            results[i] as DivisionListModel;
                        print(data.text);
                        print(data.value);
                        divisionData.add(data.value);
                        divisionData.map((e) => data.value);
                        print("${divisionData.map((e) => data.value)}");
                      }
                      division = divisionData.join(',');
                      await Provider.of<GalleryProviderAdmin>(context,
                              listen: false)
                          .divisionCounter(results.length);
                      print(divisionData.join(','));
                      attach = value.id.toString();
                    },
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
        kheight10,
        Center(
          child: ToggleSwitch(
            labels: ['All', "Students", 'Staff'],
            onToggle: (index) {
              print('Swiched index $index');
              if (index == 0) {
                toggleVal = 'All';
                print(toggleVal);
              } else if (index == 1) {
                toggleVal = 'student';
                print(toggleVal);
              } else {
                toggleVal = 'staff';
                print(toggleVal);
              }
            },
            fontSize: 14,
            minHeight: 30,
            minWidth: 150,
            activeBgColor: [UIGuide.light_Purple],
          ),
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
                if (checkname!.isEmpty) {
                  attachmentid.clear();
                } else {
                  attachmentid.text = attach;
                }
                if (titleController.text.isNotEmpty &&
                    course.toString().isNotEmpty &&
                    division.toString().isNotEmpty &&
                    attachmentid.toString().isNotEmpty) {
                  await Provider.of<GalleryProviderAdmin>(context,
                          listen: false)
                      .gallerySave(
                          context,
                          datee.toString(),
                          time,
                          timeNow,
                          titleController.text,
                          courseData,
                          divisionData,
                          toggleVal.toString(),
                          attachmentid.text.toString());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Please enter mandatory fields',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 1),
                  ));
                }

                print(datee);
                print(time);
                print(timeNow);
                print(titleController);
                print(attachmentid);
                titleController.clear();
                courseData.clear();
                divisionData.clear();
                attachmentid.clear();

                if (attachmentid.toString().isEmpty) {
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
