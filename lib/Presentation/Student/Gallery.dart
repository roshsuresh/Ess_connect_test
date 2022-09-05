import 'package:Ess_Conn/Application/GalleryProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/LoadingIndication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

import '../../Application/GalleryProvider.dart';
import '../../utils/constants.dart';

class Gallery extends StatelessWidget {
  Gallery({Key? key}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Provider.of<GalleryProvider>(context, listen: false)
        .getGalleyList(); //provider
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
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
      body: isLoading
          ? LoadingIcon()
          : ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        galleryResponse == null ? 0 : galleryResponse!.length,
                    itemBuilder: ((context, index) {
                      var idd = galleryResponse![index]['galleryId'];
                      return Consumer<GalleryProvider>(
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
                                                galleryResponse![index]
                                                        ['url'] ??
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgOinP1I4DJR8UXKbif9pXj4UTa1dar-CfGBr4mmSXNfOySMXxPfwa023_n0gvkdK4mig&usqp=CAU',
                                              ),
                                              fit: BoxFit.fill),
                                          color: Colors.white12,
                                          border: Border.all(
                                              color: Color.fromARGB(
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
                                                  galleryResponse![index]
                                                          ['title'] ??
                                                      '---',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                  maxLines: 2,
                                                ),
                                                kheight10,
                                                Text(
                                                  galleryResponse![index]
                                                          ['caption'] ??
                                                      '---',
                                                  maxLines: 3,
                                                  style: TextStyle(),
                                                ),
                                                kheight10,
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Text(
                                                          'Date: 12/12/31',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                      kWidth,
                                                      kWidth,
                                                      kWidth
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  final postModel =
                                      await Provider.of<GalleryProvider>(
                                              context,
                                              listen: false)
                                          .galleyAttachment(idd);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GalleryonTap(id: idd)),
                                  );
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

class GalleryonTap extends StatelessWidget {
  GalleryonTap({Key? key, required String id}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // final postModel = Provider.of<GalleryProvider>(context, listen: false).galleyAttachment(id);
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const LoadingIcon()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  children: List.generate(
                      galleryResponse == null
                          ? 0
                          : galleryAttachResponse!.length, (index) {
                    return GestureDetector(
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              height: 100,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          galleryAttachResponse![index]
                                                      ['url'] ==
                                                  null
                                              ? AssetImage(
                                                  'assets/noimages.png')
                                              : galleryAttachResponse![index]
                                                  ['url']))),
                            ),
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewImageOntap()),
                        );
                      },
                    );
                  }),
                ),
              ),
      ),
    );
  }
}

class ViewImageOntap extends StatelessWidget {
  ViewImageOntap({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              enableRotation: false,
              itemCount: galleryAttachResponse == null
                  ? 0
                  : galleryAttachResponse!.length,
              builder: ((context, index) {
                final imgUrl = galleryAttachResponse![index]['url'];
                return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(imgUrl == null
                        ? AssetImage('assets/noimages.png')
                        : imgUrl),
                    initialScale: PhotoViewComputedScale.contained * 0.8,
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: galleryAttachResponse![index]['url']));
              }),
              loadingBuilder: (context, event) => LoadingIcon()),
    );
  }
}