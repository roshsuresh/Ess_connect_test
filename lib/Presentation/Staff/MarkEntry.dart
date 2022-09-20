import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class MarkEntry extends StatelessWidget {
  const MarkEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Entry',
          style: TextStyle(fontSize: 16),
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
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'Attendance',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'Mark',
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
                              3: FlexColumnWidth(1.5),
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
                                      'A',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 22,
                                      width: 10,
                                      child: TextField(
                                        //keyboardType: TextInputType.number,
                                        // maxLines: 1,
                                        // maxLength: 4,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            errorStyle: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold)),
                                        //style: TextStyle(height: 0),
                                      ),
                                    )
                                  ]),
                            ],
                          ),
                          kheight20,
                        ],
                      ),
                    );
                  }))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              kWidth,
              Spacer(),
              MaterialButton(
                onPressed: () {},
                color: UIGuide.light_Purple,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              kWidth,
              MaterialButton(
                onPressed: () {},
                color: Colors.red,
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              kWidth
            ],
          )
        ],
      ),
    );
  }
}
