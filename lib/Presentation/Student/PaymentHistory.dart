import 'package:Ess_test/Application/StudentProviders/PaymentHistory.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<PaymentHistoryProvider>(context, listen: false);
      p.getHistoryList();
      p.historyList.clear();
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
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
      body: Consumer<PaymentHistoryProvider>(builder: (context, value, child) {
        return value.loading
            ? spinkitLoader()
            : ListView(
                children: [
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(.5),
                        1: FlexColumnWidth(2.1),
                        2: FlexColumnWidth(2.3),
                        3: FlexColumnWidth(2.2),
                        4: FlexColumnWidth(1.2)
                      },
                      children: const [
                        TableRow(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 196, 210, 235),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                            children: [
                              Center(
                                  child: Text(
                                'Sl No.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                              Center(
                                  child: Text(
                                'Bill Date',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                              Center(
                                  child: Text(
                                'Payment \n  Mode',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                              Center(
                                  child: Text(
                                'Amount \n paid',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                              Center(
                                  child: Text(
                                'Receipt',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ))
                            ]),
                      ],
                    ),
                  ),
                  LimitedBox(
                    maxHeight: size.height - 150,
                    child: ListView.builder(
                        itemCount: value.historyList.length == null
                            ? 0
                            : value.historyList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String newtime =
                              value.historyList[index].billDate.toString();

                          var updatedDate =
                              DateFormat('yyyy-MM-dd').parse(newtime);
                          String newDate = updatedDate.toString();
                          String finalCreatedDate =
                              newDate.replaceRange(10, 23, '');

                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(.5),
                                1: FlexColumnWidth(2.1),
                                2: FlexColumnWidth(2.3),
                                3: FlexColumnWidth(2.2),
                                4: FlexColumnWidth(1.2)
                              },
                              //  border: TableBorder.all(),
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 238, 235, 235),
                                    ),
                                    children: [
                                      Text(
                                        "\n${(index + 1).toString()}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Center(
                                          child: Text(
                                        '\n${finalCreatedDate.toString()}',
                                        style: TextStyle(fontSize: 13),
                                      )),
                                      Center(
                                          child: Text(
                                        '\n${value.historyList[index].paymentMode}',
                                        style: TextStyle(fontSize: 13),
                                      )),
                                      Center(
                                          child: Text(
                                        '\n${value.historyList[index].billAmount}',
                                        style: TextStyle(fontSize: 13),
                                      )),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove_red_eye,
                                          size: 20,
                                        ),
                                        onPressed: () async {
                                          String reAttach = value
                                              .historyList[index].orderId
                                              .toString();
                                          await Provider.of<
                                                      PaymentHistoryProvider>(
                                                  context,
                                                  listen: false)
                                              .feeHistoryAttachment(reAttach);
                                          if (value.extension.toString() ==
                                              '.pdf') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfDownloadFee()),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NoAttachmentScreenFee()),
                                            );
                                          }
                                        },
                                      )
                                    ]),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
      }),
    );
  }
}

class PdfDownloadFee extends StatelessWidget {
  PdfDownloadFee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentHistoryProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text('Receipt'),
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

class NoAttachmentScreenFee extends StatelessWidget {
  const NoAttachmentScreenFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Invalid attachment'),
      ),
    );
  }
}
