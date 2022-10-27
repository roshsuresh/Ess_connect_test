import 'package:Ess_test/Application/AdminProviders/SearchstaffProviders.dart';
import 'package:Ess_test/Application/Staff_Providers/SearchProvider.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Presentation/Admin/StaffInfo.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchStaff extends StatefulWidget {
  SearchStaff({Key? key}) : super(key: key);

  @override
  State<SearchStaff> createState() => _SearchStaffState();
}

class _SearchStaffState extends State<SearchStaff> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<SearchStaffProviders>(context, listen: false);

      p.clearStudentList();
    });
  }

  TextEditingController clearValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                      )),
                  Expanded(
                    child: TextField(
                      controller: clearValue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.grey,
                              onPressed: (() {
                                Provider.of<SearchStaffProviders>(context,
                                        listen: false)
                                    .getSearchStaffView(
                                        clearValue.text.toString());
                                Provider.of<SearchStaffProviders>(context,
                                        listen: false)
                                    .clearStudentList();
                              }),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              color: Colors.grey,
                              onPressed: (() {
                                clearValue.clear();
                              }),
                            ),
                          ],
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        fillColor: UIGuide.light_black,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: UIGuide.light_Purple, width: .5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: TextStyle(color: UIGuide.light_Purple),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Consumer<SearchStaffProviders>(
                  builder: (context, value, child) {
                if (clearValue.text.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.emoji_emotions_sharp,
                        size: 100,
                        color: UIGuide.light_black,
                      ),
                      Text(
                        "Please enter the name to search",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 122, 121, 121)),
                      )
                    ],
                  );
                }
                if (value.staffReportList.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.sentiment_dissatisfied_outlined,
                        size: 120,
                        color: Colors.grey,
                      ),
                      Text("Sorry, We couldn't find the text you have entered")
                    ],
                  );
                }
                return value.loading
                    ? const Center(child: spinkitLoader())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.staffReportList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              kheight10,
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => StaffInfo(
                                              index: index,
                                            )),
                                  );
                                },
                                child: Container(
                                  width: size.width - 10,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 236, 233, 233),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      kWidth,
                                      Center(
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 236, 233, 233),
                                              image: DecorationImage(
                                                  image: NetworkImage(value
                                                              .staffReportList[
                                                                  index]
                                                              .staffPhoto ==
                                                          null
                                                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwaLDKaK49tsHmdMGOrmTdns5qiw080F2Yw&usqp=CAU'
                                                      : value
                                                          .staffReportList[
                                                              index]
                                                          .staffPhoto
                                                          .toString())),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'Name : ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: UIGuide
                                                              .light_Purple,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      text: value
                                                              .staffReportList[
                                                                  index]
                                                              .name ??
                                                          '--'),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Section : ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                    text: value
                                                            .staffReportList[
                                                                index]
                                                            .section ??
                                                        '--',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Designation : ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                    text: value
                                                            .staffReportList[
                                                                index]
                                                            .designation ??
                                                        '--',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Staff Role : ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  strutStyle: const StrutStyle(
                                                      fontSize: 8.0),
                                                  text: TextSpan(
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                    text: value
                                                            .staffReportList[
                                                                index]
                                                            .staffRole ??
                                                        '---',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _makingPhoneCall(value
                                                        .staffReportList[index]
                                                        .mobileNo ??
                                                    '---');
                                              },
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Phone : ',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13),
                                                  ),
                                                  RichText(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    strutStyle:
                                                        const StrutStyle(
                                                            fontSize: 8.0),
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                      text: value
                                                              .staffReportList[
                                                                  index]
                                                              .mobileNo ??
                                                          '---',
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.phone,
                                                    size: 17,
                                                  )
                                                ],
                                              ),
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
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }

  _makingPhoneCall(String phn) async {
    var url = Uri.parse("tel:$phn");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class StudProfileViewBySearch_Staff extends StatelessWidget {
  StudProfileViewBySearch_Staff({Key? key, required this.indexx})
      : super(key: key);
  final int indexx;
  String? phn;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 79, 97, 197);
    final Color fill2 = Color.fromARGB(255, 180, 103, 216);
    final List<Color> gradient = [
      fill1,
      fill2,
      background,
      background,
    ];
    final double fillPercent = 35;
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return SafeArea(
        child: Scaffold(
      body: Consumer<Screen_Search_Providers>(
        builder: (context, value, child) => ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 260,
                  width: size.width,
                  // color: UIGuide.WHITE,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradient,
                      stops: stops,
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 30,
                  right: 30,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: UIGuide.WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 128, 125, 125),
                              offset: Offset(
                                2,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: size.width - 50,
                      height: 170,
                      child: Column(
                        children: [
                          kheight20,
                          kheight20,
                          kheight20,
                          kheight10,
                          Text(
                            value.searchStudent[indexx].name ?? '---',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                          kheight10,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              // defaultColumnWidth: FixedColumnWidth(120.0),
                              border: TableBorder.all(
                                  color:
                                      const Color.fromARGB(255, 213, 213, 243),
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow(children: [
                                  Column(
                                    children: [
                                      const Text('Division',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey)),
                                      Text(
                                          value.searchStudent[indexx]
                                                  .division ??
                                              '---',
                                          style:
                                              const TextStyle(fontSize: 16.0)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Roll No',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey)),
                                      Text(
                                          value.searchStudent[indexx].rollNo ==
                                                  null
                                              ? '---'
                                              : value
                                                  .searchStudent[indexx].rollNo
                                                  .toString(),
                                          style:
                                              const TextStyle(fontSize: 16.0)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Adm No',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey)),
                                      Text(
                                          value.searchStudent[indexx].admnNo ??
                                              '---',
                                          style:
                                              const TextStyle(fontSize: 16.0)),
                                    ],
                                  ),
                                ])
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Center(
                  child: CircleAvatar(
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                      value.searchStudent[indexx].studentPhoto ??
                          'https://png.pngtree.com/element_our/png/20181129/male-student-icon-png_251938.jpg',
                    ),
                    radius: 65,
                    backgroundColor: UIGuide.WHITE,
                    // child: Image(
                    //   image: NetworkImage(
                    //     value.viewStudReportListt[indexx].studentPhoto ??
                    //         'https://png.pngtree.com/element_our/png/20181129/male-student-icon-png_251938.jpg',
                    //   ),
                    //   // fit: BoxFit.fill,
                    // ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 234, 234),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 234, 234),
                      ),
                      width: size.width,
                      height: 85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Permenent Address',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(fontSize: 13),
                              maxLines: 3,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 44, 43, 43)),
                                text: value.searchStudent[indexx].address ??
                                    '---',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Bus Name : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Flexible(
                          child: Text(
                            value.searchStudent[indexx].bus ?? '---',
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    kheight10,
                    Row(
                      children: [
                        Text(
                          'Bus Stop : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Flexible(
                          child: Text(
                            value.searchStudent[indexx].stop ?? '---',
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    kheight10,
                    GestureDetector(
                      onTap: () {
                        _makingPhoneCall(phn.toString());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Phone No : ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                          Flexible(
                            child: Text(
                              phn = value.searchStudent[indexx].mobNo ?? '---',
                              overflow: TextOverflow.clip,
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _makingPhoneCall(String phn) async {
    var url = Uri.parse("tel:$phn");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
