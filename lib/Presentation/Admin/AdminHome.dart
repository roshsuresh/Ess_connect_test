import 'package:Ess_test/Domain/Admin/DashboardModel.dart';
import 'package:Ess_test/Presentation/Admin/StudentStatistiics.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants.dart';
import '../Login_Activation/Login_page.dart';
import '../Student/AdvancePay.dart';
import '../Student/Attendence.dart';
import '../Student/PasswordChange.dart';

import '../Student/Reportcard.dart';

import 'FeeReport.dart';
import 'StaffInfo.dart';
import 'StaffReport.dart';
import 'StudReport.dart';
import 'StudentFeeDetails.dart';
import 'StudentReport.dart';

class AdminHome extends StatelessWidget {
  AdminHome({Key? key}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
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
              color: Colors.white,
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
                        MaterialPageRoute(
                            builder: (context) => StudentReport()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profilee.png',
                                ),
                              ),
                              // borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              'Student \n Report',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
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
                            //  builder: (context) => Stud_Notification()),
                            builder: (context) => Student_statistics_admin()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/notification.png',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              ' Student\nStatistics',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
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
                            builder: (context) => const Attendence()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profile.png',
                                ),
                              ),
                              // borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          kheight10,
                          Center(
                            child: const Text(
                              '    Student \n Information',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffInfo()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  opacity: 20,
                                  image: AssetImage(
                                    'assets/pay.png',
                                  ),
                                ),
                              ),
                            ),
                            kheight10,
                            const Text(
                              '       Staff \n Information',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                    kWidth,
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StaffReport()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 40,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  opacity: 20,
                                  image: AssetImage(
                                    'assets/pay.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight10,
                            const Text(
                              ' Staff Report',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                    kWidth,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdvancePay()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  opacity: 20,
                                  image: AssetImage(
                                    'assets/Profile.png',
                                  ),
                                ),
                              ),
                            ),
                            kheight10,
                            const Text(
                              'Class Teacher\n       Report',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/payNew.png',
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Center(
                            child: Text(
                              'Fees Collection \n        Report',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StudFeeDetails()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profile.png',
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '    Student \nFees Report',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
                          ),
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
                  "Attendence",
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
              kheight20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Reportcard.png',
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '   Student\nAttendence',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReportCard()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 40,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  opacity: 20,
                                  image: AssetImage(
                                    'assets/Reportcard.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight10,
                            const Text(
                              'Taken or Not\nTaken Report',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profile.png',
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '     Absent & \nPresent Report',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profile.png',
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            '    Staff \nAttendence',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              opacity: 20,
                              image: AssetImage(
                                'assets/staff notification.png',
                              ),
                            ),
                          ),
                        ),
                        kheight10,
                        const Text(
                          'To Staff',
                          style: TextStyle(fontSize: 11, color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminStudReport()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profile.png',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'To Guardian',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              opacity: 20,
                              image: AssetImage(
                                'assets/Profile.png',
                              ),
                            ),
                          ),
                        ),
                        kheight10,
                        const Text(
                          '   Upload\nTimetable',
                          style: TextStyle(fontSize: 11, color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              opacity: 20,
                              image: AssetImage(
                                'assets/Profile.png',
                              ),
                            ),
                          ),
                        ),
                        kheight10,
                        const Text(
                          'Gallery',
                          style: TextStyle(fontSize: 11, color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              kheight10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminStudReport()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 20,
                                image: AssetImage(
                                  'assets/Profile.png',
                                ),
                              ),
                            ),
                          ),
                          kheight10,
                          const Text(
                            'Flash News',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              opacity: 20,
                              image: AssetImage(
                                'assets/Profile.png',
                              ),
                            ),
                          ),
                        ),
                        kheight10,
                        const Text(
                          'NoticeBoard',
                          style: TextStyle(fontSize: 11, color: Colors.black38),
                        )
                      ],
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
                  "Password Change / SignOut",
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
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
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        print("accesstoken  $prefs");
                        prefs.remove("accesstoken");

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false);
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

class AdminProfileTop extends StatelessWidget {
  const AdminProfileTop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<Dashboard>(
        builder: (context, value, child) {
          int tt= value.totalStudentStrength;
          return CarouselSlider(

            items: [
              Container(
                width: size.width,
                //  width: wwidth,
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                    Border.all(color: const Color.fromARGB(255, 210, 199, 240)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: const [
                    Text(
                      'Student Info',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 37, 37, 117)),
                    ),
                    Text("Total Strength :",
                    ),

                  ],
                ),
              ),
              Container(
                width: size.width,
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                    Border.all(color: const Color.fromARGB(255, 210, 199, 240)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Staff Info',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 37, 37, 117)),
                    ),
                    //kheight10,
                  ],
                ),
              ),
              Container(
                width: size.width,
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://previews.123rf.com/images/dualororua/dualororua1707/dualororua170700237/82718617-happy-school-children-in-front-of-school-building.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 140.0,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              //  autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          );
        }
      ),
    );
  }
}
