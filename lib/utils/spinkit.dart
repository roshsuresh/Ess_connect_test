import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class spinkitLoader extends StatelessWidget {
  const spinkitLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitCircle(
      color: UIGuide.light_Purple,
      size: 50,
    ));
  }
}
