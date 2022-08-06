
import 'package:flutter/material.dart';

import 'Pages/ActivatePage.dart';

import 'Pages/Activation.dart';
import 'Pages/LoginPageWeb.dart';

Map<String, WidgetBuilder> routes = {
  routeActivation: (context) => ActivatePage(),

  routeLoginWeb: (context) => LoginPageWeb(),

};

///route name constants
const String routeActivation = "/activationPage";
const String routeLogin = "/loginPage";
const String routeLoginWeb = "/loginWebPage";
const String routeLoginmain = "/loginmain";
