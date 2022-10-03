import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Constants.dart';
import '../../utils/constants.dart';

class Staff_ToGuardian extends StatelessWidget {
  Staff_ToGuardian({Key? key}) : super(key: key);
  String? valuee;
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Communication to Guardian',
            // style: TextStyle(fontSize: 18),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 45.2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: "Notification",
              ),
              Tab(text: "Text SMS"),
            ],
          ),
          backgroundColor: UIGuide.light_Purple,
        ),
        body: TabBarView(
          children: [
            Notification_StaffToGuardain(
                size: size, valuee: valuee, checked: checked),
            Notification_StaffToGuardain(
                size: size, valuee: valuee, checked: checked),
          ],
        ),
      ),
    );
  }
}

class Notification_StaffToGuardain extends StatelessWidget {
  const Notification_StaffToGuardain({
    Key? key,
    required this.size,
    required this.valuee,
    required this.checked,
  }) : super(key: key);

  final Size size;
  final String? valuee;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                kWidth,
                kWidth,
                MaterialButton(
                  minWidth: size.width - 230,
                  child: Text('Select Course'),
                  color: Colors.white70,
                  onPressed: (() {}),
                ),
                Spacer(),
                MaterialButton(
                  minWidth: size.width - 230,
                  child: const Text('Select Division'),
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
                  minWidth: 60, color: Colors.grey,
                  //   style: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {},
                  child: Text('View'),
                ),
              ],
            ),
            kheight20,
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1.5),
              },
              children: [
                TableRow(children: [
                  Text(
                    '   NO.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    //   textAlign: TextAlign.center,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Text(
                      'Select All',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: UIGuide.light_Purple),
                    ),
                  )
                ])
              ],
            ),
            LimitedBox(
              maxHeight: size.height - 250,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return ListTile(
                    style: ListTileStyle.list,
                    selectedColor: UIGuide.light_Purple,
                    leading: Text(
                      (index + 1).toString(),
                      textAlign: TextAlign.center,
                    ),
                    title: Text('AADHAM'),
                    subtitle: Text('2343'),
                    trailing: Icon(Icons.check_box_outline_blank_outlined),
                  );
                }),
              ),
            ),
            kheight20
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: UIGuide.light_Purple,
            onPressed: () {},
            child: Text('Proceed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        )));
  }
}
