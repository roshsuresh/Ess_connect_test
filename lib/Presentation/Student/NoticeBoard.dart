import 'package:Ess_Conn/Application/NoticProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/LoadingIndication.dart';
import 'package:Ess_Conn/utils/TextWrap(moreOption).dart';
import 'package:Ess_Conn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                                noticeresponse![index]['staffName'] == null
                                    ? '--'
                                    : noticeresponse![index]['staffName']
                                        .toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                              //kWidth
                              Spacer(),
                              GestureDetector(
                                  onTap: () async {
                                    var newProvider =
                                        await Provider.of<NoticeProvider>(
                                                context,
                                                listen: false)
                                            .noticeAttachement(noticeattach);
                                    if (value.extension.toString() == '.pdf') {
                                      final result = value.url.toString();
                                      final name = value.name.toString();

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PDFDownload()),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PdfViewPage()),
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
}

class PDFDownload extends StatelessWidget {
  PDFDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<NoticeProvider>(context, listen: false).noticeAttachement('');
    return Consumer<NoticeProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text(''),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.2,
            toolbarOpacity: 0.8,
            backgroundColor: UIGuide.light_Purple,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: DownloandPdf(
                  isUseIcon: true,
                  pdfUrl: value.url.toString() == null
                      ? '--'
                      : value.url.toString(),
                  fileNames: value.name.toString() == null
                      ? '---'
                      : value.name.toString(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SfPdfViewer.network(
            value.url.toString() == null ? '--' : value.url.toString(),
          )),
    );
  }
}

class PdfViewPage extends StatelessWidget {
  PdfViewPage({Key? key}) : super(key: key);

  bool isLoading = false;

  imageview(String result) {
    return Scaffold(
      body: isLoading
          ? LoadingIcon()
          : Center(
              child: Container(
                  child: PhotoView(
                loadingBuilder: (context, event) {
                  return LoadingIcon();
                },
                imageProvider: NetworkImage(
                  result == null
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmeGlXoJwwpbCE9jGgHgZ2XaE5nnPUSomkZz_vZT7&s'
                      : result,
                ),
              )),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoticeProvider>(builder: (context, provider, _) {
      if (provider.extension.toString() == '.jpg') {
        final imgResult = provider.url.toString();
        return imageview(imgResult);
      } else if (provider.extension.toString() == 'png') {
        final imgResult2 = provider.url.toString();
        return imageview(imgResult2);
      } else if (provider.extension.toString() == 'jpeg') {
        final imgResult3 = provider.url.toString();
        return imageview(imgResult3);
      } else {
        return const Scaffold(
          body: Center(
            child: Text(
              'No Attachment ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        );
      }
    });
  }
}
