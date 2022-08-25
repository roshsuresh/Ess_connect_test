import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/TextWrap(moreOption).dart';
import 'package:flutter/material.dart';
import 'package:pdfdownloader/pdfdownloader.dart';

class Timetable extends StatelessWidget {
  Timetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PDF DownLoand Page'),
          backgroundColor: Color(0xff003cb3),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: DownloandPdf(
                isUseIcon: true,
                pdfUrl:
                    'https://www.panthercountry.org/userfiles/358/Classes/4914/NOUN%20Clause%20Practice.pdf',
                fileNames: 'TestDownload.pdf',
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: DownloandPdf(
            pdfUrl:
                'http://www.espressoenglish.net/wp-content/uploads/2012/07/Free-Grammar-Ebook-Level-2.pdf',
            fileNames: 'TestDownload.pdf',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
