import 'package:Ess_test/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:Ess_test/Application/AdminProviders/dashboardProvider.dart';
import 'package:Ess_test/Application/Module%20Providers.dart/Module.dart';
import 'package:Ess_test/Application/StudentProviders/CurriculamProviders.dart';
import 'package:Ess_test/Presentation/Admin/Communication/ToGuardian.dart';
import 'package:Ess_test/Presentation/Admin/Communication/ToStaff.dart';
import 'package:Ess_test/Presentation/Admin/FlashNews/FlashnewsScreen.dart';
import 'package:Ess_test/Presentation/Admin/Gallery/GalleryScreen.dart';
import 'package:Ess_test/Presentation/Admin/History/NotificationHistoryStaff.dart';
import 'package:Ess_test/Presentation/Admin/MarkentryReport.dart';
import 'package:Ess_test/Presentation/Admin/NoticeBoard/NoticeboardScreen.dart';
import 'package:Ess_test/Presentation/Admin/StudentStatistiics.dart';
import 'package:Ess_test/Presentation/Admin/TimeTable/TimeTableScreen.dart';
import 'package:Ess_test/Presentation/Admin/demo.dart';
import 'package:Ess_test/Presentation/Staff/StudReport.dart';
import 'package:Ess_test/Presentation/Student/CurriculamScreen.dart';
import 'package:Ess_test/Presentation/Student/NoInternetScreen.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/StudentProviders/InternetConnection.dart';
import '../../Constants.dart';
import '../Login_Activation/Login_page.dart';
import '../Student/PasswordChange.dart';
import '../Student/Reportcard.dart';
import 'FeeCollectionReport/FeeReport.dart';
import 'StaffReport.dart';
import 'FeeDetails/StudFeeSearch.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ConnectivityProvider>(context, listen: false);
      Provider.of<ModuleProviders>(context, listen: false).getModuleDetails();
    });

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ConnectivityProvider>(
        builder: (context, connection, child) => connection.isOnline == false
            ? NoInternetConnection()
            : ListView(
                children: [
                  const AdminProfileTop(),
                  Container(
                    width: size.width,
                    height: size.height - 170,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              // color: UIGuide.light_Purple,
                              blurRadius: 5,
                              offset: Offset(1, 3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: const AdminHomeContent(),
                  )
                ],
              ),
      ),
    );
  }
}

class AdminHomeContent extends StatelessWidget {
  const AdminHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(1, 3))],
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              kheight20,
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
                const Text(
                  'Student',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              'Student \n Report',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Student_statistics_admin()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/statistics.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              ' Student\nStatistics',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NonTeachingStaff()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              '    Student \n Information',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
                const Text(
                  "Staff",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Demo()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/payNew.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '       Staff \n Information',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  // kWidth,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StaffReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/payNew.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            ' Staff Report',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  //  kWidth,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MarkentryReportByAdmin()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Mark Entry\n   Report',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
                const Text(
                  "Fees",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeeReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/payNew.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              'Fees Collection \n        Report',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentFeeSearch()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '    Student \nFees Report',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              // Row(children: <Widget>[
              //   Expanded(
              //     child: Container(
              //         margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              //         child: const Divider(
              //           color: Colors.black45,
              //           height: 36,
              //         )),
              //   ),
              //   const Text(
              //     "Attendance",
              //     textAlign: TextAlign.left,
              //     style: TextStyle(
              //         color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
              //   ),
              //   Expanded(
              //     child: Container(
              //         margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              //         child: const Divider(
              //           color: Colors.black45,
              //           height: 36,
              //         )),
              //   ),
              // ]),
              // kheight10,
              // kheight20,
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10, right: 10),
              //         child: GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const ReportCard()),
              //             );
              //           },
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Container(
              //                 height: 50,
              //                 width: 40,
              //                 decoration: BoxDecoration(
              //                   image: const DecorationImage(
              //                     opacity: 20,
              //                     image: AssetImage(
              //                       'assets/Reportcard.png',
              //                     ),
              //                   ),
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //               ),
              //               kheight10,
              //               const Text(
              //                 'Taken or Not\nTaken Report',
              //                 style: TextStyle(
              //                     fontSize: 11, color: Colors.black38),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10, right: 10),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Container(
              //               height: 50,
              //               width: 40,
              //               decoration: const BoxDecoration(
              //                 image: DecorationImage(
              //                   opacity: 20,
              //                   image: AssetImage(
              //                     'assets/Profilee.png',
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             kheight10,
              //             const Text(
              //               '     Absent & \nPresent Report',
              //               style:
              //                   TextStyle(fontSize: 11, color: Colors.black38),
              //             )
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10, right: 10),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Container(
              //               height: 50,
              //               width: 40,
              //               decoration: const BoxDecoration(
              //                 image: DecorationImage(
              //                   opacity: 20,
              //                   image: AssetImage(
              //                     'assets/Profilee.png',
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             kheight10,
              //             const Text(
              //               '    Staff \nAttendance',
              //               style:
              //                   TextStyle(fontSize: 11, color: Colors.black38),
              //             )
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              kheight10,
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
                const Text(
                  "Communication",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminToStaff()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/staff notification.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'To Staff',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminToGuardian()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'To Guardian',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10, right: 10),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => ScreenTimeTable()),
                  //       );
                  //     },
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Container(
                  //           height: 50,
                  //           width: 40,
                  //           decoration: const BoxDecoration(
                  //             image: DecorationImage(
                  //               opacity: 20,
                  //               image: AssetImage(
                  //                 'assets/Profilee.png',
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         kheight10,
                  //         const Text(
                  //           '   Upload\nTimetable',
                  //           style:
                  //               TextStyle(fontSize: 11, color: Colors.black38),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationHistory()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Reportcard.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Notification\n     History',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminGallery()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Gallery.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenFlashNews()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Flash News',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoticeBoardAdnin()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    opacity: 20,
                                    image: AssetImage(
                                      'assets/Profilee.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'NoticeBoard',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<Curriculamprovider>(
                    builder: (context, curri, child) => GestureDetector(
                      onTap: () async {
                        await Provider.of<Curriculamprovider>(context,
                                listen: false)
                            .getCuriculamtoken();
                        String token = await curri.token.toString();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurriculamPage(
                                    token: token,
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      opacity: 20,
                                      image: AssetImage(
                                        'assets/Curriculum.png',
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            kheight10,
                            const Text(
                              'Curriculum',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
                const Text(
                  "Change Password / SignOut",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: UIGuide.light_Purple, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black45,
                        height: 36,
                      )),
                ),
              ]),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      elevation: 10,
                      minWidth: 50,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PasswordChange()),
                        );
                      },
                      child: const Icon(
                        Icons.key_sharp,
                        color: UIGuide.light_Purple,
                      )),
                  MaterialButton(
                      minWidth: 50,
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () async {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          borderSide: const BorderSide(
                              color: UIGuide.light_Purple, width: 2),
                          buttonsBorderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          title: 'SignOut',
                          desc: 'Are you sure want to sign out',
                          showCloseIcon: true,
                          btnCancelOnPress: () {
                            return;
                          },
                          btnOkOnPress: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            print("accesstoken  $prefs");
                            prefs.remove("accesstoken");

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (Route<dynamic> route) => false);
                          },
                        ).show();
                      },
                      child: const Icon(
                        Icons.logout_outlined,
                        color: UIGuide.light_Purple,
                      )),
                ],
              ),
              kheight20,
              kheight20
            ],
          ),
        ),
      ],
    );
  }
}

class AdminProfileTop extends StatefulWidget {
  const AdminProfileTop({Key? key}) : super(key: key);

  @override
  State<AdminProfileTop> createState() => _AdminProfileTopState();
}

class _AdminProfileTopState extends State<AdminProfileTop> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<DashboardAdmin>(context, listen: false);
      p.getDashboard();
      var m = Provider.of<SchoolPhotoProviders>(context, listen: false);
      m.getSchoolPhoto();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CarouselSlider(
        items: [
          Container(
            width: size.width,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFc2e59c), Color(0xFF64b3f4)]),
                // color: UIGuide.light_Purple,
                border: Border.all(color: UIGuide.THEME_LIGHT),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Consumer<DashboardAdmin>(
              builder: (context, value, child) => value.loading
                  ? const spinkitLoader()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Student Info',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 37, 37, 117),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  kheight10,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Total Strength:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.totalStudentStrength == null
                                              ? '--'
                                              : value.totalStudentStrength
                                                  .toString(),
                                          style: const TextStyle(
                                              color: UIGuide.light_Purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Boys Strength:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.boysStrength == null
                                              ? '--'
                                              : value.boysStrength.toString(),
                                          style: const TextStyle(
                                              color: UIGuide.light_Purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Girls Strength:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.girlsStrength == null
                                              ? '--'
                                              : value.girlsStrength.toString(),
                                          style: const TextStyle(
                                              color: UIGuide.light_Purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 100,
                              width: 85,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/cardstudent.png"))),
                            ),
                            Spacer(),
                          ]),
                        ],
                      ),
                    ),
            ),
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 79, 93, 223),
                  Color.fromARGB(255, 98, 195, 219),
                ]),
                border: Border.all(color: UIGuide.THEME_LIGHT),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Consumer<DashboardAdmin>(
                builder: (context, value, child) => value.loading
                    ? spinkitLoader()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Staff Info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 37, 37, 117),
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      kheight10,
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Total Strength:  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              value.totalStaffStrength == null
                                                  ? '--'
                                                  : value.totalStaffStrength
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              '  Teaching  :  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              value.teachingStrength == null
                                                  ? '--'
                                                  : value.teachingStrength
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Non-Teaching:  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              value.nonTeachingStrength == null
                                                  ? '--'
                                                  : value.nonTeachingStrength
                                                      .toString(),
                                              style: TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 100,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/Staffdb1.png"))),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      )),
          ),
          Consumer<SchoolPhotoProviders>(
            builder: (context, value, child) => Container(
              width: size.width,
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(value.url ??
                      "https://previews.123rf.com/images/dualororua/dualororua1707/dualororua170700237/82718617-happy-school-children-in-front-of-school-building.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: 150.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.easeInBack,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 700),
          viewportFraction: 0.75,
        ),
      ),
    );
  }
}
