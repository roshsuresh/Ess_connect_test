import 'package:Ess_test/Presentation/Student/payment.dart';
import 'package:Ess_test/Presentation/Student/selection.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/StudentProviders/GalleryProvider.dart';
import '../../Application/StudentProviders/ProfileProvider.dart';
import '../../Application/StudentProviders/SiblingsProvider.dart';
import '../../Application/StudentProviders/TimetableProvider.dart';
import '../../utils/LoadingIndication.dart';
import '../Login_Activation/Login_page.dart';
import 'AdvancePay.dart';
import 'Attendence.dart';
import 'Gallery.dart';
import 'NoticeBoard.dart';
import 'PasswordChange.dart';
import 'PayFee.dart';
import 'PaymentHistory.dart';
import 'Profile_Info.dart';
import 'Reportcard.dart';
import 'Stud_Calender.dart';
import 'Stud_Notification.dart';
import 'TimeTable.dart';

class StudentHome extends StatelessWidget {
  StudentHome({Key? key}) : super(key: key);
  var size, height, width, kheight, kheight20;

  @override
  Widget build(BuildContext context) {
    // Provider.of<ProfileProvider>(context, listen: false).profileData();
    // Provider.of<ProfileProvider>(context, listen: false)
    //     .flashNewsProvider(context);
    Provider.of<GalleryProvider>(context, listen: false).getGalleyList();
    //Provider.of<ProfileProvider>(context, listen: false).siblingsAPI();
    // Provider.of<NoticeProvider>(context, listen: false).noticeAttachement('');

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    kheight = const SizedBox(
      height: 10,
    );
    kheight20 = const SizedBox(
      height: 20,
    );
    return Scaffold(
      body: ListView(
        children: [
          ProfileHome(kheight20: kheight20, kheight: kheight),
          const Flashnews(),
          Container(
            width: width,
            height: size.height - 180,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(1, 3))],
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
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black45,
                          height: 36,
                        )),
                  ),
                  const Text(
                    'Personal info',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: UIGuide.light_Purple,
                        fontWeight: FontWeight.w900),
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
                              builder: (context) => Profile_Info()),
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
                              ),
                            ),
                            kheight,
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
                                    'assets/notificationnew.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
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
                                    'assets/Attendance.png',
                                  ),
                                ),
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
                            const Text(
                              'Attendence',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                kheight,
                kheight20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer<ProfileProvider>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () async {
                            var divId = value.divisionId == null
                                ? 'divId is null'
                                : value.divisionId.toString();
                            await Provider.of<Timetableprovider>(context,
                                    listen: false)
                                .getTimeTable(divId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Timetable(divid: divId)),
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
                                kheight,
                                const Text(
                                  'Timetable',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black38),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoticeBoard()),
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
                            kheight,
                            const Text(
                              'Notice Board',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                kheight,
                kheight20,
                Container(
                  color: Color.fromARGB(255, 236, 237, 245),
                  height: 150,
                  width: width,
                  child: Column(
                    children: [
                      kheight,
                      Row(children: const <Widget>[
                        Expanded(child: Text("")),
                        Text(
                          " * Urgent & Important * ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: UIGuide.light_Purple,
                              fontWeight: FontWeight.w900),
                        ),
                        Expanded(child: Text("")),
                      ]),
                      kheight,
                      kheight,
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
                                          'assets/payNew.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  kheight,
                                  const Text(
                                    'Pay Fee',
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
                                  kheight,
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentHistory()),
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
                                          'assets/payNew.png',
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  kheight,
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
                    ],
                  ),
                ),
                // Row(children: <Widget>[
                //   Expanded(
                //     child: Container(
                //         margin: const EdgeInsets.only(
                //             left: 10.0, right: 20.0),
                //         child: const Divider(
                //           color: Colors.black,
                //           height: 36,
                //         )),
                //   ),
                //   const Text(
                //     "Fees",
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //         color: Colors.purple,
                //         fontWeight: FontWeight.w900),
                //   ),
                //   Expanded(
                //     child: Container(
                //         margin: const EdgeInsets.only(
                //             left: 20.0, right: 10.0),
                //         child: const Divider(
                //           color: Colors.black,
                //           height: 36,
                //         )),
                //   ),
                // ]),
                // kheight,
                // kheight20,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10, right: 10),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Container(
                //             height: 50,
                //             width: 40,
                //             decoration: const BoxDecoration(
                //               image: DecorationImage(
                //                 opacity: 20,
                //                 image: AssetImage(
                //                   'assets/pay.png',
                //                 ),
                //               ),
                //             ),
                //           ),
                //           kheight,
                //           const Text(
                //             'Pay Fee',
                //             style: TextStyle(
                //                 fontSize: 11, color: Colors.black38),
                //           )
                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10, right: 10),
                //       child: GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => PaymentRough()),
                //           );
                //         },
                //         child: Column(
                //           mainAxisAlignment:
                //               MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Container(
                //               height: 50,
                //               width: 40,
                //               decoration: BoxDecoration(
                //                 image: const DecorationImage(
                //                   opacity: 20,
                //                   image: AssetImage(
                //                     'assets/pay.png',
                //                   ),
                //                 ),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //             ),
                //             kheight,
                //             const Text(
                //               'Fee Structure',
                //               style: TextStyle(
                //                   fontSize: 11, color: Colors.black38),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const AdvancePay()),
                //         );
                //       },
                //       child: Padding(
                //         padding:
                //             const EdgeInsets.only(left: 10, right: 10),
                //         child: Column(
                //           mainAxisAlignment:
                //               MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Container(
                //               height: 50,
                //               width: 40,
                //               decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                   opacity: 20,
                //                   image: AssetImage(
                //                     'assets/Profile.png',
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             kheight,
                //             const Text(
                //               'Advance Pay ',
                //               style: TextStyle(
                //                   fontSize: 11, color: Colors.black38),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   const PaymentHistory()),
                //         );
                //       },
                //       child: Padding(
                //         padding:
                //             const EdgeInsets.only(left: 10, right: 10),
                //         child: Column(
                //           mainAxisAlignment:
                //               MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Container(
                //               height: 50,
                //               width: 40,
                //               decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                   opacity: 20,
                //                   image: AssetImage(
                //                     'assets/Profile.png',
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             kheight,
                //             const Text(
                //               'Payment \n History',
                //               style: TextStyle(
                //                   fontSize: 11, color: Colors.black38),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                kheight,
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
                    "Tabulation",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: UIGuide.light_Purple,
                        fontWeight: FontWeight.w900),
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
                kheight,
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
                          kheight,
                          const Text(
                            'Mark Sheet',
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
                            kheight,
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Gallery()),
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
                                    'assets/Gallery.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
                            const Text(
                              'Gallery',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
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
                    //             builder: (context) =>
                    //                 const Stud_Calender()),
                    //       );
                    //     },
                    //     child: Column(
                    //       mainAxisAlignment:
                    //           MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Container(
                    //           height: 50,
                    //           width: 40,
                    //           decoration: const BoxDecoration(
                    //             image: DecorationImage(
                    //               opacity: 20,
                    //               image: AssetImage(
                    //                 'assets/Profile.png',
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         kheight,
                    //         const Text(
                    //           'Calender',
                    //           style: TextStyle(
                    //               fontSize: 11, color: Colors.black38),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         height: 50,
                    //         width: 40,
                    //         decoration: const BoxDecoration(
                    //           image: DecorationImage(
                    //             opacity: 20,
                    //             image: AssetImage(
                    //               'assets/Profile.png',
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       kheight,
                    //       const Text(
                    //         'Home Works',
                    //         style: TextStyle(
                    //             fontSize: 11, color: Colors.black38),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         height: 50,
                    //         width: 40,
                    //         decoration: const BoxDecoration(
                    //           image: DecorationImage(
                    //             opacity: 20,
                    //             image: AssetImage(
                    //               'assets/Profile.png',
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       kheight,
                    //       const Text(
                    //         'Statistics',
                    //         style: TextStyle(
                    //             fontSize: 11, color: Colors.black38),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                kheight,
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
                    "Password Change / SignOut",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: UIGuide.light_Purple,
                        fontWeight: FontWeight.w900),
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
                kheight,
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
                                      builder: (context) => const LoginPage()),
                                  (Route<dynamic> route) => false);
                            },
                          ).show();
                          // SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // print("accesstoken  $prefs");
                          // prefs.remove("accesstoken");

                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginPage()),
                          //     (Route<dynamic> route) => false);
                        },
                        child: const Icon(
                          Icons.logout_outlined,
                          color: UIGuide.light_Purple,
                        )),
                  ],
                ),
                kheight20,
                kheight20,
                kheight20,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ProfileHome extends StatelessWidget {
//   ProfileHome({
//     Key? key,
//     required this.kheight20,
//     required this.kheight,
//   }) : super(key: key);

//   var kheight20;
//   var kheight;
//   late Future<List<SiblingsNameModel>> siblings;

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<ProfileProvider>(context, listen: false).getProfile();
//     var size = MediaQuery.of(context).size;
//     var width = size.width;
//     return SafeArea(
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               const SizedBox(
//                 height: 2,
//               ),
//               FutureBuilder<StudProModel>(
//                 future: ProfileProvider().getProfile(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Container(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0, right: 10),
//                         child: Container(
//                           height: 120,
//                           decoration: const BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 0.5,
//                                 )
//                               ],
//                               color: Colors.white,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               )),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     image: DecorationImage(
//                                       // opacity: 20,
//                                       image: NetworkImage(snapshot
//                                                   .data!
//                                                   .studentDetails
//                                                   .studentPhoto
//                                                   .url ==
//                                               null
//                                           ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOdO-enHDFSlpAWAzJGtHlIoJAzzbCYKYhVIxD4NpW&s'
//                                           : snapshot.data!.studentDetails
//                                               .studentPhoto.url
//                                               .toString()),
//                                     ),
//                                     shape: BoxShape.circle,
//                                     boxShadow: const [
//                                       BoxShadow(blurRadius: 1)
//                                     ]),
//                                 width: 70,
//                                 height: 120,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                                 height: 30,
//                               ),
//                               Container(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     kheight20,
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           'Name : ',
//                                           style: TextStyle(
//                                               color: Colors.purple,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                         RichText(
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           strutStyle:
//                                               const StrutStyle(fontSize: 8.0),
//                                           text: TextSpan(
//                                               style: const TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.black54,
//                                                   fontWeight: FontWeight.w900),
//                                               text: snapshot.data!
//                                                   .studentDetails.studentName
//                                                   .toString()),
//                                         ),
//                                       ],
//                                     ),
//                                     kheight,
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           'Adm no : ',
//                                           style: TextStyle(
//                                               color: Colors.purple,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                         Text(
//                                           snapshot
//                                               .data!.studentDetails.admissionNo
//                                               .toString()
//                                           //  dataResponse?['admissionNo'].noSuchMethod(),
//                                           ,
//                                           style: const TextStyle(
//                                               color: Colors.black54,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w900),
//                                         )
//                                       ],
//                                     ),
//                                     kheight,
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           'Class : ',
//                                           style: TextStyle(
//                                               color: Colors.purple,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                         Text(
//                                           snapshot
//                                               .data!.studentDetails.division,
//                                           style: const TextStyle(
//                                               color: Colors.black54,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w900),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const Spacer(),
//                               Row(
//                                 // crossAxisAlignment: CrossAxisAlignment.end,
//                                 // mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       IconButton(
//                                           onPressed: (() {
//                                             var currentname = snapshot.data!
//                                                 .studentDetails.studentName
//                                                 .toString();
//                                             _displayNameOfSiblings(
//                                                 context, currentname);
//                                           }),
//                                           icon: const Icon(
//                                             Icons.switch_account_outlined,
//                                             size: 30,
//                                           )),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Center(
//                       child: Text('Loading.....'),
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               // Flashnews()
//             ],
//           ),
//           //Flashnews()
//         ],
//       ),
//     );
//   }

//   _displayNameOfSiblings(BuildContext context, String? name) async {
//     Provider.of<SibingsProvider>(context, listen: false).getSiblingName();

//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//               content: Container(
//             decoration: BoxDecoration(border: Border.all()),
//             height: 70,
//             child: FutureBuilder<List<SiblingsNameModel>>(
//               future: SibingsProvider().getSiblingName(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.separated(
//                       separatorBuilder: (BuildContext context, int index) =>
//                           const Divider(),
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: ((context, index) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                                 child: GestureDetector(
//                                     onTap: () async {
//                                       var idd = snapshot.data![index].id;
//                                       print(idd);
//                                       await Provider.of<SibingsProvider>(
//                                               context,
//                                               listen: false)
//                                           .getSibling(context, idd!);
//                                     },
//                                     child: Text(snapshot.data![index].name
//                                         .toString()))),
//                             const Divider(
//                               height: 1,
//                               color: Colors.black54,
//                             )
//                           ],
//                         );
//                       }));
//                 } else {
//                   return Text('Loading....');
//                 }
//               },
//             ),
//           ));
//         });
//   }
// }
class ProfileHome extends StatelessWidget {
  ProfileHome({
    Key? key,
    required this.kheight20,
    required this.kheight,
  }) : super(key: key);

  var kheight20;
  var kheight;

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).profileData();
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 2,
              ),
              Consumer<ProfileProvider>(
                builder: (_, value, child) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        height: 120,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.5,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: value.loading
                            ? spinkitLoader()
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          // opacity: 20,
                                          image: NetworkImage(
                                            value.studPhoto == null
                                                ? 'https://png.pngtree.com/element_our/png/20181129/male-student-icon-png_251938.jpg'
                                                : value.studPhoto.toString(),
                                          ),
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: const [
                                          BoxShadow(blurRadius: 1)
                                        ]),
                                    width: 70,
                                    height: 120,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                    height: 30,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        kheight20,
                                        Row(
                                          children: [
                                            const Text(
                                              'Name : ',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),

                                            RichText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              strutStyle: const StrutStyle(
                                                  fontSize: 8.0),
                                              text: TextSpan(
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          UIGuide.light_Purple,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  text: value.studName ?? "--"

                                                  // dataResponse == null
                                                  //     ? '---'
                                                  //     : dataResponse!['studentName']

                                                  ),
                                            ),
                                            // dataResponse==null
                                            // ? Container(): dataResponse?['studentName'].text
                                          ],
                                        ),
                                        kheight,
                                        Row(
                                          children: [
                                            const Text(
                                              'Adm no : ',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              value.admissionNo == null
                                                  ? '--'
                                                  : value.admissionNo.toString()
                                              //  dataResponse?['admissionNo'].noSuchMethod(),
                                              ,
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        kheight,
                                        Row(
                                          children: [
                                            const Text(
                                              'Class : ',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              value.division == null
                                                  ? '--'
                                                  : value.division.toString(),
                                              style: const TextStyle(
                                                  color: UIGuide.light_Purple,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: (() {
                                                var currentname =
                                                    value.studName;
                                                _displayNameOfSiblings(
                                                    context, currentname);
                                              }),
                                              icon: const Icon(
                                                Icons.switch_account_outlined,
                                                size: 30,
                                                color: UIGuide.light_Purple,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // Flashnews()
            ],
          ),
          //Flashnews()
        ],
      ),
    );
  }

  bool loading = false;

  _displayNameOfSiblings(BuildContext context, String? name) async {
    await Provider.of<ProfileProvider>(context, listen: false).siblingsAPI();

    return showDialog(
        context: context,
        builder: (context) {
          var size = MediaQuery.of(context).size;
          return AlertDialog(
              content: Container(
            decoration:
                BoxDecoration(border: Border.all(color: UIGuide.light_Purple)),
            height: 70,
            width: size.width,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount:
                    siblinggResponse == null ? 0 : siblinggResponse!.length,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: GestureDetector(
                              onTap: () async {
                                var idd = siblinggResponse![index]['id'] == null
                                    ? '--'
                                    : siblinggResponse![index]['id'].toString();

                                // await Future.delayed(
                                //     const Duration(seconds: 3));

                                await Provider.of<SibingsProvider>(context,
                                        listen: false)
                                    .getSibling(context, idd);
                              },
                              child: Text(
                                  siblinggResponse![index]['name'] == null
                                      ? '--'
                                      : siblinggResponse![index]['name']
                                          .toString()))),
                      const Divider(
                        height: 1,
                        color: Colors.black45,
                      )
                    ],
                  );
                })),
          ));
        });
  }
}

class Flashnews extends StatelessWidget {
  const Flashnews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<ProfileProvider>(context, listen: false);
      p.flashNewsProvider(context);
      p.flashnew.clear();
    });

    var size = MediaQuery.of(context).size;
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return value.loading
            ? Container(
                height: 30,
                width: 30,
              )
            : ListView.builder(
                //scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    value.flashnew.length == null ? 0 : value.flashnew.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    width: 30,
                    child: Marquee(
                      //scrolling  text
                      text: value.flashnew[index].news ?? '--------',
                      // ? '------------'
                      // : dataRsponse![index]['flashNews'].toString(),
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
                      numberOfRounds: 3000,
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  );
                });
      },
    );
  }
}
