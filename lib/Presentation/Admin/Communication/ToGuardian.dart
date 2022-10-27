import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Presentation/Admin/Communication/TextSMS_Guard.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Application/AdminProviders/SchoolPhotoProviders.dart';
import '../../../Domain/Staff/StudentReport_staff.dart';

class AdminToGuardian extends StatelessWidget {
  AdminToGuardian({Key? key}) : super(key: key);
  String? valuee;
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Communication to Guardian',
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 45.2,
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
                text: "Notification",
              ),
              Tab(text: "Text SMS"),
            ],
          ),
          backgroundColor: UIGuide.light_Purple,
        ),
        body: TabBarView(
          children: [
            // Consumer<NotificationToGuardian_Providers>(
            //   builder: (context, value, child) {
            //     if (value.isClassTeacher != false) {
            //       return
            Notification_AdminToGuardain(),

            TextSMSGuardian()
          ],
        ),
      ),
    );
  }
}

//Notification To guard

class Notification_AdminToGuardain extends StatelessWidget {
  Notification_AdminToGuardain({Key? key}) : super(key: key);

  // @override
  List subjectData = [];

  List diviData = [];

  List courseData = [];

  String courseId = '';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
      p.stdReportSectionStaff();
      p.courseDrop.clear();
      p.divisionDrop.clear();
      p.dropDown.clear();
      p.stdReportInitialValues.clear();
      p.courselist.clear();
      p.divisionlist.clear();
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                    //  checkColor: Colors.lightBlue,
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
                      String section = subjectData.join('&');
                      await Provider.of<SchoolPhotoProviders>(context,
                              listen: false)
                          .getCourseList(section);
                      print("data $subjectData");

                      print(subjectData.join('&'));
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
                        StudReportCourse data = results[i] as StudReportCourse;
                        print(data.value);
                        print(data.text);
                        diviData.add(data.value);
                        diviData.map((e) => data.value);
                        print("${diviData.map((e) => data.value)}");
                      }
                      String course = diviData.join('&');
                      await Provider.of<SchoolPhotoProviders>(context,
                              listen: false)
                          .getDivisionList(course);

                      print(diviData.join('&'));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Consumer<SchoolPhotoProviders>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: SizedBox(
                  width: size.width * .42,
                  height: 50,
                  child: MultiSelectDialogField(
                    items: value.divisionDrop,
                    listType: MultiSelectListType.CHIP,
                    title: const Text(
                      "Select Division",
                      style: TextStyle(color: Colors.grey),
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
                    buttonText: const Text(
                      "Select Division",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    chipDisplay: MultiSelectChipDisplay.none(),
                    onConfirm: (results) {
                      courseData = [];
                      for (var i = 0; i < results.length; i++) {
                        StudReportDivision data =
                            results[i] as StudReportDivision;
                        print(data.text);
                        print(data.value);
                        courseData.add(data.value);
                        courseData.map((e) => data.value);
                        print("${courseData.map((e) => data.value)}");
                      }
                      String div = courseData.join('&');
                      // Provider.of<SchoolPhotoProviders>(context, listen: false)
                      //     .getCourseList(div);
                      print("data $courseData");

                      print(courseData.join('&'));
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: SizedBox(
                width: size.width * .42,
                height: 44,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: () {},
                  color: UIGuide.THEME_LIGHT,
                  child: Text('View'),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
