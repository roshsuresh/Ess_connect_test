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
      appBar: AppBar(
        backgroundColor: Color(0XFF36235a),
        title: Text("HomePage"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 10)]),
                  width: 70,
                  height: 120,
                  child: Image.asset(
                    'assets/studentLogo.png',
                    // fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Container(
            width: width - 100,
            height: height,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 20, offset: Offset(1, 3))],
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
                Text(
                  'Personal info',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w900),
                ),
                kheight20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Image.asset(
                              'assets/Profile.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        kheight,
                        Text(
                          'Profile',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                            child: Image.asset('assets/Profile.png'),
                          ),
                        ),
                        kheight,
                        Text(
                          'Notification',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                            child: Image.asset('assets/Profile.png'),
                          ),
                        ),
                        kheight,
                        Text(
                          'Attendence',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                            child: Image.asset('assets/Profile.png'),
                          ),
                        ),
                        kheight,
                        Text(
                          'Timetable',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
