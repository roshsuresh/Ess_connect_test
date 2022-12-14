import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: UIGuide.WHITE,
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: size.width / 1.3,
              height: size.height / 2.7,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/wifi copy.png"),
                fit: BoxFit.fill,
              ))),
        ],
      ),
    );
  }
}
