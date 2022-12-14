import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Application/StudentProviders/ReportCardProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ReportCardProvider>(context, listen: false);
    _provider.getReportCard();
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report card'),
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
        child: Consumer<ReportCardProvider>(
          builder: (context, value, child) => value.loading
              ? const spinkitLoader()
              : ListView(
                  children: [
                    kheight20,
                    Table(
                      border: TableBorder.all(
                          color: Color.fromARGB(255, 245, 243, 243)),
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(5),
                        2: FlexColumnWidth(2),
                      },
                      children: const [
                        TableRow(
                            decoration: BoxDecoration(
                              color: UIGuide.light_black,
                            ),
                            children: [
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                              itemCount: reportResponse == null
                                  ? 0
                                  : reportResponse.length,
                              itemBuilder: ((context, index) {
                                String time =
                                    reportResponse[index]['uploadedDate'];
                                String Corect_tym =
                                    time.replaceRange(10, 20, '');
                                print('dob $Corect_tym');
                                String reAttach =
                                    reportResponse[index]['fileId'];
                                print(reAttach);
                                return Table(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 245, 243, 243)),
                                  columnWidths: const {
                                    0: FlexColumnWidth(3),
                                    1: FlexColumnWidth(5),
                                    2: FlexColumnWidth(2),
                                  },
                                  children: [
                                    TableRow(
                                        decoration: const BoxDecoration(),
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              Corect_tym == null
                                                  ? '---'
                                                  : Corect_tym,
                                              //   style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Text(
                                            reportResponse[index]
                                                        ['description'] ==
                                                    null
                                                ? '----'
                                                : reportResponse[index]
                                                        ['description']
                                                    .toString(),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              final attch = await Provider.of<
                                                          ReportCardProvider>(
                                                      context,
                                                      listen: false)
                                                  .reportCardAttachment(
                                                      reAttach);
                                              if (provider.extension
                                                      .toString() ==
                                                  '.pdf') {
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
                                                          const NoAttachmentScreen()),
                                                );
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove_red_eye_outlined,
                                              size: 20,
                                            ),
                                          )
                                          // IconButton(
                                          //     onPressed: () async {
                                          //       final attch = await Provider
                                          //               .of<ReportCardProvider>(
                                          //                   context,
                                          //                   listen: false)
                                          //           .reportCardAttachment(
                                          //               reAttach);
                                          //       if (provider.extension
                                          //               .toString() ==
                                          //           '.pdf') {
                                          //         Navigator.push(
                                          //           context,
                                          //           MaterialPageRoute(
                                          //               builder: (context) =>
                                          //                   PdfDownload()),
                                          //         );
                                          //       } else {
                                          //         Navigator.push(
                                          //           context,
                                          //           MaterialPageRoute(
                                          //               builder: (context) =>
                                          //                   const NoAttachmentScreen()),
                                          //         );
                                          //       }
                                          //     },
                                          //     icon: const Icon(Icons
                                          //         .remove_red_eye_outlined)),
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
      ),
    );
  }
}

class PdfDownload extends StatelessWidget {
  const PdfDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportCardProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text('Report card'),
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
                  pdfUrl: value.url == null ? '--' : value.url.toString(),
                  fileNames: value.name == null ? '---' : value.name.toString(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SfPdfViewer.network(
            value.url == null ? '--' : value.url.toString(),
          )),
    );
  }
}

class NoAttachmentScreen extends StatelessWidget {
  const NoAttachmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Invalid attachment'),
      ),
    );
  }
}
