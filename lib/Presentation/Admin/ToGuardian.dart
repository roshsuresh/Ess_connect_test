import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToGuardian extends StatelessWidget {
  ToGuardian({Key? key}) : super(key: key);
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    MaterialButton(
                      minWidth: size.width - 200,
                      child: Center(child: Text('Select Course')),
                      color: Colors.white70,
                      onPressed: (() async {}),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: size.width - 200,
                      child: Center(child: Text('Select Division')),
                      color: Colors.white70,
                      onPressed: (() async {}),
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20)),
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
                                value: 1,
                                groupValue: valuee,
                                onChanged: (index) {}),
                            Text('Notification')
                          ],
                        ),
                        kWidth,
                        Container(
                          child: MaterialButton(
                            minWidth: 30, color: Colors.grey,
                            //     style: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {},
                            child: Text('View'),
                          ),
                        ),
                        kheight10,
                        // SizedBox(
                        //   child: Table(
                        //     children: [TableRow(children: [])],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
