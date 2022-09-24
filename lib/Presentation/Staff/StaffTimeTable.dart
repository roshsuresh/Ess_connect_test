
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';
import '../../utils/constants.dart';

class Staff_Timetable extends StatelessWidget {
  const Staff_Timetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
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
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(2),
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
                            'TimeTable',
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
            Consumer(
              builder: (context, value, child) {
                return Table(
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(2),

                    // 3: FlexColumnWidth(2)
                  },
                  //  border: TableBorder.all(),
                  children: [
                    TableRow(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 245, 242, 242),
                        ),
                        children: [
                          Center(
                            child: Text(
                              '---',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {},
                            child: Icon(Icons.remove_red_eye),
                          ),
                        ]),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
