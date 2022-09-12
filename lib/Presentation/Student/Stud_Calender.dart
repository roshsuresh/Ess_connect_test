import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class Stud_Calender extends StatelessWidget {
  const Stud_Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIGuide.light_Purple,
        title: Row(
          children: const [
            Icon(Icons.calendar_month_outlined),
            Text(' Calender'),
          ],
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 10),
            child: Container(
              decoration: const BoxDecoration(
                  color: UIGuide.WHITE,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 196, 190, 190),
                      offset: Offset(
                        1,
                        3.0,
                      ),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  kWidth,
                  kWidth,
                  Column(
                    children: const [
                      Text(
                        '15',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Color.fromARGB(255, 88, 88, 90),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Aug - 2022")
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 92, 90, 97),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 16.0),
                        text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: 'Independence Day'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
