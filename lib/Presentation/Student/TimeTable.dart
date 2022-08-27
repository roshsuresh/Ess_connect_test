import 'dart:math';

import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/utils/TextWrap(moreOption).dart';
import 'package:flutter/material.dart';
import 'package:pdfdownloader/pdfdownloader.dart';

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
      home: Scaffold(
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              // random generator
              final random = Random();

              // random dimension generator
              _width = random.nextInt(500).toDouble();
              _height = random.nextInt(500).toDouble();

              // random color generator
              _color = Color.fromRGBO(
                random.nextInt(300),
                random.nextInt(300),
                random.nextInt(300),
                1,
              );

              // random radius generator
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
      ),
    );
  }
}
