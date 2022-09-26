
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants.dart';
import '../../utils/constants.dart';

class StaffReport extends StatelessWidget {
  const StaffReport({Key? key}) : super(key: key);

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
              TeachingStaff(),
              TeachingStaff(),
              TeachingStaff(),
            ])));
  }
}

class TeachingStaff extends StatelessWidget {
  const TeachingStaff({Key? key}) : super(key: key);

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
              height: 110,
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
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU')),
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
                                  text: "AADHITHYA "),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Section : ',
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
                                text: "VI-A",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Designation : ',
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
                                text: "HINDI(HR)",
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const Text(
                        //       'Email : ',
                        //       textAlign: TextAlign.start,
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.w500, fontSize: 13),
                        //     ),
                        //     RichText(
                        //       overflow: TextOverflow.ellipsis,
                        //       maxLines: 1,
                        //       strutStyle: const StrutStyle(fontSize: 8.0),
                        //       text: TextSpan(
                        //         style: const TextStyle(
                        //           fontSize: 12,
                        //           color: Colors.black,
                        //         ),
                        //         text: "adhithya@gmail.com",
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          children: [
                            const Text(
                              'Staff Role : ',
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
                                text: "Teacher",
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
