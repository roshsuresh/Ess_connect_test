import 'package:Ess_test/Application/Staff_Providers/Attendencestaff.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:provider/provider.dart';

class Student_statistics_admin extends StatelessWidget {
  const Student_statistics_admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Statistics'),
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
            Row(
              children: [
                kWidth,
                kWidth,
                MaterialButton(
                  minWidth: size.width - 230,
                  child: Row(
                    children: [
                      Text('Select Course'),
                      // Icon(Icons.arrow_downward_outlined)
                    ],
                  ),
                  color: Colors.white70,
                  onPressed: (() {}),
                ),
                Spacer(),
                MaterialButton(
                  minWidth: size.width - 230,
                  child: Row(
                    children: [
                      const Text('Select Division'),
                    ],
                  ),
                  color: Colors.white70,
                  onPressed: (() {}),
                ),
                kWidth,
                kWidth,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 60, color: UIGuide.light_Purple,
                  //   style: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {},
                  child: Text(
                    'View',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(4),
                  1: FlexColumnWidth(1.5),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(2),
                },
                children: const [
                  TableRow(
                      decoration: BoxDecoration(
                        //  border: Border.all(),
                        color: Color.fromARGB(255, 228, 224, 224),
                      ),
                      children: [
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Course',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Female',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          child: Center(
                              child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )),
                        ),
                      ]),
                ],
              ),
            ),
            Consumer<AttendenceStaffProvider>(builder: (context, value, child) {
              // Provider.of<AttendenceStaffProvider>(context, listen: false)
              //     .getstudentsAttendenceView(dateFinal, divisionId);
              return LimitedBox(
                  maxHeight: 440,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Table(
                              //  border: TableBorder.all(color: Colors.grey),
                              columnWidths: const {
                                0: FlexColumnWidth(4),
                                1: FlexColumnWidth(1.5),
                                2: FlexColumnWidth(1.5),
                                3: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(),
                                    children: [
                                      Text(
                                        'VII-A',
                                        // value.studentsAttendenceView[index]
                                        //             .rollNo ==
                                        //         null
                                        //     ? '0'
                                        //     : value
                                        //         .studentsAttendenceView[index]
                                        //         .rollNo
                                        //         .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        '12',
                                        // value.studentsAttendenceView[index]
                                        //         .name ??
                                        //     '--',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      // TextButton(onPressed: (){}, child: Text('f'))

                                      // Text(
                                      //   value.studentsAttendenceView[index]
                                      //           .forenoon ??
                                      //       '--',
                                      //   textAlign: TextAlign.center,
                                      // ),
                                      Text(
                                        '20',
                                        // value.studentsAttendenceView[index]
                                        //         .afternoon ??
                                        //     '--',
                                        textAlign: TextAlign.center,
                                      ),

                                      Text(
                                        '32',
                                        // value.studentsAttendenceView[index]
                                        //         .afternoon ??
                                        //     '--',
                                        textAlign: TextAlign.center,
                                      )
                                    ]),
                              ],
                            ),
                            kheight20,
                          ],
                        );
                      })));
            }),
          ],
        ));
  }
}
