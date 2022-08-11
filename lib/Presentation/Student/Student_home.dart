import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentHome extends StatelessWidget {
  StudentHome({Key? key}) : super(key: key);
  var size, height, width, kheight, kheight20;

  @override
  Widget build(BuildContext context) {
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
          kheight,
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              // opacity: 20,
                              image: AssetImage(
                                'assets/studentLogo.png',
                              ),
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(blurRadius: 10)]),
                        width: 70,
                        height: 120,
                      ),
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kheight20,
                            Row(
                              children: const [
                                Text(
                                  'Name : ',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Arun ',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            kheight,
                            Row(
                              children: const [
                                Text(
                                  'Adm no : ',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '5246 ',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            kheight,
                            Row(
                              children: const [
                                Text(
                                  'Class : ',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'VI',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: (() {}),
                              icon: const Icon(
                                Icons.switch_account_outlined,
                                size: 30,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          Container(
            height: 30,
            width: size.width,
          ),
          SingleChildScrollView(
            child: Container(
              // width: width,
              // height: double.infinity,
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(1, 3))],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  kheight,
                  kheight20,
                  // SizedBox(
                  //   height: 150,
                  // ),
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text(
                      'Personal info',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
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
                                // borderRadius: BorderRadius.circular(10),
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
                      Padding(
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
                            kheight,
                            const Text(
                              'Notification',
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
                                // borderRadius: BorderRadius.circular(10),
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
                    ],
                  ),
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
                                    'assets/Profile.png',
                                  ),
                                ),
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
                            const Text(
                              'Extras',
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
                            kheight,
                            const Text(
                              'Meetings',
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
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
                            const Text(
                              'Events',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  kheight, kheight20,

                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text(
                      "Fees",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
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
                                    'assets/pay.png',
                                  ),
                                ),
                                // borderRadius: BorderRadius.circular(10),
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
                      Padding(
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
                                    'assets/pay.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
                            const Text(
                              'Fee Structure',
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
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
                            const Text(
                              'Advance Pay ',
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
                                // borderRadius: BorderRadius.circular(10),
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
                    ],
                  ),
                  kheight, kheight20,

                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text(
                      "Tabulation",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
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
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
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
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
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
                                // borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            kheight,
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
                  kheight, kheight20,

                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text(
                      "SignOut",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ]),
                  kheight,

                  MaterialButton(
                      minWidth: 50,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {},
                      child: const Icon(
                        Icons.logout_outlined,
                        color: Colors.purple,
                      )),
                  kheight20,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
