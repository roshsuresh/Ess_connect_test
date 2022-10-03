import 'package:Ess_test/Application/Staff_Providers/NoticeboardSend.dart';
import 'package:Ess_test/Constants.dart';

import 'package:Ess_test/utils/LoadingIndication.dart';
import 'package:Ess_test/utils/TextWrap(moreOption).dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class StaffNoticeBoardReceived extends StatelessWidget {
  StaffNoticeBoardReceived({Key? key}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Provider.of<StaffNoticeboardSendProviders>(context, listen: false)
        .getnoticeList();
    var size = MediaQuery.of(context).size;

    var width = size.width;
    const Color background = Colors.white;
    final Color fill1 = Color.fromARGB(255, 79, 97, 197);
    final Color fill2 = Color.fromARGB(255, 180, 103, 216);
    final List<Color> gradient = [
      fill1,
      fill2,
      background,
      background,
    ];
    const double fillPercent = 35;
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Consumer<StaffNoticeboardSendProviders>(builder: (_, value, child) {
      return ListView.builder(
        itemCount: staffNoticeView == null ? 0 : staffNoticeView!.length,
        itemBuilder: (BuildContext context, index) {
          var noticeattach = staffNoticeView![index]['noticeId'] == null
              ? '--'
              : staffNoticeView![index]['noticeId'].toString();

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width,
                  //   height: 200,
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
                            const Text('📌  '),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: const StrutStyle(fontSize: 14.0),
                                text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    text:
                                        staffNoticeView![index]['title'] == null
                                            ? '--'
                                            : staffNoticeView![index]['title']
                                                .toString()
                                    // value.noticeBoard[index].title ?? '--'
                                    ),
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
                              color: const Color.fromARGB(255, 230, 225, 230),
                              border: Border.all(
                                  color: Color.fromARGB(255, 215, 207, 236)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWrapper(
                                  text:
                                      staffNoticeView![index]['matter'] == null
                                          ? '--'
                                          : staffNoticeView![index]['matter']
                                              .toString()
                                  //value.noticeBoard[index].matter ?? '--'
                                  )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          kWidth,
                          Text(
                            staffNoticeView![index]['entryDate'] == null
                                ? '--'
                                : staffNoticeView![index]['entryDate']
                                    .toString(),
                            //  value.noticeBoard[index].entryDate ?? '--',
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(), kWidth, kWidth, kWidth, kWidth,
                          Text(
                            staffNoticeView![index]['staffName'] == null
                                ? '--'
                                : staffNoticeView![index]['staffName']
                                    .toString(),
                            //   value.noticeBoard[index].staffName ?? '--',
                            style: TextStyle(fontSize: 12),
                          ),
                          //kWidth
                          Spacer(),
                          GestureDetector(
                              onTap: () async {
                                await Provider.of<
                                            StaffNoticeboardSendProviders>(
                                        context,
                                        listen: false)
                                    .staffNoticeBoardAttach(
                                        noticeattach.toString());
                                if (value.extension.toString() == '.pdf') {
                                  final result = value.url.toString();
                                  final name = value.name.toString();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PDFDownloadStaff()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PdfViewPageStaff()),
                                  );
                                }
                              },
                              child: const Icon(Icons.file_download))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}

class PDFDownloadStaff extends StatelessWidget {
  PDFDownloadStaff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<NoticeProvider>(context, listen: false).noticeAttachement('');
    return Consumer<StaffNoticeboardSendProviders>(
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

class PdfViewPageStaff extends StatelessWidget {
  PdfViewPageStaff({Key? key}) : super(key: key);

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
    return Consumer<StaffNoticeboardSendProviders>(
        builder: (context, provider, _) {
      if (provider.extension.toString() == '.jpg') {
        final imgResult = provider.url.toString();
        return imageview(imgResult);
      } else if (provider.extension.toString() == '.png') {
        final imgResult2 = provider.url.toString();
        return imageview(imgResult2);
      } else if (provider.extension.toString() == '.jpeg') {
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
