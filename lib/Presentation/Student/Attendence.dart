import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Application/StudentProviders/AttendenceProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class Attendence extends StatelessWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AttendenceProvider>(context, listen: false).attendenceList();
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Attendence'),
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
          padding: const EdgeInsets.all(4.0),
          child: Consumer<AttendenceProvider>(
            builder: (context, value, child) => value.loading
                ? const spinkitLoader()
                : ListView(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: UIGuide.light_Purple, width: .5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Consumer<AttendenceProvider>(
                            builder: (_, provider, child) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          'Working Days : ${provider.workDays == null ? '--' : provider.workDays.toString()}'),
                                      const Divider(),
                                      const Divider(),
                                      Text(
                                          'Days Present :  ${provider.presentDays == null ? '--' : provider.presentDays.toString()}')
                                    ],
                                  ),
                                  kheight10,
                                  kheight10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          'Days Absent : ${provider.absentDays == null ? '--' : provider.absentDays.toString()}'),
                                      const Divider(),
                                      const Divider(),
                                      const Divider(),
                                      const Divider(),
                                      Text(
                                          'Percentage % : ${provider.attendancePercentage == null ? '--' : provider.attendancePercentage.toString()}')
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      kheight10,
                      Table(
                        border: TableBorder.all(
                            color: UIGuide.light_Purple, width: .2),
                        children: const [
                          TableRow(
                              decoration:
                                  BoxDecoration(color: UIGuide.light_black),
                              children: [
                                Text(
                                  'Month',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'No of \n Working \n Days',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Days \n Present',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Days \n absent',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  ' \n %',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ])
                        ],
                      ),
                      Consumer<AttendenceProvider>(
                        builder: (_, value, child) => ListView.builder(
                            itemCount: attend == null ? 0 : attend!.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              String percentage =
                                  attend![index]['percentage'].toString();

                              return Table(
                                border: TableBorder.all(
                                    color: Color.fromARGB(255, 245, 243, 243)),
                                children: [
                                  TableRow(children: [
                                    Text(
                                      '${attend![index]['month'].toString()} \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${attend![index]['totalWorkingDays'].toString()} \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${attend![index]['daysPresent'].toString()} \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${attend![index]['daysAbsent'].toString()} \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '$percentage \n ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ])
                                ],
                              );
                            })),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
