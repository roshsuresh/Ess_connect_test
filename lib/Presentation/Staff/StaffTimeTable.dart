import 'package:Ess_test/Application/Staff_Providers/TimetableProvider.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:pdfdownload/pdfdownload.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class Staff_Timetable extends StatelessWidget {
  const Staff_Timetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StaffTimetableProvider>(context, listen: false).getTimeTable();
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeTable'),
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
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(2),
              },
              children: const [
                TableRow(
                    decoration: BoxDecoration(
                      //  border: Border.all(),
                      color: Color.fromARGB(255, 228, 224, 224),
                    ),
                    children: [
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            'TimeTable',
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
            Consumer<StaffTimetableProvider>(
              builder: (context, value, child) {
                return value.loading
                    ? spinkitLoader()
                    : Table(
                        columnWidths: const {
                          0: FlexColumnWidth(4),
                          1: FlexColumnWidth(2),

                          // 3: FlexColumnWidth(2)
                        },
                        //border: TableBorder.all(),
                        children: [
                          TableRow(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 245, 242, 242),
                              ),
                              children: [
                                Center(
                                  child: Text(
                                    value.name ?? '---',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (value.extension == '.pdf') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PdfViewStaff()),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StaffTimetableimage()),
                                      );
                                    }
                                  },
                                  child: Icon(Icons.remove_red_eye),
                                ),
                              ]),
                        ],
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PdfViewStaff extends StatelessWidget {
  const PdfViewStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffTimetableProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text('TimeTable'),
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
                  pdfUrl: value.url ?? '--',
                  fileNames: value.name ?? '--',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SfPdfViewer.network(value.url ?? '--')),
    );
  }
}

class StaffTimetableimage extends StatelessWidget {
  StaffTimetableimage({Key? key}) : super(key: key);

  bool isLoading = false;

  imageview(String result) {
    return Scaffold(
      body: isLoading
          ? spinkitLoader()
          : Center(
              child: Container(
                  child: PhotoView(
                loadingBuilder: (context, event) {
                  return spinkitLoader();
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
    return Consumer<StaffTimetableProvider>(builder: (context, provider, _) {
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
              'No Attachment Provided',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        );
      }
    });
  }
}
