import 'package:Ess_Conn/Application/GalleryProvider.dart';
import 'package:Ess_Conn/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

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
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    kheight20,
                    Container(
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkgXWUMr_Vcw6KhaHLTy0SNSljgWrMIi5rFQ&usqp=CAU',
                                  ),
                                  fit: BoxFit.fill),
                              color: Colors.white12,
                              border: Border.all(
                                  color: Color.fromARGB(255, 219, 215, 215)),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(40.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Onam Celebration',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                      maxLines: 2,
                                    ),
                                    kheight10,
                                    Text(
                                      'y eryre reter ertr erte fgrt hrfg',
                                      maxLines: 3,
                                      style: TextStyle(),
                                    ),
                                    kheight10,
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          'Date: 12/12/31   ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              })),
        ],
      ),
    );
  }
}
