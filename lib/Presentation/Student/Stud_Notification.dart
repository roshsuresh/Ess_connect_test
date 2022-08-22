import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class Stud_Notification extends StatelessWidget {
  Stud_Notification({Key? key}) : super(key: key);
  var size, height, width;
  var kheight = const SizedBox(
    height: 8,
  );
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              kheight,
              Container(
                width: width - 4,
                height: 150,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      )
                    ],
                    color: Color.fromARGB(255, 239, 231, 245),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Exam Reminder 🔔'),
                      kheight,
                      const Text(
                        '  SSC CGL exam is conducted in Tiers. Tier-I & II will be conducted online. On the other hand, Tier-III & IV will be conducted in offline mode. The candidate has to clear every tier and score cut-off marks, decided by the SSC board, to proceed further in this exam. ',
                        style: TextStyle(fontSize: 12),
                      ),
                      kheight,
                      Row(
                        children: const [
                          Text(
                            'Date',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            '10/02/2022',
                            style: TextStyle(
                                color: Color.fromARGB(255, 49, 47, 47),
                                fontSize: 12),
                          ),
                          Spacer(),
                          Text(
                            'Send by ',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'Teacher',
                            style: TextStyle(
                                color: Color.fromARGB(255, 49, 47, 47),
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}