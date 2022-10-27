import 'package:Ess_test/Application/AdminProviders/GalleryProviders.dart';
import 'package:Ess_test/Application/Staff_Providers/GallerySendProviderStaff.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Presentation/Admin/Gallery/EditGalleryScreen.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:provider/provider.dart';

class GalleryListAdmin extends StatelessWidget {
  const GalleryListAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<GalleryProviderAdmin>(context, listen: false);
      p.galleryViewListAdmin();
      p.galleryViewList.clear();
    });
    var size = MediaQuery.of(context).size;
    return Consumer<GalleryProviderAdmin>(
      builder: (context, provider, child) {
        return provider.loading
            ? spinkitLoader()
            : ListView.builder(
                itemCount: provider.galleryViewList.length == null
                    ? 0
                    : provider.galleryViewList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width,
                      height: 90,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: UIGuide.light_Purple, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Created Date: '),
                                Text(
                                  provider.galleryViewList[index].createdAt ??
                                      '--',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    String eventt = provider
                                        .galleryViewList[index].id
                                        .toString();
                                    await provider.galleryEdit(eventt);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditGalleryView()),
                                    );
                                  },
                                  // onTap: () async {
                                  //   String event = provider
                                  //       .galleryViewList[index].id
                                  //       .toString();

                                  //   provider.galleryViewList.clear();
                                  //   await provider.galleryViewListAdmin();
                                  // },
                                  child: Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: UIGuide.light_Purple,
                                  ),
                                ),
                                kWidth,
                                GestureDetector(
                                  onTap: () async {
                                    String event = provider
                                        .galleryViewList[index].id
                                        .toString();
                                    await provider.galleryDelete(event);

                                    provider.galleryViewList.clear();
                                    await provider.galleryViewListAdmin();
                                  },
                                  child: Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Title: '),
                                Flexible(
                                  child: Text(
                                    provider.galleryViewList[index].title ??
                                        '--',
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Created By: '),
                                Flexible(
                                  child: Text(
                                    provider.galleryViewList[index]
                                            .createStaffName ??
                                        '--',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            Consumer<GalleryProviderAdmin>(
                              builder: (context, value, child) {
                                if (value.galleryViewList[index].approved ==
                                        true &&
                                    value.galleryViewList[index].cancelled ==
                                        false) {
                                  return Row(
                                    children: [
                                      Text('Status : '),
                                      Text(
                                        'Approved',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ],
                                  );
                                } else if (value
                                            .galleryViewList[index].approved ==
                                        false &&
                                    value.galleryViewList[index].cancelled ==
                                        true) {
                                  return Row(
                                    children: [
                                      Text('Status : '),
                                      Text(
                                        'Cancelled',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            color: Colors.red),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Row(
                                    children: [
                                      Text('Status : '),
                                      Text(
                                        'Pending',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.orange),
                                      ),
                                    ],
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  Text('Status : '),
                                  Text(
                                    'Approved',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
