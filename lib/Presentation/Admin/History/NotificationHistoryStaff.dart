import 'package:Ess_test/Presentation/Admin/History/StaffNotificationHIstory.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import '../../../Application/AdminProviders/NotificationToGuardian.dart';

class NotificationHistory extends StatelessWidget {
  const NotificationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Gallery'),
              titleSpacing: 20.0,
              centerTitle: true,
              toolbarHeight: 40,
              toolbarOpacity: 0.8,
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
                  Tab(text: "Student"),
                  Tab(
                    text: "Staff",
                  ),
                ],
              ),
              backgroundColor: UIGuide.light_Purple,
            ),
            body: TabBarView(children: [
              StudentNotificationHistory(),
              StaffNotificationHistoryy()
            ])));
  }
}

class StudentNotificationHistory extends StatelessWidget {
  const StudentNotificationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<NotificationToGuardianAdmin>(context, listen: false);
      p.getNotificationHistory();
      p.historyList.clear();
    });
    var size = MediaQuery.of(context).size;
    return Consumer<NotificationToGuardianAdmin>(
      builder: (context, value, child) => value.loading
          ? spinkitLoader()
          : AnimationLimiter(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: value.historyList.length,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (BuildContext context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 300.0,
                      child: FlipAnimation(
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          flipAxis: FlipAxis.y,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: LimitedBox(
                              maxHeight: 100,
                              child: Container(
                                width: size.width,
                                // height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: UIGuide.light_Purple)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title: ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: UIGuide.light_Purple),
                                        ),
                                        Flexible(
                                          child: Text(
                                            value.historyList[index].title ??
                                                '--',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Matter: ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: UIGuide.light_Purple),
                                        ),
                                        Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            strutStyle:
                                                const StrutStyle(fontSize: 13),
                                            maxLines: 3,
                                            text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 44, 43, 43)),
                                              text: value.historyList[index]
                                                      .body ??
                                                  '--',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Created At: ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: UIGuide.light_Purple),
                                          ),
                                          Text(
                                            value.historyList[index]
                                                    .createdDate ??
                                                '--',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),

      // ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: value.historyList.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(4.0),
      //         child: LimitedBox(
      //           maxHeight: 100,
      //           child: Container(
      //             width: size.width,
      //             // height: 100,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(5),
      //                 border: Border.all(color: UIGuide.light_Purple)),
      //             child: Column(
      //               children: [
      //                 SizedBox(
      //                   height: 2,
      //                 ),
      //                 Row(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       'Title: ',
      //                       style: TextStyle(
      //                           fontSize: 15, color: UIGuide.light_Purple),
      //                     ),
      //                     Flexible(
      //                       child: Text(
      //                         value.historyList[index].title ?? '--',
      //                         overflow: TextOverflow.ellipsis,
      //                         maxLines: 1,
      //                         style: TextStyle(
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //                 Row(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       'Matter: ',
      //                       style: TextStyle(
      //                           fontSize: 15, color: UIGuide.light_Purple),
      //                     ),
      //                     Flexible(
      //                       child: RichText(
      //                         overflow: TextOverflow.ellipsis,
      //                         strutStyle: const StrutStyle(fontSize: 13),
      //                         maxLines: 3,
      //                         text: TextSpan(
      //                           style: TextStyle(
      //                               fontSize: 15,
      //                               color: Color.fromARGB(255, 44, 43, 43)),
      //                           text: value.historyList[index].body ?? '--',
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Expanded(
      //                   child: Row(
      //                     crossAxisAlignment: CrossAxisAlignment.end,
      //                     mainAxisAlignment: MainAxisAlignment.end,
      //                     children: [
      //                       Text(
      //                         'Created At: ',
      //                         style: TextStyle(
      //                             fontSize: 15,
      //                             color: UIGuide.light_Purple),
      //                       ),
      //                       Text(
      //                         value.historyList[index].createdDate ?? '--',
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
    );
  }
}
