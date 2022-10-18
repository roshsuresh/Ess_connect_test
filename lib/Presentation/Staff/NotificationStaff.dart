import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

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
    "Metro Sahodhaya Metro Sahodhaya",
    "Brazil",
    "Tunisia",
    'Canada ',
  ];
  String? selectedString;
  List<String>? selectedDataString;
  final collegename = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/mob.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 231, 124, 121),
                      width: 4,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ), //BoxDecora
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: LimitedBox(
                              maxHeight: size.height - 300,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: dataString.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          selectedTileColor:
                                              Colors.blue.shade100,
                                          selectedColor: Color.fromARGB(
                                              255, 113, 196, 235),
                                          onTap: () async {
                                            collegename.text =
                                                dataString[index];
                                            Navigator.of(context).pop();
                                          },
                                          title: Text(
                                            dataString[index],
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black12,
                                        )
                                      ],
                                    );
                                  }),
                            ));
                          });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: collegename,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 238, 237, 237),
                            border: OutlineInputBorder(),
                            //   labelText: "Select college",
                            hintText: "Select College",
                          ),
                          enabled: false,
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 130,
              child: MaterialButton(
                color: Color.fromARGB(255, 231, 124, 121),
                onPressed: () {
                  if (collegename.text.toString() == 'Brazil') {
                    print('________________');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FestivalView(
                                url:
                                    'https://malappuramcentralsahodaya.e-schoolweb.in/malappuramsahodayaresult/resultzone/',
                              )),
                    );
                  } else if (collegename.text.toString() == 'UAE') {
                    print('_________-------_______');
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FestivalView extends StatelessWidget {
  String url;
  FestivalView({Key? key, required this.url}) : super(key: key);
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Festival Results'),
        // ),
        body: Center(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ),
    );
  }
}
