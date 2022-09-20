import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';

class AttendenceEntry extends StatelessWidget {
  AttendenceEntry({Key? key}) : super(key: key);
  DateTime? _mydatetime;
  String? date;
  @override
  Widget build(BuildContext context) {
    date = DateFormat('dd-MM-yyyy').format(DateTime.now()) +
        '         ' +
        DateFormat('kk:mm:a').format(DateTime.now());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendence Entry',
          //style: TextStyle(fontSize: 20),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Colors.white,
                  child: Text(date.toString()),
                  onPressed: () async {
                    _mydatetime = await showDatePicker(
                        context: context,
                        initialDate: _mydatetime ?? DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2030));
                  }),
            ],
          ),
          Row(
            children: [
              MaterialButton(
                minWidth: size.width - 200,
                child: Row(
                  children: [
                    Text('Select Course'),
                    Icon(Icons.arrow_downward_outlined)
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
                    Icon(Icons.arrow_downward_outlined)
                  ],
                ),
                color: Colors.white70,
                onPressed: (() {}),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Color.fromARGB(255, 172, 170, 170),
                  child: Text('View'),
                  onPressed: () async {}),
            ],
          ),
          kheight10,
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
                          'Forenoon',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'Afternoon',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                      ),
                    ]),
              ],
            ),
          ),
          LimitedBox(
              maxHeight: 450,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: ((context, index) {
                    return Column(
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
                                    'ADAM ARUN ADAM ARUN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'A',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'A',
                                    textAlign: TextAlign.center,
                                  )
                                ]),
                          ],
                        ),
                        kheight20,
                      ],
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
              )
            ],
          )
        ],
      ),
    );
  }
}
