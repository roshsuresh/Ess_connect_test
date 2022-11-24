import 'package:Ess_test/Application/AdminProviders/NotificationStaff.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class StaffNotificationHistoryy extends StatelessWidget {
  const StaffNotificationHistoryy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<NotificationToStaffAdminProviders>(context,
          listen: false);
      p.getNotificationHistory();
      p.historyList.clear();
    });
    var size = MediaQuery.of(context).size;
    return Consumer<NotificationToStaffAdminProviders>(
      builder: (context, value, child) => value.loading
          ? spinkitLoader()
          : AnimationLimiter(
              child: ListView.builder(
                shrinkWrap: true,
                //  padding: EdgeInsets.all(size.width / 30),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: value.historyList.length,
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
                                  border:
                                      Border.all(color: UIGuide.light_Purple)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            text:
                                                value.historyList[index].body ??
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
