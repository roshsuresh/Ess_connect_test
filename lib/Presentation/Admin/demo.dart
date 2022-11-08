import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: UIGuide.light_Purple,
        title: Text(''),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Name: ',
                  style: TextStyle(fontSize: 15),
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    strutStyle: StrutStyle(fontSize: 13.0),
                    text: TextSpan(
                        style: TextStyle(
                            color: UIGuide.light_Purple,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        text: 'Ravidranath@gmail.com (compile: 56 ms,.'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Adm No: ',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '879684',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UIGuide.light_Purple),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Division: ',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'IV',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UIGuide.light_Purple),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Date: ',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '12/65/2022',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: UIGuide.light_Purple),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Order Id: ',
                  style: TextStyle(fontSize: 15),
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    strutStyle: StrutStyle(fontSize: 13.0),
                    text: TextSpan(
                        style: TextStyle(
                            color: UIGuide.light_Purple,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        text: '84654648746548484'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Transaction Id: ',
                  style: TextStyle(fontSize: 15),
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    strutStyle: StrutStyle(fontSize: 13.0),
                    text: TextSpan(
                        style: TextStyle(
                            color: UIGuide.light_Purple,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        text: '8465464646465464654658746548484'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: UIGuide.light_Purple, width: .1),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Text(
                    'School Fees',
                    style: TextStyle(
                        color: UIGuide.light_Purple,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted,
                        fontSize: 18),
                  ),
                  LimitedBox(
                    maxHeight: 150,
                    child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Term 1',
                                  style: TextStyle(color: UIGuide.light_Purple),
                                ),
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                title: Text('Amount to be Paid'),
                                trailing: Text('3500.00'),
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                title: Text('Paid Amount'),
                                trailing: Text('3500.00'),
                              )
                            ],
                          );
                        })),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: UIGuide.light_Purple, width: .1),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Text(
                    'Bus Fees',
                    style: TextStyle(
                        color: UIGuide.light_Purple,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted,
                        fontSize: 18),
                  ),
                  LimitedBox(
                    maxHeight: 150,
                    child: ListView.builder(
                        itemCount: 12,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'August',
                                  style: TextStyle(color: UIGuide.light_Purple),
                                ),
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                horizontalTitleGap: 0,
                                title: Text('Amount to be Paid'),
                                trailing: Text('3500.00'),
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                title: Text('Paid Amount'),
                                trailing: Text('3500.00'),
                              )
                            ],
                          );
                        })),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
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
