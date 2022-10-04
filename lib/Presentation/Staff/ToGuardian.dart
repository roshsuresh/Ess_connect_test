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
                SizedBox(
                  width: 100,
                  child: MaterialButton(
                    minWidth: 60, color: Colors.grey,
                    //   style: ButtonStyle(shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Text('View'),
                  ),
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
              maxHeight: size.height - 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 50,
                    child: ListTile(
                      style: ListTileStyle.list,
                      selectedColor: UIGuide.light_Purple,
                      leading: Text(
                        (index + 1).toString(),
                        textAlign: TextAlign.center,
                      ),
                      title: Text('AADHAM'),
                      subtitle: Text('2343'),
                      trailing: Icon(Icons.check_box_outline_blank_outlined),
                    ),
                  );
                }),
              ),
            ),
            kheight20,
            kheight20
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: UIGuide.light_Purple,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Text_Matter_Notification()),
              );
            },
            child: Text('Proceed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        )));
  }
}

class Text_Matter_Notification extends StatelessWidget {
  Text_Matter_Notification({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final matterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Notification'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: titleController,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Title*',
                  hintText: 'Enter Title',
                  labelStyle: TextStyle(color: UIGuide.light_Purple),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: UIGuide.light_Purple, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: TextFormField(
                controller: matterController,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Matter*',
                  hintText: 'Enter Matter',
                  labelStyle: TextStyle(color: UIGuide.light_Purple),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: UIGuide.light_Purple, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Send',
                style: TextStyle(color: Colors.white),
              ),
              color: UIGuide.light_Purple,
            ),
          )
        ],
      ),
    );
  }
}
