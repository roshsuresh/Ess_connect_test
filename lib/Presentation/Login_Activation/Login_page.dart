import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:Ess_test/utils/LoadingIndication.dart';
import 'package:http/http.dart' as http;
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/Presentation/Admin/AdminHome.dart';
import 'package:Ess_test/Presentation/Student/Student_home.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/AdminProviders/NoticeBoardadmin.dart';
import '../../Application/StudentProviders/LoginProvider.dart';
import '../../Domain/Student/LoginModel.dart';
import '../Staff/StaffHome.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  bool _isObscure = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      // backgroundColor: Color.fromARGB(255, 211, 228, 245),
      body: isLoading
          ? const LoadingIcon()
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * (animation2.value + .29),
                        left: size.width * .75,
                        child: CustomPaint(
                          painter: MyPainter(38),
                        ),
                      ),
                      Positioned(
                        top: size.height * .98,
                        left: size.width * .1,
                        child: CustomPaint(
                          painter: MyPainter(animation4.value - 30),
                        ),
                      ),
                      // Positioned(
                      //   top: size.height * .5,
                      //   left: size.width * (animation2.value + .8),
                      //   child: CustomPaint(
                      //     painter: MyPainter(30),
                      //   ),
                      // ),
                      // Positioned(
                      //   top: size.height * animation3.value,
                      //   left: size.width * (animation1.value + .1),
                      //   child: CustomPaint(
                      //     painter: MyPainter(60),
                      //   ),
                      // ),
                      Positioned(
                        top: size.height * .16,
                        left: size.width * .9,
                        child: CustomPaint(
                          painter: MyPainter(animation4.value - 90),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 30),
                              child: TextFormField(
                                cursorColor: UIGuide.light_Purple,
                                //  keyboardType: TextInputType.emailAddress,
                                controller: _username,
                                decoration: InputDecoration(
                                  focusColor: Color.fromARGB(255, 23, 92, 196),
                                  prefixIcon: const Icon(
                                    Icons.person_outline_outlined,
                                    color: UIGuide.light_Purple,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: UIGuide.light_Purple,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: UIGuide.light_Purple,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Color.fromARGB(255, 158, 158, 158),
                                  hintText: "Enter Your Username",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Username',
                                  labelStyle: const TextStyle(
                                      color: UIGuide.light_Purple),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                      color: UIGuide.light_Purple,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Username';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            kheight20,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 30),
                              child: TextFormField(
                                cursorColor: UIGuide.light_Purple,
                                obscureText: !_isObscure,
                                controller: _password,
                                decoration: InputDecoration(
                                  focusColor:
                                      const Color.fromARGB(255, 213, 215, 218),
                                  prefixIcon: const Icon(
                                    Icons.password_sharp,
                                    color: UIGuide.light_Purple,
                                  ),
                                  // errorText: "Please enter valid username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: UIGuide.light_Purple,
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.grey,
                                  hintText: "Enter Your Password",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      color: UIGuide.light_Purple),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: UIGuide.light_Purple,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                      color: UIGuide.light_Purple,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            kheight20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: size.width / 2.5,
                                  child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      color: UIGuide.light_Purple,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          checkLogin(
                                              _username.text, _password.text);

                                          print(_username);
                                          print(_password);
                                        } else {
                                          print("Enter some value");
                                        }
                                      },
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void checkLogin(String username, String password) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${UIGuide.baseURL}/login?id=${_pref.getString('schoolId')}'));
    // print(request);
    request.body = json.encode({"email": username, "password": password});
    print(request.body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(await response.stream.bytesToString());
      LoginModel res = LoginModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accesstoken', res.accessToken);
      //  print(res.accessToken);
      // await  Provider.of<ProfileProvider>(context).profileData();
      Provider.of<LoginProvider>(context, listen: false).getToken(context);
      var parsedResponse = await parseJWT();
      if (parsedResponse['role'] == "Guardian") {
        if (isLoading) return;
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StudentHome()));
      } else if (parsedResponse['role'] == "SystemAdmin") {
        if (isLoading) return;
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
      } else if (parsedResponse['role'] == "Teacher") {
        if (isLoading) return;
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => StaffHome()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StudentHome()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => StudentHome()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid Username or Password")));
    }
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
              colors: [UIGuide.light_Purple, UIGuide.light_Purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Application/StudentProviders/LoginProvider.dart';
// import '../../Constants.dart';
// import '../../Domain/Student/LoginModel.dart';
// import '../../utils/LoadingIndication.dart';
// import '../../utils/constants.dart';
// import '../Admin/AdminHome.dart';
// import '../Staff/StaffHome.dart';
// import '../Student/Student_home.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isObscure = false;
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   final _username = TextEditingController();
//   final _password = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading
//           ? const LoadingIcon()
//           : Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: const Color.fromARGB(31, 222, 245, 248)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           controller: _username,
//                           decoration: InputDecoration(
//                               focusColor:
//                                   const Color.fromARGB(255, 213, 215, 218),
//                               prefixIcon: const Icon(
//                                 Icons.person_outline_rounded,
//                                 color: UIGuide.light_Purple,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: UIGuide.light_Purple, width: 1.0),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               fillColor: Colors.grey,
//                               hintText: "Enter Your registered Email",
//                               hintStyle: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontFamily: "verdana_regular",
//                                 fontWeight: FontWeight.w400,
//                               ),
//                               labelText: 'Email',
//                               labelStyle:
//                                   const TextStyle(color: UIGuide.light_Purple)),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Email';
//                             }
//                             return null;
//                           },
//                         ),
//                         kheight10,
//                         TextFormField(
//                           obscureText: !_isObscure,
//                           controller: _password,
//                           decoration: InputDecoration(
//                             focusColor:
//                                 const Color.fromARGB(255, 213, 215, 218),
//                             prefixIcon: const Icon(
//                               Icons.password_sharp,
//                               color: UIGuide.light_Purple,
//                             ),
//                             // errorText: "Please enter valid username",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: UIGuide.light_Purple, width: 1.0),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             fillColor: Colors.grey,
//                             hintText: "Enter Your Password",
//                             hintStyle: const TextStyle(
//                               color: Colors.grey,
//                               fontSize: 16,
//                               fontFamily: "verdana_regular",
//                               fontWeight: FontWeight.w400,
//                             ),
//                             labelText: 'Password',
//                             labelStyle:
//                                 const TextStyle(color: UIGuide.light_Purple),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isObscure
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: UIGuide.light_Purple,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isObscure = !_isObscure;
//                                 });
//                               },
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter some text';
//                             }
//                             return null;
//                           },
//                         ),
//                         kheight20,
//                         // Container(
//                         //   color: UIGuide.light_Purple,
//                         //   width: 150,
//                         //   height: 50,
//                         //   child: ElevatedButton(
//                         //       style: ElevatedButton.styleFrom(
//                         //           shadowColor: UIGuide.light_Purple),
//                         //       onPressed: () async {
//                         //         if (_formKey.currentState!.validate()) {
//                         //           checkLogin(_username.text, _password.text);

//                         //           print(_username);
//                         //           print(_password);
//                         //         } else {
//                         //           print("Enter some value");
//                         //         }
//                         //       },
//                         //       child: Text('Login ->')),
//                         // ),
//                         Container(
//                           width: 150,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             // color: UIGuide.light_Purple,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: MaterialButton(
//                               color: UIGuide.light_Purple,
//                               onPressed: () async {
//                                 if (_formKey.currentState!.validate()) {
//                                   checkLogin(_username.text, _password.text);

//                                   print(_username);
//                                   print(_password);
//                                 } else {
//                                   print("Enter some value");
//                                 }
//                               },
//                               child: Text(
//                                 'Login ->',
//                                 style: TextStyle(color: Colors.white),
//                               )),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   void checkLogin(String username, String password) async {
//     SharedPreferences _pref = await SharedPreferences.getInstance();
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request(
//         'POST',
//         Uri.parse(
//             '${UIGuide.baseURL}/login?id=${_pref.getString('schoolId')}'));
//     // print(request);
//     request.body = json.encode({"email": username, "password": password});
//     print(request.body);
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var data = jsonDecode(await response.stream.bytesToString());
//       LoginModel res = LoginModel.fromJson(data);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('accesstoken', res.accessToken);
//       //  print(res.accessToken);
//       // await  Provider.of<ProfileProvider>(context).profileData();
//       Provider.of<LoginProvider>(context, listen: false).getToken(context);
//       var parsedResponse = await parseJWT();
//       if (parsedResponse['role'] == "Guardian") {
//         if (isLoading) return;
//         setState(() {
//           isLoading = true;
//         });
//         await Future.delayed(const Duration(seconds: 3));
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => StudentHome()));
//       } else if (parsedResponse['role'] == "SystemAdmin") {
//         if (isLoading) return;
//         setState(() {
//           isLoading = true;
//         });
//         await Future.delayed(const Duration(seconds: 3));
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
//       } else if (parsedResponse['role'] == "Teacher") {
//         if (isLoading) return;
//         setState(() {
//           isLoading = true;
//         });
//         await Future.delayed(const Duration(seconds: 3));
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (BuildContext context) => StaffHome()));
//       } else {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => StudentHome()));
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => StudentHome()));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Invalid Username or Password")));
//     }
//   }
// }
