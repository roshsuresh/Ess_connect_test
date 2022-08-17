import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoticeBoard extends StatelessWidget {
  NoticeBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final Color background = Colors.white;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notice Board',
        ),
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
      body:
          // children: [
          // Text(
          //   'Our Upcoming Events......',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          // ),
          ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 241, 241),
                      border:
                          Border.all(color: Color.fromARGB(255, 167, 166, 166)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            kWidth,
                            Text('📌  '),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 14.0),
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: 'Upcomming Events'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 132,
                          width: width - 15,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 225, 230),
                              border: Border.all(
                                  color: Color.fromARGB(255, 215, 207, 236)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 12.0),
                                  maxLines: 7,
                                  text: const TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    text:
                                        'Posters and flyers have the power to turn heads in the corridor, while social media images and Snapchat filters can stop people from scrolling and make them pay attention to your event. That split-second glance could be all you need to get someone to attend!',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          kWidth,
                          Text('20 JAN 2022'),
                          Spacer(),
                          Icon(Icons.attach_file_outlined),
                          kWidth
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
