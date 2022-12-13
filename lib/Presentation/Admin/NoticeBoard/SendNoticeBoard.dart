import 'package:Ess_test/Application/AdminProviders/NoticeBoardadmin.dart';
import 'package:Ess_test/Constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../Domain/Admin/Course&DivsionList.dart';
import '../../../utils/constants.dart';

class SendNoticeBoardAdmin extends StatefulWidget {
  const SendNoticeBoardAdmin({Key? key}) : super(key: key);

  @override
  State<SendNoticeBoardAdmin> createState() => _SendNoticeBoardAdminState();
}

class _SendNoticeBoardAdminState extends State<SendNoticeBoardAdmin> {
  String? datee;
  String division = '';
  String course = '';
  DateTime? _mydatetimeFrom;
  DateTime? _mydatetimeTo;
  String time = '--';
  String timeNow = '--';
  String checkname = '';
  List courseData = [];
  List divisionData = [];
  final categoryvalueController = TextEditingController();
  final categoryvalueController1 = TextEditingController();
  final titleController = TextEditingController();
  final mattercontroller = TextEditingController();
  String attach = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<NoticeBoardAdminProvider>(context, listen: false);
      p.getCourseList();
      p.noticeboardCategory();
      p.courseDropDown.clear();
      p.courseList.clear();
      p.divisionList.clear();
      p.divisionDropDown.clear();
      p.courseCounter(0);
      p.divisionCounter(0);
      titleController.clear();
      attachmentid.clear();
    });
  }

  String toggleVal = 'All';
  final attachmentid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    attachmentid.clear();
    var size = MediaQuery.of(context).size;
    datee = DateFormat('dd/MMM/yyyy').format(DateTime.now());

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 41,
              width: size.width * 0.44,
              child: MaterialButton(
                  //  minWidth: size.width - 250,
                  color: Colors.white70,
                  child: Text('Date: ${datee.toString()}'),
                  onPressed: () async {
                    return;
                  }),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                // decoration: BoxDecoration(
                //     border: Border.all(color: UIGuide.light_Purple)),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<NoticeBoardAdminProvider>(
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
                                      itemCount: noticeCategoryAdmin!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () async {
                                            print(
                                                {noticeCategoryAdmin![index]});
                                            categoryvalueController.text =
                                                await noticeCategoryAdmin![
                                                        index]['value'] ??
                                                    '--';
                                            categoryvalueController1.text =
                                                await noticeCategoryAdmin![
                                                        index]['text'] ??
                                                    '--';

                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            noticeCategoryAdmin![index]
                                                    ['text'] ??
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
                                  color: UIGuide.light_Purple, width: 2),
                            ),
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: categoryvalueController1,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: 15),
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: OutlineInputBorder(),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: "  Select Category",
                                labelStyle: TextStyle(color: UIGuide.BLACK),
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
                labelStyle: TextStyle(color: UIGuide.light_Purple),
                hintText: 'Enter Title',
                hintStyle: TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: UIGuide.light_Purple, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                )),
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
                labelStyle: TextStyle(color: UIGuide.light_Purple),
                hintText: 'Enter Matter',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: UIGuide.light_Purple, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ),
        ),
        Row(
          children: [
            Spacer(),
            Center(
              child: SizedBox(
                width: 120,
                child: MaterialButton(
                  // minWidth: size.width - 200,
                  child: Text(checkname.isEmpty ? 'Choose File' : checkname),

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

                    int sizee = file.size;

                    if (sizee <= 200000) {
                      await Provider.of<NoticeBoardAdminProvider>(context,
                              listen: false)
                          .noticeImageSave(context, file.path.toString());
                      //openFile(file);
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
                        "Size Exceed(Less than 200KB allowed)",
                        textAlign: TextAlign.center,
                      )));
                    }
                  }),
                ),
              ),
            ),
            Spacer()
          ],
        ),
        const Center(
            child: Text(
          'Maximum allowed file size is 200 KB',
          style:
              TextStyle(fontSize: 9, color: Color.fromARGB(255, 241, 104, 94)),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              // height: 30,
              width: MediaQuery.of(context).size.width * 0.45,
              child: MaterialButton(
                // minWidth: size.width - 250,
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
            //  kWidth, kWidth,
            SizedBox(
              // height: 30,
              width: MediaQuery.of(context).size.width * 0.45,
              child: MaterialButton(
                //   minWidth: size.width - 250,
                child: Center(child: Text('To  ${timeNow}')),
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
            Consumer<NoticeBoardAdminProvider>(
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
                    selectedItemsTextStyle: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: UIGuide.light_Purple),
                    confirmText: const Text(
                      'OK',
                      style: TextStyle(color: UIGuide.light_Purple),
                    ),
                    cancelText: const Text(
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
                    onConfirm: (result) async {
                      courseData = [];

                      for (var i = 0; i < result.length; i++) {
                        CourseListModel data = result[i] as CourseListModel;
                        print(data.name);
                        print(data.courseId);
                        courseData.add(data.courseId);
                        courseData.map((e) => data.courseId);
                        print("${courseData.map((e) => data.courseId)}");
                      }

                      print("courseData${courseData}");
                      course = courseData.join(',');

                      await Provider.of<NoticeBoardAdminProvider>(context,
                              listen: false)
                          .courseCounter(result.length);

                      // await Provider.of<NoticeBoardAdminProvider>(context,
                      //         listen: false)
                      //     .divisionClear();
                      await Provider.of<NoticeBoardAdminProvider>(context,
                              listen: false)
                          .getDivisionList(course);
                      print(courseData.join('","'));
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            Consumer<NoticeBoardAdminProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width * .43,
                  height: 50,
                  child: MultiSelectDialogField(
                    items: value.divisionDropDown,
                    listType: MultiSelectListType.CHIP,
                    title: const Text(
                      "Select Division",
                      style: TextStyle(color: Colors.black),
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
                    onConfirm: (result) async {
                      //  result.clear();
                      int length = result.length;

                      print(result.length);

                      for (var a = 0; a < result.length; a++) {
                        DivisionListModel data = result[a] as DivisionListModel;
                        print(data.text);
                        print(data.value);
                        divisionData.add(data.value);
                        divisionData.map((e) => data.value);
                        print("${divisionData.map((e) => data.value)}");
                      }
                      division = divisionData.join(',');
                      await Provider.of<NoticeBoardAdminProvider>(context,
                              listen: false)
                          .divisionCounter(result.length);

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
            width: 150,
            child: MaterialButton(
              minWidth: size.width - 150,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: const Text(
                'Save',
                style: TextStyle(color: UIGuide.WHITE),
                textAlign: TextAlign.center,
              ),
              color: UIGuide.light_Purple,
              onPressed: (() async {
                print(attachmentid);
                if (checkname.isEmpty) {
                  attachmentid.clear();
                } else {
                  attachmentid.text = attach;
                }

                //https://api.esstestonline.in/mobileapp/staff/markEntryInitialvalues
                if (titleController.text.isNotEmpty &&
                    course.toString().isNotEmpty &&
                    division.toString().isNotEmpty &&
                    mattercontroller.text.isNotEmpty &&
                    categoryvalueController.text.isNotEmpty &&
                    categoryvalueController1.text.isNotEmpty) {
                  await Provider.of<NoticeBoardAdminProvider>(context,
                          listen: false)
                      .noticeBoardSave(
                          context,
                          datee.toString(),
                          time,
                          timeNow,
                          titleController.text,
                          mattercontroller.text,
                          toggleVal,
                          courseData,
                          divisionData,
                          categoryvalueController.text,
                          attachmentid.text.toString());
                } else {
                  AwesomeDialog(
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
                  print(datee);
                  print(time);
                  print(timeNow);
                  print(titleController);
                  print(mattercontroller);
                  print(categoryvalueController);
                  print(attachmentid);
                  // titleController.clear();
                  // mattercontroller.clear();
                  // categoryvalueController.clear();
                  // categoryvalueController1.clear();
                  // attachmentid.clear();
                }
              }),
            ),
          ),
        ),
      ],
    );
  }
}
