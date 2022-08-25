import 'package:Ess_Conn/Application/NoticProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/LoadingIndication.dart';
import 'package:Ess_Conn/utils/TextWrap(moreOption).dart';
import 'package:Ess_Conn/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdfdownloader/pdfdownloader.dart';

import 'package:provider/provider.dart';

class NoticeBoard extends StatelessWidget {
  NoticeBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<NoticeProvider>(context, listen: false).getnoticeList();
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
      body: Consumer<NoticeProvider>(builder: (_, value, child) {
        return Container(
          child: ListView.builder(
            itemCount: noticeresponse == null ? 0 : noticeresponse!.length,
            itemBuilder: (BuildContext context, index) {
              var noticeattach = noticeresponse![index]['noticeId'];
              // Provider.of<NoticeProvider>(context, listen: false)
              //     .noticeAttachement(noticeattach); //passing noticeID
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      //   height: 200,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 241, 241),
                          border: Border.all(
                              color: Color.fromARGB(255, 167, 166, 166)),
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
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        text: noticeresponse![index]['title'] ==
                                                null
                                            ? '---'
                                            : noticeresponse![index]['title']
                                                .toString()),
                                  ),
                                ),
                                //Spacer(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              //height: 132,
                              width: width - 15,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 230, 225, 230),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 215, 207, 236)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWrapper(
                                      text: noticeresponse![index]['matter'] ==
                                              null
                                          ? '------'
                                          : noticeresponse![index]['matter']
                                              .toString())
                                ],
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //kWidth,
                              Text(
                                noticeresponse![index]['entryDate'] == null
                                    ? '--'
                                    : noticeresponse![index]['entryDate']
                                        .toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                              Spacer(),
                              Text(
                                noticeresponse![index]['staffName']
                                            .toString() ==
                                        null
                                    ? '--'
                                    : noticeresponse![index]['staffName']
                                        .toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                              //kWidth
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    Provider.of<NoticeProvider>(context,
                                            listen: false)
                                        .noticeAttachement(noticeattach);
                                    if (value.extension.toString() == '.pdf') {
                                      final result = value.url.toString();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PdfViewPage(
                                                  result: result,
                                                )),
                                      );
                                    } else if (value.extension.toString() ==
                                        '.jpg') {
                                      final imgResult = value.url.toString();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ImageView(
                                                  result: imgResult,
                                                )),
                                      );
                                    } else if (value.extension.toString() ==
                                        'png') {
                                      final imgResult2 = value.url.toString();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ImageView(
                                                  result: imgResult2,
                                                )),
                                      );
                                    } else if (value.extension.toString() ==
                                        'jpeg') {
                                      final imgResult3 = value.url.toString();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ImageView(
                                                  result: imgResult3,
                                                )),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NoExtention()),
                                      );
                                    }
                                  },
                                  child: Icon(Icons.file_download))
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
      }),
    );
  }

  // loadDocument(String result) {
  //   //document = PDFDocument.fromURL(result) as PDFDocument?;
  //   Scaffold(
  //     appBar: AppBar(
  //       title: Text('PDF DownLoand Page'),
  //       backgroundColor: Color(0xff003cb3),
  //       actions: [
  //         Padding(
  //           padding: const EdgeInsets.only(right: 15.0),
  //           child: DownloandPdf(
  //             isUseIcon: true,
  //             pdfUrl: result,
  //             fileNames: 'TestDownload.pdf',
  //             color: Colors.white,
  //           ),
  //         ),
  //       ],
  //     ),
  //     body: Center(
  //       child: DownloandPdf(
  //         pdfUrl: result,
  //         fileNames: 'TestDownload.pdf',
  //         color: Color.fromARGB(31, 122, 120, 120),
  //       ),
  //     ),
  //   );
  // }

  // imageview(String result) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         child: Image.network(
  //           result,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class PdfViewPage extends StatelessWidget {
  PdfViewPage({Key? key, required this.result}) : super(key: key);
  //PDFDocument? document;
  late bool isLoading = false;

  final String result;
  loadDocument(String result) async {
    //document = await PDFDocument.fromURL(result);
    Scaffold(
      appBar: AppBar(
        title: Text('PDF DownLoand Page'),
        backgroundColor: Color(0xff003cb3),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: DownloandPdf(
              isUseIcon: true,
              pdfUrl: result,
              fileNames: 'TestDownload.pdf',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: DownloandPdf(
          pdfUrl: loadDocument(result),
          fileNames: 'TestDownload.pdf',
          color: Color.fromARGB(31, 122, 120, 120),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF DownLoand Page'),
        backgroundColor: Color(0xff003cb3),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: DownloandPdf(
              isUseIcon: true,
              pdfUrl: result,
              fileNames: 'TestDownload.pdf',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: DownloandPdf(
          pdfUrl: result,
          fileNames: 'TestDownload.pdf',
          color: Color.fromARGB(31, 122, 120, 120),
        ),
      ),
    );
    // return Consumer<NoticeProvider>(builder: (context, provider, _) {
    //   if (provider.extension.toString() == '.pdf') {
    //     final result = provider.url.toString();
    //     return loadDocument(result);
    //   } else if (provider.extension.toString() == '.jpg') {
    //     final imgResult = provider.url.toString();
    //     return imageview(imgResult);
    //   } else if (provider.extension.toString() == 'png') {
    //     final imgResult2 = provider.url.toString();
    //     return imageview(imgResult2);
    //   } else if (provider.extension.toString() == 'jpeg') {
    //     final imgResult3 = provider.url.toString();
    //     return imageview(imgResult3);
    //   } else if (provider.extension.toString() == null) {
    //     return Scaffold(
    //       body: Center(
    //         child: Text(
    //           'No Attachment ',
    //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    //         ),
    //       ),
    //     );
    //   }
    //   return Scaffold(
    //     body: isLoading
    //         ? LoadingIcon()
    //         : Center(
    //             child: Text(
    //               'No Attachment Found',
    //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    //             ),
    //           ),
    //   );
    // });
  }
}

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.result}) : super(key: key);
  final String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.network(
            result,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class NoExtention extends StatelessWidget {
  const NoExtention({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No Attachment Found',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
