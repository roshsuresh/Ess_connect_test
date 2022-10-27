import 'package:Ess_test/Application/AdminProviders/GalleryProviders.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EditGalleryView extends StatelessWidget {
  const EditGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Gallery',
          style: TextStyle(fontSize: 20),
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
      body: Consumer<GalleryProviderAdmin>(builder: (context, provider, child) {
        return ListView(
          children: [
            kheight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Entry Date: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: UIGuide.light_Purple),
                  ),
                  Text(
                    provider.entryDate ?? '--',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Title: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: UIGuide.light_Purple),
                  ),
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: const StrutStyle(fontSize: 13),
                      maxLines: 3,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 44, 43, 43)),
                          text: provider.title ?? '--'),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(
                    provider.galleryEditList.length == null
                        ? 0
                        : provider.galleryEditList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Image(
                          image: NetworkImage(
                              'https://png.pngtree.com/element_our/png/20180928/beautiful-hologram-water-color-frame-png_119551.jpg')),
                    ),
                  );
                })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Start Date: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: UIGuide.light_Purple),
                  ),
                  Text(
                    provider.displayStartDate ?? '--',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Start Date: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: UIGuide.light_Purple),
                  ),
                  Text(
                    provider.displayEndDate ?? '--',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
