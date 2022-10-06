import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitSpinningLines(
        color: UIGuide.light_Purple,
        size: 90,
        lineWidth: 5,
      )),
      // child: SpinKitWave(
      //     color: UIGuide.light_Purple, type: SpinKitWaveType.center)),
    );
  }
}
