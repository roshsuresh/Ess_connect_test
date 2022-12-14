import 'dart:convert';
import 'package:Ess_test/Domain/Password/PasswordModel.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants.dart';

class PasswordChangeprovider with ChangeNotifier {
  String? oldPasswordCorrect;
  Future checkOldPassword(String oldPass) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/changepassword/checkoldpassword?oldPassword=$oldPass"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        print('__________');

        Map<String, dynamic> data = json.decode(response.body);
        print(data);
        CkeckoldPassword chk = CkeckoldPassword.fromJson(data);
        oldPasswordCorrect = chk.oldPasswordCorrect;
        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  Future updatePassword(BuildContext context, String oldPass, String newPass,
      String confirmPass) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/changepassword/savenewpassword?oldPassword=$oldPass&newPassword=$newPass&confirmPassword=$confirmPass"),
        headers: headers);

    try {
      if (response.statusCode == 201) {
        print('_____Password Changed_____');
        AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                headerAnimationLoop: false,
                title: 'Success',
                desc: 'Password Changed Successfully',
                btnOkOnPress: () {},
                btnOkColor: Colors.green)
            .show();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          duration: Duration(seconds: 1),
          margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Password Changed',
            textAlign: TextAlign.center,
          ),
        ));
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          duration: Duration(seconds: 1),
          margin: EdgeInsets.only(bottom: 80, left: 30, right: 30),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Something Went Wrong....',
            textAlign: TextAlign.center,
          ),
        ));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  bool isVisible = false;
  visiblee() async {
    isVisible = true;
    notifyListeners();
  }
}
