import 'dart:math';

import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/TextWrap(moreOption).dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Timetable extends StatefulWidget {
  Timetable({Key? key}) : super(key: key);

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  double _width = 70;
  double _height = 70;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center()),
    );
  }
}
