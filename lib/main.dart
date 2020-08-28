import 'package:flutter/material.dart';
import 'package:world2/pages/choose_location.dart';
import 'package:world2/pages/home.dart';
import 'package:world2/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
  debugShowCheckedModeBanner: false,
));
