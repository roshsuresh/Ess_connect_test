import 'package:Ess_Conn/Application/NoticProvider.dart';
import 'package:Ess_Conn/Application/ReportCardProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:pdfdownload/pdfdownload.dart';

import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ReportCardProvider>(context, listen: false).getReportCard();
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Report card'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            kheight20,
            Table(
              columnWidths: {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(5),
                2: FlexColumnWidth(2),
                // 3: FlexColumnWidth(2)
              },
              // border: TableBorder.all(),
              children: const [
                TableRow(
                    decoration: BoxDecoration(
                      //  border: Border.all(),
                      color: Color.fromARGB(255, 228, 224, 224),
                    ),
                    children: [
                      // SizedBox(
                      //   height: 30,
                      //   child: Center(
                      //     child: Text('No.'),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                            child: Text(
                          'View',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                      ),
                    ]),
              ],
            ),
            LimitedBox(
              maxHeight: size.height - 30,
              child: Consumer<ReportCardProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          reportResponse == null ? 0 : reportResponse.length,
                      itemBuilder: ((context, index) {
                        String time = reportResponse[index]['uploadedDate'];
                        String Corect_tym = time.replaceRange(10, 20, '');
                        print('dob $Corect_tym');
                        String reAttach = reportResponse[index]['fileId'];
                        print(reAttach);
                        return Table(
                          columnWidths: const {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(5),
                            2: FlexColumnWidth(2),
                            // 3: FlexColumnWidth(2)
                          },
                          //  border: TableBorder.all(),
                          children: [
                            TableRow(
                                decoration: const BoxDecoration(
                                    // color: Color.fromARGB(
                                    //     255, 230, 227, 227),
                                    ),
                                children: [
                                  // Padding(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   child:
                                  //       Center(child: Text('${index.toString()}')),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      Corect_tym == null ? '---' : Corect_tym,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    reportResponse[index]['description'] == null
                                        ? '----'
                                        : reportResponse[index]['description']
                                            .toString(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Center(
                                      child: IconButton(
                                          onPressed: () async {
                                            final attch = await Provider.of<
                                                        ReportCardProvider>(
                                                    context,
                                                    listen: false)
                                                .reportCardAttachment(reAttach);
                                            if (provider.extension.toString() ==
                                                '.pdf') {
                                              final result =
                                                  provider.url.toString();
                                              final name =
                                                  provider.name.toString();

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PdfDownload()),
                                              );
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NoAttachmentScreen()),
                                              );
                                            }
                                          },
                                          icon: Icon(
                                              Icons.remove_red_eye_outlined))),
                                ]),
                          ],
                        );
                      }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PdfDownload extends StatelessWidget {
  PdfDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<NoticeProvider>(context, listen: false).noticeAttachement('');
    return Consumer<ReportCardProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Download PDF'),
          backgroundColor: Color.fromARGB(255, 58, 120, 245),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: DownloandPdf(
                isUseIcon: true,
                pdfUrl:
                    value.url.toString() == null ? '--' : value.url.toString(),
                fileNames: value.name.toString() == null
                    ? '---'
                    : value.name.toString(),
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: DownloandPdf(
            titleDownload: 'Tap to Download',
            pdfUrl: value.url.toString() == null ? '--' : value.url.toString(),
            fileNames:
                value.name.toString() == null ? '---' : value.name.toString(),
            color: Color.fromARGB(31, 122, 120, 120),
          ),
        ),
      ),
    );
  }
}

class NoAttachmentScreen extends StatelessWidget {
  const NoAttachmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Invalid attachment'),
      ),
    );
  }
}
