import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';

class MarkEntryReport extends StatelessWidget {
  const MarkEntryReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Entry Report',
          style: TextStyle(fontSize: 20),
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
        backgroundColor: UIGuide.light_Purple,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              MaterialButton(
                minWidth: size.width - 200,
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
                minWidth: size.width - 200,
                child: Row(
                  children: [
                    const Text('Select Division'),
                    //  Icon(Icons.arrow_downward_outlined)
                  ],
                ),
                color: Colors.white70,
                onPressed: (() {}),
              ),
            ],
          ),
          Row(
            children: [
              MaterialButton(
                minWidth: size.width - 200,
                child: Row(
                  children: [
                    Text('Part'),
                    //Icon(Icons.arrow_downward_outlined)
                  ],
                ),
                color: Colors.white70,
                onPressed: (() {}),
              ),
              Spacer(),
              MaterialButton(
                minWidth: size.width - 200,
                child: Row(
                  children: [
                    const Text('Subject '),
                    // Icon(Icons.arrow_downward_outlined)
                  ],
                ),
                color: Colors.white70,
                onPressed: (() {}),
              ),
            ],
          ),
          Row(
            children: [
              MaterialButton(
                minWidth: size.width - 200,
                child: Row(
                  children: [
                    Text('Exam'),
                    kWidth,
                    //  Icon(Icons.arrow_downward_outlined)
                  ],
                ),
                color: Colors.white70,
                onPressed: (() {}),
              ),
              Spacer(),
              MaterialButton(
                //minWidth: size.width - 200,
                child: Row(
                  children: [
                    const Text('View'),
                  ],
                ),
                color: Colors.grey,
                onPressed: (() {}),
              ),
              kWidth,
              kWidth,
              kWidth,
              kWidth,
              kWidth,
              kWidth,
            ],
          ),
          kheight20,
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1.5),
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
                          'Roll No.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 30,
                      //   child: Center(
                      //       child: Text(
                      //     'Attendance',
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.w500, fontSize: 12),
                      //   )),
                      // ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'English',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                    ]),
              ],
            ),
          ),
          LimitedBox(
              maxHeight: 440,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(1.5),
                              // 3: FlexColumnWidth(1.5),
                            },
                            children: [
                              TableRow(
                                  decoration: const BoxDecoration(),
                                  children: [
                                    Text(
                                      (index + 1).toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'ADAM ARUN ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      '10',
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                            ],
                          ),
                          kheight20,
                        ],
                      ),
                    );
                  }))),
        ],
      ),
    );
  }
}
