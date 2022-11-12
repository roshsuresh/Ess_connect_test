import 'package:Ess_test/Presentation/Admin/TimeTable/ClassTimeTable.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'TeacherTable.dart';

class ScreenTimeTable extends StatelessWidget {
  const ScreenTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'TimeTable',
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
                text: "Class Timetable",
              ),
              Tab(text: "Teacher Timetable"),
            ],
          ),
          backgroundColor: UIGuide.light_Purple,
        ),
        body: TabBarView(
          children: [ClassTimeTable(), TeacherTimeTable()],
        ),
      ),
    );
  }
}
