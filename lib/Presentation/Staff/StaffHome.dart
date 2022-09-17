import 'package:Ess_Conn/Application/StudentProviders/ProfileProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/Presentation/Login_Activation/Login_page.dart';
import 'package:Ess_Conn/Presentation/Student/AdvancePay.dart';
import 'package:Ess_Conn/Presentation/Student/Attendence.dart';
import 'package:Ess_Conn/Presentation/Student/PayFee.dart';
import 'package:Ess_Conn/Presentation/Student/PaymentHistory.dart';
import 'package:Ess_Conn/Presentation/Student/Reportcard.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/LoadingIndication.dart';
import '../Student/Gallery.dart';
import '../Student/NoticeBoard.dart';
import '../Student/PasswordChange.dart';
import '../Student/Profile_Info.dart';
import '../Student/Stud_Calender.dart';
import '../Student/Stud_Notification.dart';
import '../Student/Student_home.dart';
import '../Student/payment.dart';

class StaffHome extends StatelessWidget {
  StaffHome({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Provider.of<ProfileProvider>(context, listen: false)
        .flashNewsProvider(context);

    return Scaffold(
      body: isLoading
          ? const LoadingIcon()
          : ListView(
              children: [
                StaffProfile(), //  <--<---  StaffProfile....
                const Flashnews(),
                Container(
                  width: size.width,
                  height: size.height - 180,
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
                          'Personal info',
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
                                    builder: (context) => Profile_Info()),
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
                                    'Notification',
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
                                    builder: (context) => const Attendence()),
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
                                      // borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  kheight10,
                                  const Text(
                                    'Attendence',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black38),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {},
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoticeBoard()),
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
                                    'Notice Board',
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
                                      builder: (context) => Gallery()),
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
                                          'assets/notification.png',
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  kheight10,
                                  const Text(
                                    'Gallery',
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
                                      builder: (context) =>
                                          const Stud_Calender()),
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
                                          'assets/Profile.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  kheight10,
                                  const Text(
                                    'Calender',
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
                                " * Urgent & Important * ",
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
                                            builder: (context) => PayFee()),
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
                                          'Pay Fee',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
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
                                        'Events',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black38),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
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
                                        'Fee Structure',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black38),
                                      )
                                    ],
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
                          "Fees",
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
                                        'assets/pay.png',
                                      ),
                                    ),
                                  ),
                                ),
                                kheight10,
                                const Text(
                                  'Pay Fee',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black38),
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
                                      builder: (context) => PaymentRough()),
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
                                    'Fee Structure',
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
                                    builder: (context) => const AdvancePay()),
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
                                    'Advance Pay ',
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
                                        const PaymentHistory()),
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
                                    'Payment \n History',
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
                          "Tabulation",
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
                                  'Mark Sheet',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black38),
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
                                          'assets/Reportcard.png',
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  kheight10,
                                  const Text(
                                    'Report Card',
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
                                  'Home Works',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black38),
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
                                  'Statistics',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black38),
                                )
                              ],
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
    final pro = Provider.of<ProfileProvider>(context, listen: false);
    pro.profileData();
    var size = MediaQuery.of(context).size;
    const Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 139, 154, 240);
    final Color fill2 = Color.fromARGB(255, 174, 89, 216);
    final Color fill3 = Color.fromARGB(255, 174, 89, 216);
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
    return pro.isLoading
        ? Center(
            child: Container(
              child: SpinKitThreeBounce(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            ),
          )
        : SafeArea(
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
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    // opacity: 20,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv8wu9_TahtwhJWwao2I8Pp8rGMa7aSAQi8w&usqp=CAU'),
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
                              text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: UIGuide.BLACK,
                                      fontWeight: FontWeight.w900),
                                  text: "Anita Paul"),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              strutStyle: const StrutStyle(fontSize: 8.0),
                              text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: UIGuide.BLACK,
                                      fontWeight: FontWeight.w900),
                                  text: "HINDI(JR)"),
                            ),
                          ],
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
