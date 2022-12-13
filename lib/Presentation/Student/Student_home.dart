import 'dart:async';

import 'package:Ess_test/Application/Module%20Providers.dart/Module.dart';
import 'package:Ess_test/Application/StudentProviders/InternetConnection.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Presentation/Student/NoInternetScreen.dart';
import 'package:Ess_test/Presentation/Student/feedemo.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/StudentProviders/GalleryProvider.dart';
import '../../Application/StudentProviders/ProfileProvider.dart';
import '../../Application/StudentProviders/SiblingsProvider.dart';
import '../../Application/StudentProviders/TimetableProvider.dart';
import '../Login_Activation/Login_page.dart';
import 'Attendence.dart';
import 'Gallery.dart';
import 'NoticeBoard.dart';
import 'PasswordChange.dart';
import 'PayFee.dart';
import 'PaymentHistory.dart';
import 'Profile_Info.dart';
import 'Reportcard.dart';
import 'Stud_Notification.dart';
import 'TimeTable.dart';

class StudentHome extends StatefulWidget {
  StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  var size, height, width, kheight, kheight20;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ConnectivityProvider>(context, listen: false);
      Provider.of<SibingsProvider>(context, listen: false).siblingList.clear();
      await Provider.of<SibingsProvider>(context, listen: false)
          .getSiblingName();
      await Provider.of<ModuleProviders>(context, listen: false)
          .getModuleDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    //  Provider.of<GalleryProvider>(context, listen: false).getGalleyList();

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
      body: Consumer<ConnectivityProvider>(
        builder: (context, connection, child) => connection.isOnline == false
            ? NoInternetConnection()
            : ListView(
                children: [
                  ProfileHome(kheight20: kheight20, kheight: kheight),
                  const Flashnews(),
                  Container(
                    width: width,
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
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
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
                                      builder: (context) =>
                                          Stud_Notification()),
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
                                            'assets/Noticeboard.png',
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
                        kheight20,
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
                              Consumer<ModuleProviders>(
                                builder: (context, module, child) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    module.fees == true
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PayFee()),
                                                );
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 40,
                                                    decoration:
                                                        const BoxDecoration(
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
                                                        fontSize: 11,
                                                        color: Colors.black38),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _modalBottomSheetMenu();
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 40,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        //  opacity: 0.3,
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ReportCard()),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            kheight,
                                            const Text(
                                              'Report Card',
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
                                                    'assets/Payment History.png',
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            kheight,
                                            const Text(
                                              'Payment \n History',
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
                              ),
                            ],
                          ),
                        ),
                        kheight,
                        kheight20,
                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
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
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
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
                                      height: 60,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          opacity: 20,
                                          image: AssetImage(
                                            'assets/Attendancee.png',
                                          ),
                                        ),
                                        // borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    kheight,
                                    const Text(
                                      'Attendance',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.black38),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            Consumer<ProfileProvider>(
                              builder: (context, value, child) {
                                return GestureDetector(
                                  onTap: () async {
                                    var divId = value.divisionId == null
                                        ? 'divId is null'
                                        : value.divisionId.toString();
                                    await Provider.of<Timetableprovider>(
                                            context,
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              opacity: 20,
                                              image: AssetImage(
                                                'assets/timetable-icon.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        kheight,
                                        const Text(
                                          'Timetable',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black38),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                                      height: 60,
                                      width: 50,
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
                            //   padding:
                            //       const EdgeInsets.only(left: 10, right: 10),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>  FeeDemo()),
                            //       );
                            //     },
                            //     child: Column(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         Container(
                            //           height: 50,
                            //           width: 40,
                            //           decoration: BoxDecoration(
                            //             image: const DecorationImage(
                            //               opacity: 20,
                            //               image: AssetImage(
                            //                 'assets/Gallery.png',
                            //               ),
                            //             ),
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //         ),
                            //         kheight,
                            //         const Text(
                            //           'Gallery',
                            //           style: TextStyle(
                            //               fontSize: 11, color: Colors.black38),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        kheight,
                        kheight20,
                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black45,
                                  height: 36,
                                )),
                          ),
                          const Text(
                            "Change Password / SignOut",
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
                                    buttonsBorderRadius: const BorderRadius.all(
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
                                          await SharedPreferences.getInstance();
                                      print("accesstoken  $prefs");
                                      prefs.remove("accesstoken");

                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()),
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
                        kheight20,
                        kheight20,
                        Consumer<SibingsProvider>(
                          builder: (context, value, child) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: value.siblingList.isEmpty
                                    ? 0
                                    : value.siblingList.length,
                                itemBuilder: (context, index) {
                                  var idd = value.siblingList[index].id ?? '--';

                                  print(idd);
                                  Provider.of<SibingsProvider>(context,
                                          listen: false)
                                      .getToken(idd);
                                  return Container(
                                    height: 0,
                                    width: 0,
                                  );
                                });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(60.0),
        // ),
        context: context,
        builder: (builder) {
          return Container(
            height: size.height / 2.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_outlined,
                        size: 35,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: size.height / 2.7,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: const Center(
                      child: Text("This is a modal sheet"),
                    )),
              ],
            ),
          );
        });
  }
}

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
          return Dialog(
              child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: UIGuide.light_Purple, width: 2),
                borderRadius: BorderRadius.circular(0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        siblinggResponse == null ? 0 : siblinggResponse!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          kheight20,
                          Center(
                              child: GestureDetector(
                                  onTap: () async {
                                    var idd =
                                        siblinggResponse![index]['id'] == null
                                            ? '--'
                                            : siblinggResponse![index]['id']
                                                .toString();

                                    // await Future.delayed(
                                    // ////    const Duration(seconds: 3));

                                    await Provider.of<SibingsProvider>(context,
                                            listen: false)
                                        .getSibling(context, idd);
                                  },
                                  child: Text(
                                    siblinggResponse![index]['name'] == null
                                        ? '--'
                                        : siblinggResponse![index]['name']
                                            .toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: UIGuide.light_Purple,
                                        fontSize: 16),
                                  ))),
                          // const Divider(
                          //   height: 1,
                          //   color: Colors.black45,
                          // ),
                          kheight20,
                        ],
                      );
                    }),
              ],
            ),
          ));
        });
  }
}

class Flashnews extends StatefulWidget {
  const Flashnews({Key? key}) : super(key: key);

  @override
  State<Flashnews> createState() => _FlashnewsState();
}

class _FlashnewsState extends State<Flashnews> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<ProfileProvider>(context, listen: false);
      p.flashNewsProvider();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        if (value.flashnews == null || value.flashnews == '') {
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
                : LimitedBox(
                    maxHeight: 30,
                    child: Marquee(
                      text: value.flashnews == null || value.flashnews == ''
                          ? '-----'
                          : value.flashnews.toString(),
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
                  ),
          );
        }
      },
    );
  }
}
