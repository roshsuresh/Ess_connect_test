import 'package:flutter/material.dart';

import 'Presentation/Login_Activation/ActivatePage.dart';
import 'Presentation/Login_Activation/LoginPageWeb.dart';

Map<String, WidgetBuilder> routes = {
  routeActivation: (context) => ActivatePage(),
  routeLoginWeb: (context) => LoginPageWeb(),
};

///route name constants
const String routeActivation = "/activationPage";
const String routeLogin = "/loginPage";
const String routeLoginWeb = "/loginWebPage";
const String routeLoginmain = "/loginmain";
