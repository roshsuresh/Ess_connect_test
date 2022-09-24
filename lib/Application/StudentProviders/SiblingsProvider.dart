import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain/Student/SiblingsNameModel.dart';
import '../../Domain/Student/SiblingsTokenModel.dart';
import '../../Presentation/Student/Student_home.dart';
import '../../utils/constants.dart';

class SibingsProvider with ChangeNotifier {
  bool isLoading = false;
  Future<List<SiblingsNameModel>> getSiblingName() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse("${UIGuide.baseURL}/parent-home/get-guardian-children"),
        headers: headers);
    var data = jsonDecode(response.body.toString());
    print('ghj...........$data');

    if (response.statusCode == 200) {
      var jsonrespo = json.decode(response.body);
      List<SiblingsNameModel> siblings = [];
      for (var u in jsonrespo) {
        SiblingsNameModel sibling =
            SiblingsNameModel(name: u['name'], id: u['id']);
        siblings.add(sibling);
      }
      notifyListeners();
      return siblings;
    } else {
      print('Error');
      throw ('Error');
    }
  }

  Future getSibling(BuildContext context, String childId) async {
    isLoading = true;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request('POST',
        Uri.parse('${UIGuide.baseURL}/user/load-new-token-guardian/$childId'));

    request.headers.addAll(headers);
    print(request);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(await response.stream.bytesToString());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      SiblingTokenModel respo = SiblingTokenModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accesstoken', respo.accessToken);
      print('accessToken ${respo.accessToken}');
      // notifyListeners();
      // await Provider.of<ProfileProvider>(context).profileData();

      // await Provider.of<LoginProvider>(context, listen: false)
      //     .getToken(context);
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => StudentHome()),
        (Route<dynamic> route) => false,
      );
      // await Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => StudentHome()),
      //     (Route<dynamic> route) => false);
      isLoading = false;
      notifyListeners();
      // await  Provider.of<ProfileProvider>(context).profileData();
      //  Provider.of<LoginProvider>(context, listen: false).getToken(context);
      // var parsedResponse = await parseJWT();

      //await Future.delayed(const Duration(seconds: 3));
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => StudentHome()));
      // } else {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => StudentHome()));
    }
  }
}
