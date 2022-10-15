import 'package:Ess_test/Application/Staff_Providers/TextSMS_ToGuardian.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Domain/Staff/ToGuardian_TextSMS.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TextSMS_staff extends StatefulWidget {
  const TextSMS_staff({Key? key}) : super(key: key);

  @override
  State<TextSMS_staff> createState() => _TextSMS_staffState();
}

class _TextSMS_staffState extends State<TextSMS_staff> {
  String courseId = '';

  String divisionId = '';

  final notificationCourseController = TextEditingController();

  final notificationCourseController1 = TextEditingController();

  final notificationDivisionListController = TextEditingController();

  final notificationDivisionListController1 = TextEditingController();
  final smsFormats = TextEditingController();
  final smsFormats1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<TextSMS_ToGuardian_Providers>(context, listen: false);
      p.getCourseList();
      p.getFormatList();
      p.clearAllFilters();
      p.removeCourseAll();
      p.courseClear();
      p.divisionClear();
      p.removeDivisionAll();
      p.clearStudentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<TextSMS_ToGuardian_Providers>(context, listen: false)
    //     .getCourseList();
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Consumer<TextSMS_ToGuardian_Providers>(
                      builder: (context, snapshot, child) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            snapshot.smscourseList.length,
                                        itemBuilder: (context, index) {
                                          // print(snapshot

                                          //     .attendenceInitialValues.length);

                                          // value.removeCourseAll();
                                          return ListTile(
                                            selectedTileColor:
                                                Colors.blue.shade100,
                                            selectedColor: UIGuide.PRIMARY2,

                                            // selected: snapshot.isCourseSelected(
                                            //     attendecourse![index]),

                                            onTap: () async {
                                              print(
                                                  'guh.....${snapshot.smscourseList[index]}');
                                              notificationCourseController
                                                  .text = snapshot
                                                      .smscourseList[index]
                                                      .value ??
                                                  '--';
                                              notificationCourseController1
                                                  .text = snapshot
                                                      .smscourseList[index]
                                                      .text ??
                                                  '--';
                                              String courseId =
                                                  notificationCourseController
                                                      .text
                                                      .toString();

                                              print(courseId);
                                              await Provider.of<
                                                          TextSMS_ToGuardian_Providers>(
                                                      context,
                                                      listen: false)
                                                  .getDivisionList(courseId);
                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              snapshot.smscourseList[index]
                                                      .text ??
                                                  '--',
                                              textAlign: TextAlign.center,
                                            ),
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
                                controller: notificationCourseController1,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "Select Course",
                                  hintText: "Course",
                                ),
                                enabled: false,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: notificationCourseController,
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
                  child: Consumer<TextSMS_ToGuardian_Providers>(
                      builder: (context, snapshot, child) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: LimitedBox(
                                    maxHeight: size.height - 300,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.divisionlist.length,
                                        itemBuilder: (context, index) {
                                          // print(snapshot

                                          //     .attendenceInitialValues.length);

                                          // value.removeCourseAll();
                                          return ListTile(
                                            selectedTileColor: Color.fromARGB(
                                                255, 15, 104, 177),
                                            selectedColor: UIGuide.PRIMARY2,
                                            // selected: snapshot.isFormatSelected(
                                            //     snapshot.divisionlist[index]),
                                            onTap: () async {
                                              notificationDivisionListController
                                                  .text = snapshot
                                                      .divisionlist[index]
                                                      .value ??
                                                  '--';

                                              print(smsFormats.text);
                                              notificationDivisionListController1
                                                  .text = snapshot
                                                      .divisionlist[index]
                                                      .text ??
                                                  '--';

                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              snapshot.divisionlist[index]
                                                      .text ??
                                                  '--',
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        }),
                                  ),
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
                                controller: notificationDivisionListController1,
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
                                textAlign: TextAlign.center,
                                controller: notificationDivisionListController,
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
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Consumer<TextSMS_ToGuardian_Providers>(
                      builder: (context, snapshot, child) {
                    // attachmentid = snapshot.id ?? '';
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: LimitedBox(
                                    maxHeight: size.height - 300,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.smsFormats.length,
                                        itemBuilder: (context, index) {
                                          // print(snapshot

                                          //     .attendenceInitialValues.length);

                                          // value.removeCourseAll();
                                          return ListTile(
                                            selectedTileColor: Color.fromARGB(
                                                255, 15, 104, 177),
                                            selectedColor: UIGuide.PRIMARY2,
                                            selected: snapshot.isFormatSelected(
                                                snapshot.smsFormats[index]),
                                            onTap: () async {
                                              smsFormats.text = snapshot
                                                      .smsFormats[index]
                                                      .value ??
                                                  '--';

                                              print(smsFormats.text);
                                              smsFormats1.text = snapshot
                                                      .smsFormats[index].text ??
                                                  '--';

                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              snapshot.smsFormats[index].text ??
                                                  '--',
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        }),
                                  ),
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
                                controller: smsFormats1,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 238, 237, 237),
                                  border: OutlineInputBorder(),
                                  labelText: "Select SMS Formats",
                                  hintText: "SMS Formats",
                                ),
                                enabled: false,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: smsFormats,
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
                    color: Color.fromARGB(255, 172, 170, 170),
                    child: Text('View'),
                    onPressed: () async {
                      if (notificationCourseController.text.isEmpty &&
                          notificationDivisionListController.text.isEmpty) {
                        return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                headerAnimationLoop: false,
                                title: 'Error',
                                desc: 'Select course & Division',
                                btnOkOnPress: () {
                                  return;
                                },
                                btnOkIcon: Icons.cancel,
                                btnOkColor: Colors.red)
                            .show();
                      } else {
                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .divisionClear();
                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .removeDivisionAll();
                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .courseClear();
                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .removeCourseAll();
                        divisionId =
                            notificationDivisionListController.text.toString();
                        courseId = notificationCourseController.text.toString();

                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .getSMSView(courseId, divisionId);
                      }
                    }),
                kWidth,
                kWidth,
                kWidth,
                kWidth,
                kWidth,
              ],
            ),
            kheight20,
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1.2),
              },
              children: [
                TableRow(children: [
                  const Text(
                    '   NO.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    //   textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Consumer<TextSMS_ToGuardian_Providers>(
                    builder: (context, value, child) => GestureDetector(
                        onTap: () {
                          value.selectAll();
                        },
                        child: value.isselectAll
                            ? Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: SvgPicture.asset(
                                  UIGuide.check,
                                  // width: 25,
                                  // height: 25,
                                  color: UIGuide.light_Purple,
                                ),
                              )
                            : Text(
                                'Select All',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: UIGuide.light_Purple),
                              )),
                  )
                ])
              ],
            ),
            Consumer<TextSMS_ToGuardian_Providers>(
              builder: (context, value, child) {
                return value.loading
                    ? LimitedBox(
                        maxHeight: size.height - 330,
                        child: Center(
                          child: spinkitLoader(),
                        ),
                      )
                    : LimitedBox(
                        maxHeight: size.height - 330,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.notificationView.isEmpty
                              ? 0
                              : value.notificationView.length,
                          itemBuilder: ((context, index) {
                            return TextSMS_studListView(
                              viewStud: value.notificationView[index],
                              indexx: index,
                            );
                          }),
                        ),
                      );
              },
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
                MaterialPageRoute(builder: (context) => Text_Matter_SMS()),
              );
            },
            child: const Text('Proceed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        )));
  }
}

class TextSMS_studListView extends StatelessWidget {
  final TextSMSToGuardianCourseDivision_notification_Stf viewStud;
  const TextSMS_studListView(
      {Key? key, required this.viewStud, required this.indexx})
      : super(key: key);
  final int indexx;

  @override
  Widget build(BuildContext context) {
    return Consumer<TextSMS_ToGuardian_Providers>(
      builder: (context, value, child) => SizedBox(
        height: 54,
        child: ListTile(
          style: ListTileStyle.list,
          selectedColor: UIGuide.light_Purple,
          leading: Text(
            (indexx + 1).toString(),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            value.selectItem(viewStud);
          },
          selectedTileColor: Color.fromARGB(255, 10, 27, 141),
          title: Text(viewStud.name ?? '---'),
          subtitle: Text(viewStud.admnNo ?? '---'),
          trailing: viewStud.selected != null && viewStud.selected!
              ? SvgPicture.asset(
                  UIGuide.check,
                  // width: 25,
                  // height: 25,
                  color: UIGuide.light_Purple,
                )
              : SvgPicture.asset(
                  UIGuide.notcheck,
                  // width: 25,
                  // height: 25,
                  color: UIGuide.light_Purple,
                ),
        ),
      ),
    );
  }
}

class Text_Matter_SMS extends StatelessWidget {
  Text_Matter_SMS({Key? key}) : super(key: key);

  final smsFormats = TextEditingController();
  final smsFormats1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS'),
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
          kheight20,
          Row(
            children: [
              kWidth,
              SizedBox(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10.0),
                //   //  color: UIGuide.light_Purple,
                //   border: Border.all(
                //       color: UIGuide.light_Purple,
                //       width: 1.0,
                //       style: BorderStyle.solid),
                // ),
                height: 42,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Consumer<TextSMS_ToGuardian_Providers>(
                    builder: (context, snapshot, child) {
                  // attachmentid = snapshot.id ?? '';
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: LimitedBox(
                                  maxHeight: size.height - 300,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.smsFormatList.length,
                                      itemBuilder: (context, index) {
                                        // print(snapshot

                                        //     .attendenceInitialValues.length);

                                        // value.removeCourseAll();
                                        return ListTile(
                                          selectedTileColor:
                                              Color.fromARGB(255, 15, 104, 177),
                                          selectedColor: UIGuide.PRIMARY2,
                                          // selected: snapshot.isFormatSelected(
                                          //     snapshot.smsFormats[index]),
                                          onTap: () async {
                                            smsFormats.text = snapshot
                                                    .smsFormatList[index].id ??
                                                '--';

                                            print(smsFormats.text);
                                            smsFormats1.text = snapshot
                                                    .smsFormatList[index]
                                                    .name ??
                                                '--';

                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            snapshot.smsFormatList[index]
                                                    .name ??
                                                '--',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ));
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: smsFormats1,
                              decoration: InputDecoration(
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 213, 215, 218),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: UIGuide.light_Purple, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                labelText: "Select SMS Formats",
                                hintText: "SMS Formats",
                              ),
                              enabled: false,
                            ),
                          ),
                          Container(
                            height: 0,
                            width: 0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: smsFormats,
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
                height: 38,
                width: MediaQuery.of(context).size.width * 0.30,
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Preview',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: UIGuide.light_Purple,
                ),
              ),
              kWidth,
              kWidth,
              kWidth,
              kWidth
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SizedBox(
            width: 120,
            height: 50,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Send',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: UIGuide.light_Purple,
            ),
          ),
        ),
      ),
    );
  }
}
