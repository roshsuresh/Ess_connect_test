import 'package:Ess_test/Application/AdminProviders/SchoolPhotoProviders.dart';
import 'package:Ess_test/Application/StudentProviders/NotificationReceived.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../utils/TextWrap(moreOption).dart';
import '../../utils/constants.dart';

class Stud_Notification extends StatelessWidget {
  Stud_Notification({Key? key}) : super(key: key);

  var kheight = const SizedBox(
    height: 8,
  );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<NotificationReceivedProviderStudent>(context,
          listen: false);
      p.getNotificationReceived();
    });
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Consumer<NotificationReceivedProviderStudent>(
        builder: (context, value, child) => value.loading
            ? spinkitLoader()
            : AnimationLimiter(
                child: ListView.builder(
                  // padding: EdgeInsets.all(size.width / 30),
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: value.notificationstud?.length == null
                      ? 0
                      : value.notificationstud!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        horizontalOffset: -300,
                        verticalOffset: -850,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: size.width - 4,
                            // height: 150,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                  )
                                ],
                                color: Color.fromARGB(255, 236, 236, 241),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.notificationstud![index]['title'] ==
                                            null
                                        ? '--'
                                        : value.notificationstud![index]
                                                ['title']
                                            .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                  kheight,
                                  TextWrapper(
                                    text: value.notificationstud![index]
                                                ['body'] ==
                                            null
                                        ? '--'
                                        : value.notificationstud![index]['body']
                                            .toString(),
                                  ),
                                  kheight,
                                  Row(
                                    children: [
                                      const Text(
                                        'Date',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        value.notificationstud![index]
                                                    ['createdDate'] ==
                                                null
                                            ? '--'
                                            : value.notificationstud![index]
                                                    ['createdDate']
                                                .toString(),
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 49, 47, 47),
                                            fontSize: 12),
                                      ),
                                      Spacer(),
                                      const Text(
                                        'Send by ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        value.notificationstud![index]
                                                    ['fromStaff'] ==
                                                null
                                            ? '--'
                                            : value.notificationstud![index]
                                                    ['fromStaff']
                                                .toString(),
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 49, 47, 47),
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

        //  ListView.builder(
        //     itemCount: value.notificationstud?.length == null
        //         ? 0
        //         : value.notificationstud!.length,
        //     itemBuilder: (BuildContext context, index) {
        //       return

        //       Column(
        //         children: [
        //           kheight,
        //           Container(
        //             width: width - 4,
        //             // height: 150,
        //             decoration: const BoxDecoration(
        //                 boxShadow: [
        //                   BoxShadow(
        //                     blurRadius: 2,
        //                   )
        //                 ],
        //                 color: Color.fromARGB(255, 236, 236, 241),
        //                 borderRadius:
        //                     BorderRadius.all(Radius.circular(10))),
        //             child: Padding(
        //               padding: const EdgeInsets.all(6.0),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     value.notificationstud![index]['title'] == null
        //                         ? '--'
        //                         : value.notificationstud![index]['title']
        //                             .toString(),
        //                     style: const TextStyle(
        //                         fontWeight: FontWeight.w700),
        //                     textAlign: TextAlign.center,
        //                   ),
        //                   kheight,
        //                   TextWrapper(
        //                     text: value.notificationstud![index]['body'] ==
        //                             null
        //                         ? '--'
        //                         : value.notificationstud![index]['body']
        //                             .toString(),
        //                   ),
        //                   kheight,
        //                   Row(
        //                     children: [
        //                       const Text(
        //                         'Date',
        //                         style: TextStyle(
        //                             color: Colors.grey, fontSize: 12),
        //                       ),
        //                       Text(
        //                         value.notificationstud![index]
        //                                     ['createdDate'] ==
        //                                 null
        //                             ? '--'
        //                             : value.notificationstud![index]
        //                                     ['createdDate']
        //                                 .toString(),
        //                         style: const TextStyle(
        //                             color: Color.fromARGB(255, 49, 47, 47),
        //                             fontSize: 12),
        //                       ),
        //                       Spacer(),
        //                       const Text(
        //                         'Send by ',
        //                         style: TextStyle(
        //                             color: Colors.grey, fontSize: 12),
        //                       ),
        //                       Text(
        //                         value.notificationstud![index]
        //                                     ['fromStaff'] ==
        //                                 null
        //                             ? '--'
        //                             : value.notificationstud![index]
        //                                     ['fromStaff']
        //                                 .toString(),
        //                         style: const TextStyle(
        //                             color: Color.fromARGB(255, 49, 47, 47),
        //                             fontSize: 12),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     },
        //   ),
      ),
    );
  }
}
