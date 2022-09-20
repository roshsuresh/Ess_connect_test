import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class Staff_ToGuardian extends StatelessWidget {
  Staff_ToGuardian({Key? key}) : super(key: key);
  String? valuee;
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Communication to Guardian',
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
          Container(
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Row(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: valuee,
                          onChanged: (index) {
                            checked;
                          }),
                      Text('Text SMS')
                    ],
                  ),
                  kWidth,
                  Row(
                    children: [
                      Radio(
                          value: 1, groupValue: valuee, onChanged: (index) {}),
                      Text('Notification')
                    ],
                  ),
                  kWidth, Spacer(),
                  Container(
                    child: MaterialButton(
                      minWidth: 30, color: Colors.grey,
                      //     style: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {},
                      child: Text('View'),
                    ),
                  ),
                  kWidth, kWidth
                  // SizedBox(
                  //   child: Table(
                  //     children: [TableRow(children: [])],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
