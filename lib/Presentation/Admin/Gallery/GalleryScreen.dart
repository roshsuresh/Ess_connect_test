import 'package:Ess_test/Presentation/Admin/Gallery/GalleryList.dart';
import 'package:Ess_test/Presentation/Admin/Gallery/GalleryUpload.dart';
import 'package:Ess_test/Presentation/Admin/Gallery/GalleryView.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';

class AdminGallery extends StatelessWidget {
  const AdminGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Spacer(),
                  const Text('Gallery'),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminGallery()));
                      },
                      icon: Icon(Icons.refresh))
                ],
              ),
              titleSpacing: 20.0,
              centerTitle: true,
              toolbarHeight: 40,
              toolbarOpacity: 0.8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  // Tab(text: "Received"),
                  Tab(
                    text: "Send",
                  ),
                  Tab(
                    text: "List",
                  ),
                ],
              ),
              backgroundColor: UIGuide.light_Purple,
            ),
            body: TabBarView(children: [
              // AdminGalleryView(),
              AdminGalleryUpload(),
              GalleryListAdmin()
            ])));
  }
}
