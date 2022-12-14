import 'package:Ess_test/Application/AdminProviders/GalleryProviders.dart';
import 'package:Ess_test/Application/Staff_Providers/GallerySendProviderStaff.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
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
            ? const spinkitLoader()
            : ListView.builder(
                itemCount: provider.galleryViewList.isEmpty
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
                                const Text('Created Date: '),
                                Text(
                                  provider.galleryViewList[index].createdAt ??
                                      '--',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    await provider.clearPhotoList();
                                    String eventt = provider
                                        .galleryViewList[index].id
                                        .toString();
                                    await provider.galleryEdit(eventt);
                                    provider.load
                                        ? spinkitLoader()
                                        : showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                child: Consumer<
                                                        GalleryProviderAdmin>(
                                                    builder: (context, provider,
                                                        child) {
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        kheight10,
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'Entry Date: ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: UIGuide
                                                                        .light_Purple),
                                                              ),
                                                              Text(
                                                                provider.entryDate ??
                                                                    '--',
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'Title: ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: UIGuide
                                                                        .light_Purple),
                                                              ),
                                                              Flexible(
                                                                child: RichText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  strutStyle:
                                                                      const StrutStyle(
                                                                          fontSize:
                                                                              13),
                                                                  maxLines: 3,
                                                                  text: TextSpan(
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              44,
                                                                              43,
                                                                              43)),
                                                                      text: provider
                                                                              .title ??
                                                                          '--'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        provider.load
                                                            ? const spinkitLoader()
                                                            : GridView.count(
                                                                shrinkWrap:
                                                                    true,
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    4.0,
                                                                mainAxisSpacing:
                                                                    8.0,
                                                                children: List.generate(
                                                                    provider.galleryList.length ==
                                                                            null
                                                                        ? 0
                                                                        : provider
                                                                            .galleryList
                                                                            .length,
                                                                    (index) {
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            2.0),
                                                                    child: Card(
                                                                      child: Image(
                                                                          image:
                                                                              NetworkImage(provider.galleryList[index].file ?? 'https://4.bp.blogspot.com/-OCutvC4wPps/XfNnRz5PvhI/AAAAAAAAEfo/qJ8P1sqLWesMdOSiEoUH85s3hs_vn97HACLcBGAsYHQ/s1600/no-image-found-360x260.png')),
                                                                    ),
                                                                  );
                                                                })),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'Start Date: ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: UIGuide
                                                                        .light_Purple),
                                                              ),
                                                              Text(
                                                                provider.displayStartDate ??
                                                                    '--',
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'Start Date: ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: UIGuide
                                                                        .light_Purple),
                                                              ),
                                                              Text(
                                                                provider.displayEndDate ??
                                                                    '--',
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              MaterialButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    'Cancel'),
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              kWidth,
                                                              MaterialButton(
                                                                onPressed:
                                                                    () async {
                                                                  await provider
                                                                      .galleryAproove(
                                                                          context,
                                                                          eventt);
                                                                  Navigator.pop(
                                                                      context);
                                                                  provider
                                                                      .galleryViewList
                                                                      .clear();
                                                                  await provider
                                                                      .galleryViewListAdmin();
                                                                },
                                                                child: const Text(
                                                                    'Approve'),
                                                                color: Colors
                                                                    .green,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                              );
                                            });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           EditGalleryView()),
                                    // );
                                    provider.galleryViewList.clear();
                                    await provider.galleryViewListAdmin();
                                    //Navigator.pop(context);
                                  },
                                  child: const Icon(
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
                                    await provider.galleryDelete(
                                        event, context);

                                    provider.galleryViewList.clear();
                                    await provider.galleryViewListAdmin();
                                  },
                                  child: const Icon(
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
                                    style: const TextStyle(
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
                                    children: const [
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
                                    children: const [
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
                                    children: const [
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
                                children: const [
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
