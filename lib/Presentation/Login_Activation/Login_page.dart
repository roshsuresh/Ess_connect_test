import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Ess_Conn/Constants.dart';
import 'package:Ess_Conn/Presentation/Student/Student_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Application/LoginProvider.dart';
import '../../Application/ProfileProvider.dart';
import '../../Domain/LoginModel.dart';
import '../../utils/constants.dart';
import 'LoginPageWeb.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

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
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(31, 222, 245, 248)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                              focusColor: Color.fromARGB(255, 213, 215, 218),
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                color: Colors.grey,
                              ),
                              // errorText: "Please enter valid username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,
                              hintText: "Enter Your User Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                              labelText: 'Username'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        kheight10,
                        TextFormField(
                          obscureText: !_isObscure,
                          controller: _password,
                          decoration: InputDecoration(
                            focusColor: Color.fromARGB(255, 213, 215, 218),
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              color: Colors.grey,
                            ),
                            // errorText: "Please enter valid username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: Colors.grey,
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
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
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                checkLogin(_username.text, _password.text);

                                print(_username);
                                print(_password);
                              } else {
                                print("Enter some value");
                              }
                            },
                            child: Text('Login ->'))
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentHome()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPageWeb()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid Username or Password")));
    }
  }
}
