import 'package:Ess_test/Application/AdminProviders/NotificationStaff.dart';
import 'package:Ess_test/Application/AdminProviders/NotificationToGuardian.dart';
import 'package:Ess_test/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Domain/Admin/StaffListModel.dart';
import 'package:Ess_test/Domain/Staff/StudentReport_staff.dart';
import 'package:Ess_test/Presentation/Admin/Communication/StaffTextSMS.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Domain/Staff/ToGuardian.dart';
import 'ToGuardian.dart';

class AdminToStaff extends StatelessWidget {
  AdminToStaff({Key? key}) : super(key: key);
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
            'Communication to Staff',
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
            // Consumer<NotificationToStaffAdminProviders>(
            //   builder: (context, value, child) {
            //     if (value.isClassTeacher != false) {
            //       return
            AdminToStaffNotification(),

            TextSMSAdminToStaff()
          ],
        ),
      ),
    );
  }
}

class AdminToStaffNotification extends StatefulWidget {
  const AdminToStaffNotification({Key? key}) : super(key: key);

  @override
  State<AdminToStaffNotification> createState() =>
      _AdminToStaffNotificationState();
}

class _AdminToStaffNotificationState extends State<AdminToStaffNotification> {
  List subjectData = [];

  String section = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<SchoolPhotoProviders>(context, listen: false);
      p.stdReportSectionStaff();

      p.dropDown.clear();
      p.stdReportInitialValues.clear();

      Provider.of<NotificationToStaffAdminProviders>(context, listen: false)
          .clearStaffList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Consumer<SchoolPhotoProviders>(
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: size.width * .42,
                    height: 50,
                    child: MultiSelectDialogField(
                      // height: 200,
                      items: value.dropDown,

                      listType: MultiSelectListType.CHIP,
                      title: const Text(
                        "Select Section",
                        style: TextStyle(color: Colors.grey),
                      ),
                      selectedItemsTextStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: UIGuide.light_Purple),
                      confirmText: Text(
                        'OK',
                        style: TextStyle(color: UIGuide.light_Purple),
                      ),
                      cancelText: Text(
                        'Cancel',
                        style: TextStyle(color: UIGuide.light_Purple),
                      ),
                      separateSelectedItems: true,
                      //  checkColor: Colors.lightBlue,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.grey,
                      ),
                      buttonText: Text(
                        "Select Section",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      chipDisplay: MultiSelectChipDisplay.none(),
                      onConfirm: (results) async {
                        subjectData = [];
                        for (var i = 0; i < results.length; i++) {
                          StudReportSectionList data =
                              results[i] as StudReportSectionList;
                          print(data.text);
                          print(data.value);
                          subjectData.add(data.value);
                          subjectData.map((e) => data.value);
                          print("${subjectData.map((e) => data.value)}");
                        }
                        section = subjectData.join(',');

                        print("data $section");

                        print(subjectData.join(','));
                      },
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: SizedBox(
                  width: size.width * .42,
                  height: 44,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () async {
                      await Provider.of<NotificationToStaffAdminProviders>(
                              context,
                              listen: false)
                          .clearStaffList();
                      await Provider.of<NotificationToStaffAdminProviders>(
                              context,
                              listen: false)
                          .getNotificationView(section);
                      // var p = await Provider.of<SchoolPhotoProviders>(context,
                      //     listen: false);
                      // subjectData.clear();

                      section = '';

                      // p.stdReportInitialValues.clear();
                    },
                    color: UIGuide.THEME_LIGHT,
                    child: Text('View'),
                  ),
                ),
              )
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
                ),
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Consumer<NotificationToStaffAdminProviders>(
                  builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        value.selectAllStaff();
                      },
                      child: value.isSelectAllStaff
                          ? Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: SvgPicture.asset(
                                UIGuide.check,
                                color: UIGuide.light_Purple,
                              ),
                            )
                          : const Text(
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
          Consumer<NotificationToStaffAdminProviders>(
            builder: (context, value, child) {
              return value.loading
                  ? LimitedBox(
                      maxHeight: size.height - 300,
                      child: const Center(child: spinkitLoader()),
                    )
                  : LimitedBox(
                      maxHeight: size.height - 315,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.stafflist.isEmpty
                            ? 0
                            : value.stafflist.length,
                        itemBuilder: ((context, index) {
                          return Notification_StudListAdmin(
                            viewStud: value.stafflist[index],
                            indexx: index,
                          );
                        }),
                      ),
                    );
            },
          ),
          kheight10,
          kheight10
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: UIGuide.light_Purple,
            onPressed: () {
              Provider.of<NotificationToStaffAdminProviders>(context,
                      listen: false)
                  .submitStaff(context);
            },
            child: const Text('Proceed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}

class Notification_StudListAdmin extends StatelessWidget {
  final StaffReportNotification viewStud;
  const Notification_StudListAdmin(
      {Key? key, required this.viewStud, required this.indexx})
      : super(key: key);
  final int indexx;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationToStaffAdminProviders>(
      builder: (context, value, child) => SizedBox(
        height: 53,
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
          selectedTileColor: const Color.fromARGB(255, 10, 27, 141),
          title: Text(viewStud.name == null ? '---' : viewStud.name),
          subtitle:
              Text(viewStud.staffRole.isEmpty ? '---' : viewStud.staffRole),
          trailing: viewStud.selected != null && viewStud.selected!
              ? SvgPicture.asset(
                  UIGuide.check,
                  color: UIGuide.light_Purple,
                )
              : SvgPicture.asset(
                  UIGuide.notcheck,
                  color: UIGuide.light_Purple,
                ),
        ),
      ),
    );
  }
}

class Text_Matter_NotificationAdminToStaff extends StatelessWidget {
  final List<String> toList;
  final String type;
  Text_Matter_NotificationAdminToStaff(
      {Key? key, required this.toList, required this.type})
      : super(key: key);
  final titleController = TextEditingController();
  final matterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notification'),
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
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                controller: titleController,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Title*',
                  hintText: 'Enter Title',
                  labelStyle: const TextStyle(color: UIGuide.light_Purple),
                  hintStyle: const TextStyle(color: Colors.grey),
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
                inputFormatters: [LengthLimitingTextInputFormatter(300)],
                controller: matterController,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Matter*',
                  hintText: 'Enter Matter',
                  labelStyle: const TextStyle(color: UIGuide.light_Purple),
                  hintStyle: const TextStyle(color: Colors.grey),
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
              onPressed: () {
                Provider.of<NotificationToStaffAdminProviders>(context,
                        listen: false)
                    .sendNotification(context, titleController.text,
                        matterController.text, toList,
                        sentTo: type);
              },
              child: const Text(
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
