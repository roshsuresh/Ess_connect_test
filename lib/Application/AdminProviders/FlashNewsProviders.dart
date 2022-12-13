import 'dart:convert';
import 'package:Ess_test/Domain/Admin/FlashNewsList.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FlashNewsProviderAdmin with ChangeNotifier {
  Future flashNewsUpload(
    context,
    String entryDate,
    String displayStartDate,
    String displayEndDate,
    String news,
  ) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'POST', Uri.parse('${UIGuide.baseURL}/communication/flashnews/create'));
    request.body = json.encode({
      "EntryDate": entryDate,
      "DisplayStartDate": displayStartDate,
      "DisplayEndDate": displayEndDate,
      "News": news
    });
    print(json.encode({
      "EntryDate": entryDate,
      "DisplayStartDate": displayStartDate,
      "DisplayEndDate": displayEndDate,
      "News": news
    }));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Correct...______________________________');
      AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              headerAnimationLoop: false,
              title: 'Success',
              desc: 'Uploaded Successfully',
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              btnOkColor: Colors.green)
          .show();

      //  print(await response.stream.bytesToString());
    } else {
      print('Error in gallery save respo');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Something Went Wrong....',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 1),
      ));
    }
  }

  //flash list

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<FlashnewsListAdmin> flashlist = [];
  Future getFlashnewsList() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };

    var request = http.Request(
        'GET', Uri.parse('${UIGuide.baseURL}/mobileapp/admin/flash-news-list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(await response.stream.bytesToString());

      List<FlashnewsListAdmin> templist = List<FlashnewsListAdmin>.from(
          data["flashnewsList"].map((x) => FlashnewsListAdmin.fromJson(x)));
      flashlist.addAll(templist);
      setLoading(false);
      notifyListeners();
    } else {
      setLoading(false);
      print("Error in flashnewsList response");
    }
  }

  //delete flashnews

  Future flashnewsDelete(String eventID, BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    var request = http.Request(
        'DELETE',
        Uri.parse(
            '${UIGuide.baseURL}/communication/flashnews/delete-event/$eventID'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 204) {
      print(await response.stream.bytesToString());
      print('correct');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Deleted Successfully")));

      notifyListeners();
    } else {
      print('Error in galleryDelete stf');
    }
  }
}
