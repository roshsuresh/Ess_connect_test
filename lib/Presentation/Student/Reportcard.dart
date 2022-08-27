import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Report card'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            kheight20,
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(5),
                3: FlexColumnWidth(2)
              },
              // border: TableBorder.all(),
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
                          child: Text('No.'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'View',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                      ),
                    ]),
              ],
            ),
            LimitedBox(
              maxHeight: size.height - 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Table(
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(5),
                        3: FlexColumnWidth(2)
                      },
                      //  border: TableBorder.all(),
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                                // color: Color.fromARGB(
                                //     255, 230, 227, 227),
                                ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('1')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '12/Jan/22',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Text(
                                'Assessment Report Card',
                                style: TextStyle(fontSize: 14),
                              ),
                              Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.remove_red_eye_outlined))),
                            ]),
                      ],
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
