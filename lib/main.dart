import 'package:DamiStyle/login_screens/Welcome/welcome_screen.dart';
import 'package:DamiStyle/pages/home.dart';
import 'package:DamiStyle/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:DamiStyle/constants.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
    home: WelcomeScreen(),
  ));
}
