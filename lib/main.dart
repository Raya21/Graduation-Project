import 'package:flutter/material.dart';
//import 'package:index/language.dart';
import 'package:index/forget_password.dart';
import 'package:index/home.dart';
import 'package:index/loans_request.dart';
import 'package:index/login.dart';
import 'package:index/profile.dart';
import 'package:index/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primaryColor: Colors.purple,
     ),
     initialRoute: "home",
     routes: {
      "home":(context) => Home(),
      "forget_password":(context) => ForgetPass(),
      "login":(context) => Login(),
      //"language":(context) => Language(),
      "profile":(context) => profile(),
      "settings":(context) => settings(),
      "loans_request":(context) => Loans(),
      },
    );
  }
}

