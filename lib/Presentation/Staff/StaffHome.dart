
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/Staff_Providers/StaffFlashnews.dart';
import '../../Application/Staff_Providers/StaffProfile.dart';
import '../../Constants.dart';
import '../../utils/LoadingIndication.dart';
import '../../utils/constants.dart';
import '../Login_Activation/Login_page.dart';
import '../Student/Gallery.dart';
import '../Student/NoticeBoard.dart';
import '../Student/PasswordChange.dart';
import '../Student/Profile_Info.dart';
import '../Student/Stud_Calender.dart';
import '../Student/Stud_Notification.dart';
import '../Student/Student_home.dart';
import '../Student/payment.dart';
import 'GalleryUpload.dart';
import 'MarkEntry.dart';
import 'MarkEntryReport.dart';
import 'NoticeBoard.dart';
import 'StaffProfile.dart';
import 'StaffTimeTable.dart';
import 'StudAttendenceEntry.dart';
import 'StudReport.dart';
import 'ToGuardian.dart';

class StaffHome extends StatelessWidget {
  StaffHome({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? const LoadingIcon()
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StaffProfileView()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    'Profile',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    'Student \n Report',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
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
                                    builder: (context) => Stud_Notification()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  const Text(
                                    '   Student \nInformation',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
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
                                    builder: (context) => Staff_Timetable()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    'Timetable',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      kheight10,
                      kheight20,
                      Container(
                        color: const Color.fromARGB(255, 218, 212, 212),
                        height: 150,
                        width: size.width,
                        child: Column(
                          children: [
                            kheight10,
                            Row(children: const <Widget>[
                              Expanded(child: Text("")),
                              Text(
                                " * Entries * ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 129, 125, 129),
                                    fontWeight: FontWeight.w900),
                              ),
                              Expanded(child: Text("")),
                            ]),
                            kheight10,
                            kheight10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                          'Attendence',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
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
                                          builder: (context) => MarkEntry()),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          'Mark Entry',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        kheight10,
                                        const Text(
                                          'Mark Entry \n   Report',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
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
                          "Communication",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.purple,
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
                                    builder: (context) => Staff_ToGuardian()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    'To Guardian',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
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
                                      builder: (context) => StaffNoticeBoard()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    'Notice Board',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
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
                                        const StaffGalleryUPload()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    'Gallery ',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
                                  )
                                ],
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
                          "Password Change / SignOut",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.purple,
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
                                color: Colors.purple,
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
                                color: Colors.purple,
                              )),
                        ],
                      ),
                      kheight20,
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class StaffProfile extends StatelessWidget {
  const StaffProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<StaffProfileProvider>(context, listen: false)
    //     .staff_profileData();

    var size = MediaQuery.of(context).size;
    const Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 177, 233, 185);
    final Color fill2 = Color.fromARGB(255, 157, 229, 238);

    final List<Color> gradient = [
      fill1,
      fill2,

      // background,
      // background,
    ];
    final double fillPercent = 35;
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [
      0.0,
      fillStop,
    ];
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 2,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                  height: 140,
                  width: size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: gradient,
                        stops: stops,
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Consumer<StaffProfileProvider>(
                    builder: (context, value, child) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                // opacity: 20,
                                image: NetworkImage(value.photo == null
                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv8wu9_TahtwhJWwao2I8Pp8rGMa7aSAQi8w&usqp=CAU'
                                    : value.photo.toString()),
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(blurRadius: 1)]),
                          width: 70,
                          height: 100,
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          strutStyle: const StrutStyle(fontSize: 8.0),
                          text: TextSpan(
                              style: TextStyle(
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
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class StaffFlashNews extends StatelessWidget {
  const StaffFlashNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<FlashnewsProvider>(context, listen: false)
        .flashNewsProvider(context);

    var size = MediaQuery
        .of(context)
        .size;
    return Consumer<FlashnewsProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: dataRsponse == null ? 0 : dataRsponse!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 30,
                  width: 30,
                  child: Marquee(
                    //scrolling  text
                    text: dataRsponse![index]['flashNews'] == null
                        ? '------------'
                        : dataRsponse![index]['flashNews'].toString(),
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
              });
        }
    );
  }
}
