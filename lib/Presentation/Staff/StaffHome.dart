import 'package:Ess_test/Application/StudentProviders/CurriculamProviders.dart';
import 'package:Ess_test/Application/StudentProviders/InternetConnection.dart';
import 'package:Ess_test/Presentation/Staff/ScreenNotification.dart';
import 'package:Ess_test/Presentation/Student/CurriculamScreen.dart';
import 'package:Ess_test/Presentation/Student/NoInternetScreen.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/Staff_Providers/StaffFlashnews.dart';
import '../../Application/Staff_Providers/StaffProfile.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';
import '../Login_Activation/Login_page.dart';
import '../Student/PasswordChange.dart';
import 'GalleryUpload.dart';
import 'MarkEntry.dart';
import 'MarkEntryReport/MarkEntryReport.dart';
import 'NoticeBoard.dart';
import 'StaffProfile.dart';
import 'StaffTimeTable.dart';
import 'StudAttendenceEntry.dart';
import 'StudReport.dart';
import 'ToGuardian.dart';

class StaffHome extends StatefulWidget {
  StaffHome({Key? key}) : super(key: key);

  @override
  State<StaffHome> createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Consumer<ConnectivityProvider>(
          builder: (context, connection, child) => connection.isOnline == false
              ? NoInternetConnection()
              : ListView(
                  children: [
                    StaffProfile(), //  <--<---  StaffProfile....
                    StaffFlashNews(),
                    Container(
                      width: size.width,
                      height: size.height - 200,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(1, 3))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: ListView(
                        children: [
                          kheight20,
                          kheight10,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StaffProfileView()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
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
                                        'Profile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
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
                                        builder: (context) => StudReport()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 38,
                                            width: 38,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/Attendance.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      kheight10,
                                      const Text(
                                        'Student \n Report',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Staff_Timetable()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 38,
                                            width: 38,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/Timetable.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      kheight10,
                                      const Text(
                                        'Timetable',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StaffNotificationScreen()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 38,
                                            width: 38,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/notificationnew.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      kheight10,
                                      const Text(
                                        'Notifications',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          kheight10,
                          kheight20,
                          Container(
                            color: Color.fromARGB(255, 236, 237, 245),
                            height: 170,
                            width: size.width,
                            child: Column(
                              children: [
                                kheight10,
                                Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 20.0),
                                        child: const Divider(
                                          color: UIGuide.light_Purple,
                                          height: 36,
                                        )),
                                  ),
                                  Text(
                                    " * Entries * ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: UIGuide.light_Purple,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Expanded(
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 20.0),
                                        child: const Divider(
                                          color: UIGuide.light_Purple,
                                          height: 36,
                                        )),
                                  ),
                                ]),
                                kheight10,
                                kheight10,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AttendenceEntry()),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Card(
                                              elevation: 10,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      opacity: 20,
                                                      image: AssetImage(
                                                        'assets/Attendance.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            kheight10,
                                            const Text(
                                              'Attendance',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Colors.black),
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
                                              builder: (context) =>
                                                  const MarkEntry()),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Card(
                                              elevation: 10,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/Marksheet.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            kheight10,
                                            const Text(
                                              'Mark Entry',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Colors.black),
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
                                              builder: (context) =>
                                                  MarkEntryReport()),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Card(
                                              elevation: 10,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration: BoxDecoration(
                                                    image:
                                                        const DecorationImage(
                                                      image: AssetImage(
                                                        'assets/Reportcard.png',
                                                      ),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            kheight10,
                                            const Text(
                                              'Mark Entry \n   Report',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //kheight10,
                          kheight20,
                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: UIGuide.light_Purple,
                                    height: 36,
                                  )),
                            ),
                            const Text(
                              "Communication",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: UIGuide.light_Purple,
                                  fontWeight: FontWeight.w900),
                            ),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: const Divider(
                                    color: UIGuide.light_Purple,
                                    height: 36,
                                  )),
                            ),
                          ]),
                          kheight10,
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
                                        builder: (context) =>
                                            Staff_ToGuardian()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
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
                                        'To Guardian',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StaffNoticeBoard()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
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
                                                  'assets/Noticeboard.png',
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      kheight10,
                                      const Text(
                                        'Notice Board',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
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
                                        builder: (context) =>
                                            const StaffGallery()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
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
                                        'Gallery ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Consumer<Curriculamprovider>(
                                builder: (context, curri, child) =>
                                    GestureDetector(
                                  onTap: () async {
                                    await Provider.of<Curriculamprovider>(
                                            context,
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          elevation: 10,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        kheight10,
                                        const Text(
                                          'Curriculum',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          kheight10,
                          kheight20,
                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: Colors.black,
                                    height: 36,
                                  )),
                            ),
                            const Text(
                              "Change Password/ SignOut",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: UIGuide.light_Purple,
                                  fontWeight: FontWeight.w900),
                            ),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: const Divider(
                                    color: Colors.black,
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () async {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PasswordChange()),
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () async {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      borderSide: const BorderSide(
                                          color: UIGuide.light_Purple,
                                          width: 2),
                                      buttonsBorderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(2)),
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
                                            await SharedPreferences
                                                .getInstance();
                                        print("accesstoken  $prefs");
                                        prefs.remove("accesstoken");

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()),
                                                (Route<dynamic> route) =>
                                                    false);
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
                          kheight20, kheight10,
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class StaffProfile extends StatelessWidget {
  const StaffProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<StaffProfileProvider>(context, listen: false);
      p.staff_profileData();
    });
    var size = MediaQuery.of(context).size;
    const Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 7, 110, 206);
    final Color fill2 = Color.fromARGB(255, 164, 197, 247);

    final List<Color> gradient = [
      fill1,
      fill2,
    ];
    final double fillPercent = 35;
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [
      0.0,
      fillStop,
    ];
    return Column(
      children: [
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
              height: 140,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(50),
              )),
              child: AnimateGradient(
                // primaryBegin: Alignment.topLeft,
                // primaryEnd: Alignment.bottomLeft,
                // secondaryBegin: Alignment.bottomLeft,
                // secondaryEnd: Alignment.topRight,
                primaryColors: const [
                  Color.fromARGB(255, 143, 193, 240),
                  Color.fromARGB(255, 131, 142, 238),
                  Color.fromARGB(255, 99, 101, 235),
                ],
                secondaryColors: const [
                  Color.fromARGB(255, 60, 78, 240),
                  Color.fromARGB(255, 111, 125, 248),
                  UIGuide.light_Purple,
                ],
                child: Consumer<StaffProfileProvider>(
                  builder: (context, value, child) => value.loading
                      ? spinkitLoader()
                      : Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    // opacity: 20,
                                    image: NetworkImage(value.photo == null
                                        ? 'https://plantbiology.ucr.edu/sites/default/files/styles/form_preview/public/blank-profile-pic.png?itok=rhVwP3MG'
                                        : value.photo.toString()),
                                  ),
                                  shape: BoxShape.circle,
                                  boxShadow: const [BoxShadow(blurRadius: 1)]),
                              width: 70,
                              height: 100,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              strutStyle: const StrutStyle(fontSize: 8.0),
                              text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: UIGuide.BLACK,
                                      fontWeight: FontWeight.w900),
                                  text: value.name == null
                                      ? '----'
                                      : value.name.toString()),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              strutStyle: const StrutStyle(fontSize: 8.0),
                              text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: UIGuide.BLACK,
                                      fontWeight: FontWeight.w900),
                                  text: value.designation == null
                                      ? '---'
                                      : value.designation.toString()),
                            ),
                          ],
                        ),
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class StaffFlashNews extends StatelessWidget {
  StaffFlashNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<FlashnewsProvider>(context, listen: false);
      p.flashNewsProvider();
      p.flashnew.clear();
    });

    var size = MediaQuery.of(context).size;
    return Consumer<FlashnewsProvider>(builder: (context, value, child) {
      if (value.flashnew.isEmpty) {
        return Container(
          height: 25,
        );
      } else {
        return LimitedBox(
          maxHeight: 30,
          child: value.loading
              ? Container(
                  height: 30,
                  width: 30,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      value.flashnew.length == null ? 0 : value.flashnew.length,
                  itemBuilder: (context, index) {
                    return LimitedBox(
                      maxHeight: 30,
                      child: Marquee(
                        text: value.flashnew[index].news ?? '-----',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 20.0,
                        velocity: 40.0,
                        pauseAfterRound: const Duration(seconds: 1),
                        showFadingOnlyWhenScrolling: true,
                        fadingEdgeStartFraction: 0.3,
                        fadingEdgeEndFraction: 0.3,
                        numberOfRounds: null,
                        startPadding: 10.0,
                        accelerationDuration: const Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    );
                  }),
        );
      }
    });
  }
}
