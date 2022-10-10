import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';

class StaffNotification extends StatefulWidget {
  const StaffNotification({Key? key}) : super(key: key);
  @override
  State<StaffNotification> createState() => _StaffNotificationState();
}

class _StaffNotificationState extends State<StaffNotification> {
  List<String> dataString = [
    "Pakistan",
    "Saudi Arabia",
    "UAE",
    "USA",
    "Turkey",
    "Brazil",
    "Tunisia",
    'Canada'
  ];
  String? selectedString;
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(
              text: 'Error Dialog',
              color: Colors.red,
              pressEvent: () {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        headerAnimationLoop: false,
                        title: 'Error',
                        desc: 'Select course & Division',
                        // btnOkOnPress: () {},
                        btnOkIcon: Icons.cancel,
                        btnOkColor: Colors.red)
                    .show();
              },
            ),
            CustomSingleSelectField<String>(
              items: dataString,
              title: "Country",
              onSelectionDone: (value) {
                selectedString = value;
                setState(() {});
              },
              itemAsString: (item) => item,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomMultiSelectField<String>(
              title: "Country",
              items: dataString,
              enableAllOptionSelect: true,
              onSelectionDone: _onCountriesSelectionComplete,
              itemAsString: (item) {
                print('item');
                return item.toString();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onCountriesSelectionComplete(value) {
    print(value);
    selectedDataString?.addAll(value);
    setState(() {});
  }
}
