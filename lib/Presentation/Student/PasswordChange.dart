import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Application/StudentProviders/PasswordChangeProvider.dart';
import '../../Constants.dart';
import '../../utils/constants.dart';

class PasswordChange extends StatelessWidget {
  PasswordChange({Key? key}) : super(key: key);
  bool _isObscure = false;
  final _confirmpassword = TextEditingController();
  final _passwordNew = TextEditingController();
  final _password = TextEditingController();
  // String? oldPass;
  // String? newPass;
  // String? confirmPass;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Center(
        child: ListView(
          children: [
            kheight20,
            kheight10,
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/6195/6195699.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            kheight20,
            kheight10,
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: !_isObscure,
                      controller: _password,
                      decoration: InputDecoration(
                        focusColor: Color.fromARGB(255, 213, 215, 218),
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: Colors.grey,
                        ),
                        //errorText: "Please enter valid username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 123, 181, 228),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.grey,
                        hintText: "Enter Your Current Password",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Current Password',
                      ),
                      validator: (value) {
                        RegExp regEx = RegExp(
                            r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Please enter New password';
                        }
                        // else {
                        //   if (!regEx.hasMatch(value)) {
                        //     return 'Enter ____ password';
                        //   } else {
                        return null;
                        //   }
                        // }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: !_isObscure,
                      controller: _passwordNew,
                      decoration: InputDecoration(
                        focusColor: const Color.fromARGB(255, 213, 215, 218),
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: Colors.grey,
                        ),
                        //errorText: "Please enter valid username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 123, 181, 228),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.grey,
                        hintText: "Enter Your New Password",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'New Password',
                      ),
                      validator: (value) {
                        RegExp regExpp = RegExp(
                            r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');

                        if (value == null || value.isEmpty) {
                          return 'Please enter New password';
                        }
                        // else {
                        // if (!regExpp.hasMatch(value)) {
                        //   if (_passwordNew.text != _confirmpassword.text) {
                        //     return 'Password do not match..!';
                        //   }
                        //   return 'Enter valid password';
                        // } else {
                        return null;
                        // }
                        //  }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: !_isObscure,
                      controller: _confirmpassword,
                      decoration: InputDecoration(
                        focusColor: const Color.fromARGB(255, 213, 215, 218),
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 123, 181, 228),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.grey,
                        hintText: "Enter Confirm Password",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        RegExp regExp = RegExp(
                            r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');

                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        //  else {
                        //   if (!regExp.hasMatch(value)) {
                        // if (_passwordNew.text != _confirmpassword.text) {
                        //   return 'Password do not match..!';
                        // }
                        //   return 'Enter valid password';
                        // } else {
                        return null;
                        //   }
                        // }
                      },
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    width: 200,
                    child: Consumer<PasswordChangeprovider>(
                      builder: (context, value, child) => MaterialButton(
                        height: 60,
                        onPressed: () async {
                          String pass = _password.text.toString();
                          String newPass = _passwordNew.text.toString();
                          String confirmPass = _confirmpassword.text.toString();
                          if (await _formkey.currentState!.validate()) {
                            print('validated');
                            await Provider.of<PasswordChangeprovider>(context,
                                    listen: false)
                                .checkOldPassword(pass);
                            String check = value.oldPasswordCorrect.toString();
                            print(value.oldPasswordCorrect.toString());
                            if (check.toString() == true.toString()) {
                              print('success');
                              await Provider.of<PasswordChangeprovider>(context,
                                      listen: false)
                                  .updatePassword(pass, newPass, confirmPass);
                              await AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      headerAnimationLoop: false,
                                      title: 'Success',
                                      desc: 'Password Changed Successfully',
                                      btnOkOnPress: () {
                                        Navigator.pop(context);
                                      },
                                      btnOkColor: Colors.green)
                                  .show();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Incorrect Old Password")));
                              print('Fail');
                            }
                          } else {
                            print('Error in conection');
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                        color: UIGuide.light_Purple,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
