import 'package:Ess_test/Application/AdminProviders/FlashNewsProviders.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlashNewsUpload extends StatefulWidget {
  FlashNewsUpload({Key? key}) : super(key: key);

  @override
  State<FlashNewsUpload> createState() => _FlashNewsUploadState();
}

class _FlashNewsUploadState extends State<FlashNewsUpload> {
  String? datee;

  DateTime? _mydatetimeFrom;

  DateTime? _mydatetimeTo;

  String time = '--';

  String timeNow = '--';

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    datee = DateFormat('dd/MMM/yyyy').format(DateTime.now());

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                minWidth: size.width - 250,
                color: Colors.white70,
                child: Text('Date: ${datee.toString()}'),
                onPressed: () async {
                  return;
                }),
            // Spacer(),
          ],
        ),
        kheight20,

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextFormField(
        //     controller: titleController,
        //     minLines: 1,
        //     maxLines: 1,
        //     keyboardType: TextInputType.multiline,
        //     decoration: InputDecoration(
        //       labelText: 'Title*',
        //       hintText: 'Enter Title',
        //       hintStyle: TextStyle(color: Colors.grey),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: titleController,
            minLines: 1,
            maxLines: 1,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: 'News*',
              labelStyle: TextStyle(color: UIGuide.light_Purple),
              hintText: 'Enter News',
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: UIGuide.light_Purple, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        kheight20,
        kheight10,
        // Consumer<FlashNewsProviderAdmin>(
        //   builder: (context, value, child) => Row(
        //     children: [
        //       SizedBox(
        //         width: size.width * .45,
        //         height: 35,
        //         child: MaterialButton(
        //           minWidth: size.width - 216,
        //           child: Center(child: Text('From  ${value.timefrom}')),
        //           color: Colors.white,
        //           onPressed: (() async {
        //             await Provider.of<FlashNewsProviderAdmin>(context,
        //                     listen: false)
        //                 .getTimeFrom(context);
        //           }),
        //         ),
        //       ),
        //       Spacer(),
        //       SizedBox(
        //         width: size.width * .45,
        //         height: 35,
        //         child: MaterialButton(
        //           minWidth: size.width - 216,
        //           child: Center(child: Text('To  ${value.timeTo}')),
        //           color: Colors.white,
        //           onPressed: (() async {
        //             await Provider.of<FlashNewsProviderAdmin>(context,
        //                     listen: false)
        //                 .getTimeTo(context);
        //           }),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        Row(
          children: [
            SizedBox(
              width: size.width * .45,
              height: 35,
              child: MaterialButton(
                minWidth: size.width - 216,
                child: Center(child: Text('From  $time')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeFrom = await showDatePicker(
                      context: context,
                      initialDate: _mydatetimeFrom ?? DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 0)),
                      lastDate: DateTime(2030));
                  setState(() {
                    time = DateFormat('dd/MMM/yyyy').format(_mydatetimeFrom!);
                    print(time);
                  });
                }),
              ),
            ),
            Spacer(),
            SizedBox(
              width: size.width * .45,
              height: 35,
              child: MaterialButton(
                minWidth: size.width - 216,
                child: Center(child: Text('To  $timeNow')),
                color: Colors.white,
                onPressed: (() async {
                  _mydatetimeTo = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 0)),
                    lastDate: DateTime(2100),
                  );

                  setState(() {
                    timeNow = DateFormat('dd/MMM/yyyy').format(_mydatetimeTo!);
                    print(timeNow);
                  });
                }),
              ),
            ),
          ],
        ),
        kheight20,
        kheight20,
        Center(
          child: Consumer<FlashNewsProviderAdmin>(
            builder: (context, value, child) => SizedBox(
              width: 150,
              child: MaterialButton(
                minWidth: size.width - 150,
                child: const Text(
                  'Save',
                  textAlign: TextAlign.center,
                ),
                color: Color.fromARGB(179, 145, 143, 143),
                onPressed: (() async {
                  print(titleController);

                  if (titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Enter Title..',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 1),
                    ));
                  } else {
                    await Provider.of<FlashNewsProviderAdmin>(context,
                            listen: false)
                        .flashNewsUpload(
                            context,
                            datee.toString(),
                            time.toString(),
                            timeNow.toString(),
                            titleController.text.toString());
                  }
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
