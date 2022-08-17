import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class Attendence extends StatelessWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendence'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: ListView(
        children: [
          kheight10,
          Table(
            border: TableBorder.all(),
            children: const [
              TableRow(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                children: [
                  Text(
                    'Month',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'No of \n Working \n Days',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Days \n Present',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Days \n absent',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' \n %',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              TableRow(children: [
                Text(
                  'January',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '25',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '20',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '55',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '88%',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ]),
              TableRow(children: [
                Text(
                  'February',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '65',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '60',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '5',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '85%',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
