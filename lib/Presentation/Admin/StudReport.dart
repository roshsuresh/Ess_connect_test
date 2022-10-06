import 'package:dropdown_search/dropdown_search.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_selector/widget/flutter_multi_select.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Application/Staff_Providers/StudListProvider.dart';
import '../../Constants.dart';
import '../../Domain/Staff/StudentReport_staff.dart';
import '../../utils/constants.dart';

class Stud1Report extends StatelessWidget {
  const Stud1Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Report'),
          titleSpacing: 20.0,
          centerTitle: true,
          toolbarHeight: 30.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),

        body: Container(child:
          StudCurrentStudying(),

        ));
  }
}

class StudCurrentStudying extends StatefulWidget {

  const StudCurrentStudying({Key? key}) : super(key: key);

  @override
  State<StudCurrentStudying> createState() => _StudCurrentStudyingState();
}

class _StudCurrentStudyingState extends State<StudCurrentStudying> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<StudReportListProvider_stf>(context, listen: false);
      p.stdReportSectionStaff();
      p.clearAllFilters();
      p.removeSectionAll();
      p.courseClear();
      p.divisionClear();
      p.sectionClear();
      p.removeSectionAll();
      p.removeDivisionAll();
      p.removeCourseAll();
      p.viewStudentReportList();
    });
  }

  String? phn;
  String sectionId = '';

  final studReportInitialValuesController = TextEditingController();
  final studReportInitialValuesController1 = TextEditingController();
  final StudReportcourseController = TextEditingController();
  final StudReportcourseController1 = TextEditingController();
  final StudReportDivisionController = TextEditingController();
  final StudReportDivisionController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<StudReportListProvider_stf>(
      builder: (context, value, child) => ListView(
        children: [
          kheight10,
          Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<StudReportListProvider_stf>(
                    builder: (context, snapshot, child) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: studReportinitvalues_stf!.length,
                                            itemBuilder: (context, index) {
                                              // print(snapshot

                                              //     .attendenceInitialValues.length);

                                              value.removeSectionAll();
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    selectedTileColor:
                                                    Colors.blue.shade100,
                                                    selectedColor: UIGuide.PRIMARY2,
                                                    // selected:
                                                    //     studReportinitvalues_stf![index],
                                                    onTap: () async {
                                                      print(
                                                          'guh.....${studReportinitvalues_stf![index]}');
                                                      studReportInitialValuesController
                                                          .text =
                                                          await studReportinitvalues_stf![
                                                          index]['value'] ??
                                                              '--';
                                                      studReportInitialValuesController1
                                                          .text =
                                                          await studReportinitvalues_stf![
                                                          index]['text'] ??
                                                              '--';
                                                      sectionId =
                                                          studReportInitialValuesController
                                                              .text
                                                              .toString();

                                                      // snapshot.addSelectedCourse(
                                                      //     attendecourse![index]);
                                                      print(sectionId);
                                                      await Provider.of<
                                                          StudReportListProvider_stf>(
                                                          context,
                                                          listen: false)
                                                          .getCourseList(sectionId);
                                                      Navigator.of(context).pop();
                                                    },
                                                    title: Text(
                                                      studReportinitvalues_stf![index]
                                                      ['text'] ??
                                                          '--',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1,
                                                    color: Colors.black,
                                                  )
                                                ],
                                              );
                                            }),
                                      ],
                                    ));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: studReportInitialValuesController1,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "Select Section",
                                    hintText: "Section",
                                  ),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: studReportInitialValuesController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "",
                                    hintText: "",
                                  ),
                                  enabled: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Spacer(),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<StudReportListProvider_stf>(
                    builder: (context, snapshot, child) {

                      return DropdownSearch<String>.multiSelection(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Course"
                      ) ,
                          mode: Mode.DIALOG,
                          popupTitle: const Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Text("Select Course"),
                        ),
                          showSearchBox: true,
                          onChanged: (List<String> val) {
                            snapshot.clearAllFilters();
                            snapshot.addFilterCourse(val.first);
                          },
                          //showSelectedItems: false,
                          items: snapshot.courselist
                              .map((e) => e.text!)
                              .toSet()
                              .toList(),

                       
                      );
                      // return InkWell(
                      //   onTap: () async {
                      //     showDialog(
                      //         context: context,
                      //         builder: (context) {
                      //           return Dialog(
                      //               child: Container(
                      //                 child: SingleChildScrollView(
                      //                   scrollDirection: Axis.vertical,
                      //                   child: Column(
                      //                     mainAxisSize: MainAxisSize.min,
                      //                     children: [
                      //                       ListView.builder(
                      //                           shrinkWrap: true,
                      //                           itemCount: snapshot.courselist.length,
                      //                           itemBuilder: (context, index) {
                      //                             print(snapshot.courselist.length);
                      //                             // value.removeDivisionAll();
                      //                             return ListTile(
                      //                               selectedTileColor:
                      //                               Colors.blue.shade100,
                      //                               selectedColor: UIGuide.PRIMARY2,
                      //                               selected: snapshot.isCourseSelected(
                      //                                   snapshot.courselist[index]),
                      //                               onTap: () async {
                      //                                 print(snapshot.courselist.length);
                      //                                 StudReportcourseController.text =
                      //                                     snapshot.courselist[index]
                      //                                         .value ??
                      //                                         '---';
                      //                                 StudReportcourseController1.text =
                      //                                     snapshot.courselist[index]
                      //                                         .text ??
                      //                                         '---';
                      //                                 snapshot.addSelectedCourse(
                      //                                     snapshot.courselist[index]);
                      //
                      //                                 print(StudReportcourseController
                      //                                     .text);
                      //                                 sectionId =
                      //                                     studReportInitialValuesController
                      //                                         .text
                      //                                         .toString();
                      //
                      //                                 await Provider.of<
                      //                                     StudReportListProvider_stf>(
                      //                                     context,
                      //                                     listen: false)
                      //                                     .getDivisionList(sectionId);
                      //
                      //                                 Navigator.of(context).pop();
                      //                               },
                      //                               title: Text(
                      //                                 snapshot.courselist[index].text ??
                      //                                     '---',
                      //                                 textAlign: TextAlign.center,
                      //                               ),
                      //                             );
                      //                           }),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ));
                      //         });
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(5.0),
                      //     child: Column(
                      //       children: [
                      //         SizedBox(
                      //           height: 40,
                      //           child: TextField(
                      //             textAlign: TextAlign.center,
                      //             controller: StudReportcourseController1,
                      //             decoration: InputDecoration(
                      //               filled: true,
                      //               fillColor: Color.fromARGB(255, 238, 237, 237),
                      //               border: OutlineInputBorder(),
                      //               labelText: "Select Course",
                      //               hintText: "Course",
                      //             ),
                      //             enabled: false,
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 0,
                      //           child: TextField(
                      //             controller: StudReportcourseController,
                      //             decoration: InputDecoration(
                      //               filled: true,
                      //               fillColor: Color.fromARGB(255, 238, 237, 237),
                      //               border: OutlineInputBorder(),
                      //               labelText: "",
                      //               hintText: "",
                      //             ),
                      //             enabled: false,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );


                    }),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.49,
                child: Consumer<StudReportListProvider_stf>(
                    builder: (context, snapshot, child) {
                      return InkWell(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: snapshot.divisionlist.length,
                                              itemBuilder: (context, index) {
                                                print(snapshot.divisionlist.length);
                                                // value.removeDivisionAll();
                                                return Column(
                                                  children: [
                                                    ListTile(
                                                      selectedTileColor:
                                                      Colors.blue.shade100,
                                                      selectedColor: UIGuide.PRIMARY2,
                                                      selected: snapshot
                                                          .isDivisionSelected(snapshot
                                                          .divisionlist[index]),
                                                      onTap: () async {
                                                        print(snapshot
                                                            .divisionlist.length);
                                                        StudReportDivisionController
                                                            .text = snapshot
                                                            .divisionlist[index]
                                                            .value ??
                                                            '---';
                                                        StudReportDivisionController1
                                                            .text = snapshot
                                                            .divisionlist[index]
                                                            .text ??
                                                            '---';
                                                        snapshot.addSelectedDivision(
                                                            snapshot
                                                                .divisionlist[index]);

                                                        print(
                                                            StudReportDivisionController
                                                                .text);

                                                        Navigator.of(context).pop();
                                                      },
                                                      title: Text(
                                                        snapshot.divisionlist[index]
                                                            .text ??
                                                            '---',
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 1,
                                                      color: Colors.black,
                                                    )
                                                  ],
                                                );
                                              }),
                                        ],
                                      ),
                                    ));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: StudReportDivisionController1,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "Select Division",
                                    hintText: "Division",
                                  ),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 0,
                                child: TextField(
                                  controller: StudReportDivisionController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 238, 237, 237),
                                    border: OutlineInputBorder(),
                                    labelText: "",
                                    hintText: "",
                                  ),
                                  enabled: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Spacer(),
              MaterialButton(
                child: const Text('View'),
                color: Colors.grey,
                onPressed: (() {}),
              ),
              kWidth,
              kWidth,
              kWidth,
              kWidth,
              kWidth,
              kWidth,
            ],
          ),

          LimitedBox(
            maxHeight: size.height - 200,
            child: Consumer<StudReportListProvider_stf>(
              builder: (context, provider, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: provider.viewStudReportListt.length,
                itemBuilder: (context, index) {
                  String status = provider
                      .viewStudReportListt[index].terminationStatus
                      .toString();
                  print(status);

                  if (status.toString() == false.toString()) {
                    return Column(
                      children: [
                        kheight10,
                        GestureDetector(

                          //onTap: () => StudentListItem(model: provider.viewStudReportListt[index]),
                          onTap: () => StudentListItem(model: provider.viewStudReportListt[index]),

                          child: Container(
                            width: size.width - 10,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 236, 233, 233),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kWidth,


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [

                                          RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            strutStyle:
                                            const StrutStyle(fontSize: 8.0),
                                            text: TextSpan(
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                                text: provider
                                                    .viewStudReportListt[
                                                index]
                                                    .name ??
                                                    '---'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Roll No : ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                          RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            strutStyle:
                                            const StrutStyle(fontSize: 8.0),
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                              text: provider
                                                  .viewStudReportListt[
                                              index]
                                                  .rollNo ==
                                                  null
                                                  ? '---'
                                                  : provider
                                                  .viewStudReportListt[
                                              index]
                                                  .rollNo
                                                  .toString(),
                                            ),
                                          ),
                                          kWidth,
                                          kWidth,
                                          Row(
                                            children: [
                                              Text(
                                                'Division : ',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13),
                                              ),
                                              RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                strutStyle: const StrutStyle(
                                                    fontSize: 8.0),
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  text: provider
                                                      .viewStudReportListt[
                                                  index]
                                                      .division ??
                                                      '---',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Adm No : ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                          RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            strutStyle:
                                            const StrutStyle(fontSize: 8.0),
                                            text: TextSpan(
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                              text: provider
                                                  .viewStudReportListt[
                                              index]
                                                  .admnNo ??
                                                  '---',
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      '',
                      style: TextStyle(fontSize: 0),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }



}





class Stud2Report extends StatefulWidget {
  const Stud2Report({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Stud2Report> createState() => _Stud2ReportState();
}

class _Stud2ReportState extends State<Stud2Report> {
  List<String> dataString = [
    "Std-I",
    "Std-II",
    "Std-III",
    "Std-IV",
    "Std-V",
    "Std-VI",
    "Std-VII",
    'Std-VIII'
  ];

  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const SizedBox(
              height: 20,
            ),
            CustomMultiSelectField<String>(
              title: "Courses",
              items: dataString,
              enableAllOptionSelect: true,
              onSelectionDone: _onCountriesSelectionComplete,
              itemAsString: (item) => item.toString(),
            ),
          ],
        ),
      ),
    );
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});

  }
}

