import 'package:Ess_test/Application/AdminProviders/StaffReportProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class StaffInfo extends StatelessWidget {
  int index;
  StaffInfo({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<StaffReportProviders>(
        builder: (context, value, child) => ListView(
          children: [
            Container(
              height: 190,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          UIGuide.light_Purple,
                          Color.fromARGB(255, 46, 127, 202),
                          Color.fromARGB(255, 100, 162, 219),
                        ]),
                        // color: UIGuide.light_Purple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                  ),
                  Positioned(
                    top: 60,
                    left: 100,
                    right: 100,
                    child: Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(value.staffReportList[index]
                                            .staffPhoto ==
                                        null
                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
                                    : value.staffReportList[index].staffPhoto
                                        .toString())),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: UIGuide.THEME_LIGHT)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Name : '),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(fontSize: 13),
                              maxLines: 2,
                              text: TextSpan(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 44, 43, 43)),
                                  text: value.staffReportList[index].name ??
                                      '--'),
                            ),
                          ),
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Designation : '),
                          Text(
                            value.staffReportList[index].designation ?? '--',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.mobile_friendly,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Mobile Number : '),
                          Text(
                            value.staffReportList[index].mobileNo ?? '--',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Email : '),
                          Text(
                            value.staffReportList[index].emailId ?? '--',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.list_alt_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Section : '),
                          Text(
                            value.staffReportList[index].section ?? '--',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.redeem_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Birthday : '),
                          Text(
                            value.staffReportList[index].dateOfBirth ?? '--',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.man_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Gender : '),
                          Text(
                            value.staffReportList[index].gender ?? '--',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      kheight10,
                      Row(
                        children: [
                          const Icon(
                            Icons.home_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('Address : '),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(fontSize: 13),
                              maxLines: 3,
                              text: TextSpan(
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 44, 43, 43)),
                                text: value.staffReportList[index].address ??
                                    '--',
                              ),
                            ),
                          ),
                        ],
                      ),
                      kheight10,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
