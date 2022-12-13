import 'dart:developer';

import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleProviders extends ChangeNotifier {
  // bool _loading = false;
  // bool get loading => _loading;
  // setLoading(bool value) {
  //   _loading = value;
  //   notifyListeners();
  // }
  bool fees = false;
  bool tabulation = false;
  bool timetable = false;
  bool curiculam = false;
  bool offlineAttendence = false;
  Future getModuleDetails() async {
    var parsedResponse = await parseJWT();

    if (parsedResponse['Modules'] ==
        "SCH,FEE,TT,TAB,CC,OFFLINE_ATT,ATT,OFFLINE_TAB,MOB_APP") {
      final newParse = parsedResponse['Modules'];
      String data = "SCH,FEE,TT,TAB,CC,OFFLINE_ATT,ATT,OFFLINE_TAB,MOB_APP";
      if (data.contains('FEE')) {
        fees = true;
        notifyListeners();
        print('!!!!!!!!!!!!!!!!!!!!');
      }
      if (data.contains('TT')) {
        timetable = true;
        notifyListeners();
      }
      if (data.contains('TAB')) {
        tabulation = true;
        notifyListeners();
      }
      if (data.contains('CC')) {
        curiculam = true;
        notifyListeners();
      }

      log('Module Checked'.toString());
    }
    notifyListeners();
  }
}
