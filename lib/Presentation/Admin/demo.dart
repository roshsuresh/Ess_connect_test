import 'dart:async';
import 'dart:developer';

import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Application/AdminProviders/NoticeBoardadmin.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
        child: CustomScrollView(
          //   controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              primary: false,
              expandedHeight: 75,
              backgroundColor: Color(0xFFf4eedd),
              floating: true,
              actions: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/banner.png'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
          ],
        ),
        onRefresh: _refreshLocalGallery);
  }

  Future<Null> _refreshLocalGallery() async {
    print('refreshing stocks...');
  }

// @override

  //  StreamBuilder<ConnectivityResult>(
  //     stream: Connectivity().onConnectivityChanged,
  //     builder: (context, snapshot) {
  //       return Scaffold(
  //         body: snapshot.data == ConnectivityResult.none
  //             ? const Center(child: Text('No Internet Connection'))
  //             : const Center(child: Text('Internect Connection')),
  //       );

}

// @override
// void initState() {
//   super.initState();
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
//     p.stdReportSectionStaff();
//     p.courseDrop.clear();
//     p.divisionDrop.clear();
//     p.dropDown.clear();
//     p.stdReportInitialValues.clear();
//     p.courselist.clear();
//     p.divisionlist.clear();
//   });
// }

// final TextEditingController controller = new TextEditingController();

// List subjectData = [];
// List diviData = [];
// List courseData = [];

// String courseId = '';

// var i = 0;

// @override
// Widget build(BuildContext context) {
//   var size = MediaQuery.of(context).size;
//   return Scaffold(
//       body: ListView(
//     children: [
//       Row(
//         children: [
//           Consumer<SchoolPhotoProviders>(
//             builder: (context, value, child) => Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: SizedBox(
//                 width: size.width * .42,
//                 height: 50,
//                 child: MultiSelectDialogField(
//                   // height: 200,
//                   items: value.dropDown,

//                   listType: MultiSelectListType.CHIP,
//                   title: const Text(
//                     "Select Section",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   selectedItemsTextStyle: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       color: UIGuide.light_Purple),
//                   confirmText: Text(
//                     'OK',
//                     style: TextStyle(color: UIGuide.light_Purple),
//                   ),
//                   cancelText: Text(
//                     'Cancel',
//                     style: TextStyle(color: UIGuide.light_Purple),
//                   ),
//                   separateSelectedItems: true,
//                   //  checkColor: Colors.lightBlue,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 2,
//                     ),
//                   ),
//                   buttonIcon: const Icon(
//                     Icons.arrow_drop_down_outlined,
//                     color: Colors.grey,
//                   ),
//                   buttonText: Text(
//                     "Select Section",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                   ),
//                   chipDisplay: MultiSelectChipDisplay.none(),
//                   onConfirm: (results) async {
//                     subjectData = [];
//                     for (i = 0; i < results.length; i++) {
//                       StudReportSectionList data =
//                           results[i] as StudReportSectionList;
//                       print(data.text);
//                       print(data.value);
//                       subjectData.add(data.value);
//                       subjectData.map((e) => data.value);
//                       print("${subjectData.map((e) => data.value)}");
//                     }
//                     String section = subjectData.join('&');

//                     await Provider.of<SchoolPhotoProviders>(context,
//                             listen: false)
//                         .getCourseList(section);
//                     print("data $subjectData");

//                     print(subjectData.join('&'));
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Spacer(),
//           Consumer<SchoolPhotoProviders>(
//             builder: (context, value, child) => Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: SizedBox(
//                 width: size.width * .42,
//                 height: 50,
//                 child: MultiSelectDialogField(
//                   // height: 200,
//                   items: value.courseDrop,
//                   listType: MultiSelectListType.CHIP,
//                   title: const Text(
//                     "Select Course",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   // selectedColor: Color.fromARGB(255, 157, 232, 241),
//                   selectedItemsTextStyle: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       color: UIGuide.light_Purple),
//                   confirmText: Text(
//                     'OK',
//                     style: TextStyle(color: UIGuide.light_Purple),
//                   ),
//                   cancelText: Text(
//                     'Cancel',
//                     style: TextStyle(color: UIGuide.light_Purple),
//                   ),
//                   separateSelectedItems: true,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 2,
//                     ),
//                   ),
//                   buttonIcon: const Icon(
//                     Icons.arrow_drop_down_outlined,
//                     color: Colors.grey,
//                   ),
//                   buttonText: Text(
//                     "Select Course",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                   ),
//                   chipDisplay: MultiSelectChipDisplay.none(),
//                   onConfirm: (results) async {
//                     diviData = [];
//                     for (i = 0; i < results.length; i++) {
//                       StudReportCourse data = results[i] as StudReportCourse;
//                       print(data.value);
//                       print(data.text);
//                       diviData.add(data.value);
//                       diviData.map((e) => data.value);
//                       print("${diviData.map((e) => data.value)}");
//                     }
//                     String course = diviData.join('&');
//                     await Provider.of<SchoolPhotoProviders>(context,
//                             listen: false)
//                         .getDivisionList(course);

//                     print(diviData.join('&'));
//                   },
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       Row(
//         children: [
//           Consumer<SchoolPhotoProviders>(
//             builder: (context, value, child) => Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10),
//               child: SizedBox(
//                 width: size.width * .42,
//                 height: 50,
//                 child: MultiSelectDialogField(
//                   items: value.divisionDrop,
//                   listType: MultiSelectListType.CHIP,
//                   title: const Text(
//                     "Select Division",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   // selectedColor: Color.fromARGB(255, 157, 232, 241),
//                   selectedItemsTextStyle: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       color: UIGuide.light_Purple),
//                   confirmText: Text(
//                     'OK',
//                     style: TextStyle(color: UIGuide.light_Purple),
//                   ),
//                   cancelText: Text(
//                     'Cancel',
//                     style: TextStyle(color: UIGuide.light_Purple),
//                   ),
//                   separateSelectedItems: true,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 2,
//                     ),
//                   ),
//                   buttonIcon: const Icon(
//                     Icons.arrow_drop_down_outlined,
//                     color: Colors.grey,
//                   ),
//                   buttonText: const Text(
//                     "Select Division",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                   ),
//                   chipDisplay: MultiSelectChipDisplay.none(),
//                   onConfirm: (results) {
//                     courseData = [];
//                     for (i = 0; i < results.length; i++) {
//                       StudReportDivision data =
//                           results[i] as StudReportDivision;
//                       print(data.text);
//                       print(data.value);
//                       courseData.add(data.value);
//                       courseData.map((e) => data.value);
//                       print("${courseData.map((e) => data.value)}");
//                     }
//                     String div = courseData.join('&');
//                     // Provider.of<SchoolPhotoProviders>(context, listen: false)
//                     //     .getCourseList(div);
//                     print("data $courseData");

//                     print(courseData.join('&'));
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 10),
//             child: SizedBox(
//               width: size.width * .42,
//               height: 44,
//               child: MaterialButton(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                 onPressed: () {},
//                 color: UIGuide.THEME_LIGHT,
//                 child: Text('View'),
//               ),
//             ),
//           )
//         ],
//       ),
//       TextField(
//           controller: controller,
//           decoration: new InputDecoration(
//               hintText: "Password",
//               border: new OutlineInputBorder(borderSide: BorderSide()))),
//       kheight20,
//       FlutterPwValidator(
//         controller: controller,
//         minLength: 8,
//         uppercaseCharCount: 1,
//         numericCharCount: 1,
//         specialCharCount: 1,
//         normalCharCount: 3,
//         width: 300,
//         height: 120,
//         onSuccess: () {
//           print("MATCHED");
//           ScaffoldMessenger.of(context).showSnackBar(
//               new SnackBar(content: new Text("Password is matched")));
//         },
//         onFail: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//               new SnackBar(content: new Text("Password not matched")));
//           print("NOT MATCHED");
//         },
//       ),
//     ],
//   ));
// }
