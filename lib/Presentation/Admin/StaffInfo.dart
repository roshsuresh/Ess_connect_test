import 'package:Ess_test/Application/AdminProviders/StaffReportProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                        color: UIGuide.light_Purple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(450),
                            bottomRight: Radius.circular(450))),
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
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 44, 43, 43)),
                              text: value.staffReportList[index].name ?? '--'),
                        ),
                      ),
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Designation : '),
                      Text(
                        value.staffReportList[index].designation ?? '--',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.mobile_friendly,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Mobile Number : '),
                      Text(
                        value.staffReportList[index].mobileNo ?? '--',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Email : '),
                      Text(
                        value.staffReportList[index].emailId ?? '--',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.list_alt_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Section : '),
                      Text(
                        value.staffReportList[index].section ?? '--',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.redeem_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Birthday : '),
                      Text(
                        value.staffReportList[index].dateOfBirth ?? '--',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.man_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Gender : '),
                      Text(
                        value.staffReportList[index].gender ?? '--',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Address : '),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(fontSize: 13),
                          maxLines: 3,
                          text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color.fromARGB(255, 44, 43, 43)),
                            text: value.staffReportList[index].address ?? '--',
                          ),
                        ),
                      ),
                    ],
                  ),
                  kheight10,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
