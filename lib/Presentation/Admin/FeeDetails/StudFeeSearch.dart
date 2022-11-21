import 'package:Ess_test/Application/AdminProviders/FeeDetailsProvider.dart';
import 'package:Ess_test/Domain/Staff/SearchStudReport.dart';
import 'package:Ess_test/Presentation/Admin/FeeDetails/StudFeeDetails.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants.dart';
import '../../../utils/constants.dart';

class StudentFeeSearch extends StatelessWidget {
  StudentFeeSearch({Key? key}) : super(key: key);

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<FeeDetailsProvider>(context, listen: false);
      p.clearStudentList();
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Fee Report'),
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 50.2,
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
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: AnimSearchBar(
              width: 400,
              textController: textController,
              helpText: 'Enter student name..',
              color: UIGuide.THEME_LIGHT,
              autoFocus: true,
              animationDurationInMilli: 900,
              suffixIcon: Icon(
                Icons.search_sharp,
                color: UIGuide.light_Purple,
              ),
              onSuffixTap: () async {
                print('object');
                await Provider.of<FeeDetailsProvider>(context, listen: false)
                    .clearStudentList();
                await Provider.of<FeeDetailsProvider>(context, listen: false)
                    .getSearchView(textController.text.toString());
              },
            ),
          ),
          LimitedBox(
            maxHeight: size.height - 180,
            child: Consumer<FeeDetailsProvider>(
              builder: (context, provider, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: provider.searchStudent.length == null
                    ? 0
                    : provider.searchStudent.length,
                itemBuilder: (context, index) {
                  return provider.loading
                      ? Center(child: spinkitLoader())
                      : Column(
                          children: [
                            kheight10,
                            GestureDetector(
                              onTap: () async {
                                await Provider.of<FeeDetailsProvider>(context,
                                        listen: false)
                                    .generalDueListClear();
                                String id =
                                    provider.searchStudent[index].studentId ??
                                        '---';
                                String name =
                                    provider.searchStudent[index].name ?? '---';
                                String rollno =
                                    provider.searchStudent[index].rollNo == null
                                        ? '---'
                                        : provider.searchStudent[index].rollNo
                                            .toString();
                                String division =
                                    provider.searchStudent[index].division ==
                                            null
                                        ? '---'
                                        : provider.searchStudent[index].division
                                            .toString();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudFeeDetails(
                                            studid: id, name: name,
                                            roll: rollno, division: division,
                                            //  stud: provider.searchStudent[index],
                                          )),
                                );
                              },
                              child: Container(
                                width: size.width - 15,
                                height: 62,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 219, 227, 243),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    kWidth,
                                    Center(
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: UIGuide.light_black,
                                            image: DecorationImage(
                                                image: NetworkImage(provider
                                                        .searchStudent[index]
                                                        .studentPhoto ??
                                                    'https://img.myloview.com/canvas-prints/default-avatar-profile-icon-social-media-user-symbol-image-400-251200038.jpg')),
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
                                                            .searchStudent[
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
                                                strutStyle: const StrutStyle(
                                                    fontSize: 8.0),
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  text: provider
                                                              .searchStudent[
                                                                  index]
                                                              .rollNo ==
                                                          null
                                                      ? '---'
                                                      : provider
                                                          .searchStudent[index]
                                                          .rollNo
                                                          .toString(),
                                                ),
                                              ),
                                              kWidth,
                                              kWidth,
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Division : ',
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
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      text: provider
                                                              .searchStudent[
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
                                                strutStyle: const StrutStyle(
                                                    fontSize: 8.0),
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  text: provider
                                                          .searchStudent[index]
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
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
