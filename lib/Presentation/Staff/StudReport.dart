import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';

class StudReport extends StatelessWidget {
  const StudReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Student Report'),
              titleSpacing: 20.0,
              centerTitle: true,
              toolbarHeight: 30.2,
              toolbarOpacity: 0.8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: "Studying",
                  ),
                  Tab(text: "Relieved"),
                  Tab(text: 'Both')
                ],
              ),
              backgroundColor: UIGuide.light_Purple,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: TabBarView(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudProfileView_Staff()),
                  );
                },
                child: StudCurrentStudying(),
              ),
              StudCurrentStudying(),
              StudCurrentStudying(),
            ])));
  }
}

class StudCurrentStudying extends StatelessWidget {
  const StudCurrentStudying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            kheight10,
            Container(
              width: size.width - 10,
              height: 90,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 236, 233, 233),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kWidth,
                  Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 236, 233, 233),
                          image: DecorationImage(
                              image: AssetImage('assets/studentLogo.png')),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Name : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              strutStyle: const StrutStyle(fontSize: 8.0),
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  text: "AADAM ISWAR AADHITHYA UNNI"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Roll No : ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              strutStyle: const StrutStyle(fontSize: 8.0),
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                text: "214",
                              ),
                            ),
                            kWidth,
                            kWidth,
                            Row(
                              children: [
                                Text(
                                  'Division : ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  strutStyle: const StrutStyle(fontSize: 8.0),
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    text: "VII",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Adm No : ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              strutStyle: const StrutStyle(fontSize: 8.0),
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                text: "2154",
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            _makingPhoneCall();
                          },
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Phone : ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                strutStyle: const StrutStyle(fontSize: 8.0),
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                  text: "9547812154",
                                ),
                              ),
                              const Icon(
                                Icons.phone,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:807812564");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class StudProfileView_Staff extends StatelessWidget {
  const StudProfileView_Staff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 79, 97, 197);
    final Color fill2 = Color.fromARGB(255, 180, 103, 216);
    final List<Color> gradient = [
      fill1,
      fill2,
      background,
      background,
    ];
    final double fillPercent = 35;
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 260,
                width: size.width,
                // color: UIGuide.WHITE,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradient,
                    stops: stops,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 30,
                right: 30,
                child: Container(
                    decoration: const BoxDecoration(
                        color: UIGuide.WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 128, 125, 125),
                            offset: Offset(
                              2,
                              5.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: size.width - 50,
                    height: 170,
                    child: Column(
                      children: [
                        kheight20,
                        kheight20,
                        kheight20,
                        kheight10,
                        Text(
                          'AADAM ISWAR AADHITHYA UNNI ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        kheight10,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            // defaultColumnWidth: FixedColumnWidth(120.0),
                            border: TableBorder.all(
                                color: const Color.fromARGB(255, 213, 213, 243),
                                style: BorderStyle.solid,
                                width: 2),
                            children: [
                              TableRow(children: [
                                Column(
                                  children: [
                                    const Text('Division',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)),
                                    Text('XII-A',
                                        style: const TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('Roll No',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)),
                                    Text('65',
                                        style: const TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('Adm No',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)),
                                    Text('2354',
                                        style: const TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                              ])
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Center(
                child: CircleAvatar(
                  // foregroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://png.pngtree.com/element_our/png/20181129/male-student-icon-png_251938.jpg'),
                  radius: 65,
                  backgroundColor: UIGuide.WHITE,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 238, 234, 234),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 234, 234),
                    ),
                    width: size.width,
                    height: 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Permenent Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(fontSize: 13),
                            maxLines: 3,
                            text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 44, 43, 43)),
                                text:
                                    'Reloaded 1 Reloaded 1 of 1770 libraries in 1,986ms (compile: 27 ms, reload: 861 ms, reassemble: 946 ms). of 1770 libraries in 1,986ms (compile: 27 ms, reload: 861 ms, reassemble: 946 ms).'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Bus Name : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                      Flexible(
                        child: Text(
                          'BUS-1',
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: const [
                      Text(
                        'Bus Stop : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                      Flexible(
                        child: Text(
                          'KMUP SCHOOL',
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  kheight10,
                  GestureDetector(
                    onTap: () {
                      _makingPhoneCall();
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Phone No : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Flexible(
                          child: Text(
                            '+91 9855464885',
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:807812564");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
