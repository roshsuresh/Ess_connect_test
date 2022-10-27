import 'package:Ess_test/Application/AdminProviders/GalleryProviders.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AdminGalleryView extends StatelessWidget {
  const AdminGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<GalleryProviderAdmin>(context, listen: false);
      p.galleryReceived.clear();
      p.getGalleyReceived();
    });
    return Consumer<GalleryProviderAdmin>(
      builder: (context, value, child) => value.loading
          ? spinkitLoader()
          : ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.galleryReceived.length == null
                        ? 0
                        : value.galleryReceived.length,
                    itemBuilder: ((context, index) {
                      var idd = value.galleryReceived[index].galleryId ?? '--';
                      return Consumer<GalleryProviderAdmin>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              kheight20,
                              GestureDetector(
                                child: Container(
                                  height: 120,
                                  width: size.width - 30,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 6),
                                        blurRadius: 20,
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(40.0),
                                        topLeft: Radius.circular(40.0),
                                        bottomLeft: Radius.circular(0.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      kWidth,
                                      Center(
                                          child: Container(
                                        width: 120,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                value.galleryReceived[index]
                                                        .url ??
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgOinP1I4DJR8UXKbif9pXj4UTa1dar-CfGBr4mmSXNfOySMXxPfwa023_n0gvkdK4mig&usqp=CAU',
                                              ),
                                              fit: BoxFit.fill),
                                          color: Colors.white12,
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 219, 215, 215)),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(0),
                                              bottomRight:
                                                  Radius.circular(40.0),
                                              topLeft: Radius.circular(40.0),
                                              bottomLeft: Radius.circular(0.0)),
                                        ),
                                      )),
                                      kWidth,
                                      Expanded(
                                        child: Container(
                                            // color: Colors.black26,
                                            height: 110,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value.galleryReceived[index]
                                                          .title ??
                                                      '---',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                  maxLines: 2,
                                                ),
                                                kheight10,
                                                Text(
                                                  value.galleryReceived[index]
                                                          .caption ??
                                                      '---',
                                                  maxLines: 3,
                                                  style: TextStyle(),
                                                ),
                                                kheight10,
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  // await Provider.of<GalleryProviderAdmin>(context,
                                  //         listen: false)
                                  //     .galleyAttachment(idd);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           GalleryonTap(id: idd)),
                                  // );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    })),
              ],
            ),
    );
  }
}
