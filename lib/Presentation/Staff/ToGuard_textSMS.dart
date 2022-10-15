import 'package:Ess_test/Application/Staff_Providers/Notification_ToGuardianProvider.dart';
import 'package:Ess_test/Application/Staff_Providers/TextSMS_ToGuardian.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Domain/Staff/ToGuardian_TextSMS.dart';
import 'package:Ess_test/utils/constants.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<TextSMS_ToGuardian_Providers>(context, listen: false);
      p.communicationToGuardianCourseStaff();
      p.clearAllFilters();
      p.selectedCourse.clear();
      p.courseClear();
      p.divisionClear();
      p.removeDivisionAll();
      p.clearStudentList();
      p.selectedList.clear();
      // p.selectAll();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                            staffTextSMSToGuardRespo!.length,
                                        itemBuilder: (context, index) {
                                          // print(snapshot

                                          //     .attendenceInitialValues.length);

                                          // snapshot.clearStudentList();

                                          return ListTile(
                                            selectedTileColor:
                                                Colors.blue.shade100,
                                            selectedColor: UIGuide.PRIMARY2,

                                            // selected: snapshot.isCourseSelected(
                                            //     attendecourse![index]),

                                            onTap: () async {
                                              print(
                                                  'guh.....${staffTextSMSToGuardRespo![index]}');
                                              notificationCourseController
                                                      .text =
                                                  await staffTextSMSToGuardRespo![
                                                          index]['value'] ??
                                                      '--';
                                              notificationCourseController1
                                                      .text =
                                                  await staffTextSMSToGuardRespo![
                                                          index]['text'] ??
                                                      '--';
                                              courseId =
                                                  notificationCourseController
                                                      .text
                                                      .toString();

                                              // snapshot.addSelectedCourse(
                                              //     attendecourse![index]);
                                              print(courseId);
                                              await Provider.of<
                                                          TextSMS_ToGuardian_Providers>(
                                                      context,
                                                      listen: false)
                                                  .communicationToGuardianDivisionStaff(
                                                      courseId);
                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              staffTextSMSToGuardRespo![index]
                                                      ['text'] ??
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
                      onTap: () async {
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
                                        itemCount: snapshot
                                            .notificationDivisionList.length,
                                        itemBuilder: (context, index) {
                                          print(snapshot
                                              .notificationDivisionList.length);

                                          // value.removeDivisionAll();
                                          return ListTile(
                                            selectedTileColor:
                                                Colors.blue.shade100,
                                            selectedColor: UIGuide.PRIMARY2,
                                            // selected: snapshot
                                            //     .isDivisonSelected(snapshot
                                            //             .attendenceDivisionList[
                                            //         index]),
                                            onTap: () async {
                                              print(snapshot
                                                  .notificationDivisionList
                                                  .length);
                                              notificationDivisionListController
                                                  .text = snapshot
                                                      .notificationDivisionList[
                                                          index]
                                                      .value ??
                                                  '---';
                                              notificationDivisionListController1
                                                  .text = snapshot
                                                      .notificationDivisionList[
                                                          index]
                                                      .text ??
                                                  '---';
                                              // snapshot.addSelectedDivision(
                                              //     snapshot.attendenceDivisionList[
                                              //         index]);

                                              print(
                                                  notificationDivisionListController
                                                      .text);
                                              divisionId =
                                                  notificationDivisionListController
                                                      .text
                                                      .toString();
                                              courseId =
                                                  notificationCourseController1
                                                      .text
                                                      .toString();

                                              Navigator.of(context).pop();
                                            },
                                            title: Text(
                                              snapshot
                                                      .notificationDivisionList[
                                                          index]
                                                      .text ??
                                                  '---',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            .clearStudentList();
                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .divisionClear();
                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .removeDivisionAll();
                        divisionId =
                            notificationDivisionListController.text.toString();
                        courseId = notificationCourseController.text.toString();

                        await Provider.of<TextSMS_ToGuardian_Providers>(context,
                                listen: false)
                            .getNotificationView(courseId, divisionId);
                      }
                    }),
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
                  Text(
                    '   NO.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    //   textAlign: TextAlign.center,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Consumer<TextSMS_ToGuardian_Providers>(
                    builder: (context, value, child) => GestureDetector(
                        onTap: () {
                          value.selectAll();
                        },
                        child: value.isselectAll
                            ? SvgPicture.asset(
                                UIGuide.check,
                                // width: 25,
                                // height: 25,
                                color: UIGuide.light_Purple,
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
                return LimitedBox(
                  maxHeight: size.height - 360,
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => Text_Matter_Notification()),
              // );
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
  final TExtSMS_VIEW_byStaff viewStud;
  const TextSMS_studListView(
      {Key? key, required this.viewStud, required this.indexx})
      : super(key: key);
  final int indexx;

  @override
  Widget build(BuildContext context) {
    return Consumer<TextSMS_ToGuardian_Providers>(
      builder: (context, value, child) => SizedBox(
        height: 50,
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

class Text_Matter_Notification extends StatelessWidget {
  final List<String> toList;
  final String type;
  Text_Matter_Notification({Key? key,required this.toList, required this.type}) : super(key: key);

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
            child: Consumer<NotificationToGuardian_Providers>(
              builder: (context,snapshot,value) {
                return MaterialButton(
                  onPressed: () {

                   snapshot.sendNotification(context, titleController.text, matterController.text,toList, sentTo: type);
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: UIGuide.light_Purple,
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
