import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Application/StudentProviders/LoginProvider.dart';
import '../../Constants.dart';
import '../../Domain/Student/LoginModel.dart';
import '../../utils/LoadingIndication.dart';
import '../../utils/constants.dart';
import '../Admin/AdminHome.dart';
import '../Staff/StaffHome.dart';
import '../Student/Student_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const LoadingIcon()
          : Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(31, 222, 245, 248)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _username,
                          decoration: InputDecoration(
                              focusColor:
                                  const Color.fromARGB(255, 213, 215, 218),
                              prefixIcon: const Icon(
                                Icons.person_outline_rounded,
                                color: UIGuide.light_Purple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: UIGuide.light_Purple, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,
                              hintText: "Enter Your registered Email",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                              labelText: 'Email',
                              labelStyle:
                                  const TextStyle(color: UIGuide.light_Purple)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          },
                        ),
                        kheight10,
                        TextFormField(
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
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: UIGuide.light_Purple, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
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
                            labelStyle:
                                const TextStyle(color: UIGuide.light_Purple),
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
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        kheight20,
                        // Container(
                        //   color: UIGuide.light_Purple,
                        //   width: 150,
                        //   height: 50,
                        //   child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //           shadowColor: UIGuide.light_Purple),
                        //       onPressed: () async {
                        //         if (_formKey.currentState!.validate()) {
                        //           checkLogin(_username.text, _password.text);

                        //           print(_username);
                        //           print(_password);
                        //         } else {
                        //           print("Enter some value");
                        //         }
                        //       },
                        //       child: Text('Login ->')),
                        // ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: UIGuide.light_Purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                              color: UIGuide.light_Purple,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  checkLogin(_username.text, _password.text);

                                  print(_username);
                                  print(_password);
                                } else {
                                  print("Enter some value");
                                }
                              },
                              child: Text(
                                'Login ->',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
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
      // SharedPreferences prefs = await SharedPreferences.getInstance();
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentHome()));
      } else if (parsedResponse['role'] == "SystemAdmin") {
        if (isLoading) return;
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminHome()));
      } else if (parsedResponse['role'] == "Teacher") {
        if (isLoading) return;
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StaffHome()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentHome()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid Username or Password")));
    }
  }
}
