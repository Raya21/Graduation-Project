import 'package:flutter/material.dart';
import 'package:index/contactus.dart';
import 'package:index/family_data.dart';
//import 'package:index/language.dart';
import 'package:index/forget_password.dart';
import 'package:index/home.dart';
import 'package:index/loans_request.dart';
import 'package:index/login.dart';
import 'package:index/profile.dart';
import 'package:index/qualifications.dart';
import 'package:index/section1_familyData_page.dart';
import 'package:index/section2_familyData_page.dart';
import 'package:index/section3_familyData_page.dart';
import 'package:index/settings.dart';
import 'package:index/sign_up.dart';


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
      fontFamily: 'Roboto'
     ),
     initialRoute: "home",
     routes: {
      "home":(context) => Home(),
      "forget_password":(context) => ForgetPass(),
      "login":(context) => Login(),
      //"language":(context) => Language(),
      "profile":(context) => profile(),
      "settings":(context) => settings(),
      "loans_request":(context) => ApplyLoans(),
      "qualifications":(context) => Qualifications(),
      "contactus":(context) => ContactUs(),
      "sign_up":(context) => SignUp(),
      "section1_familyData_page":(context) => Section1(),
      "section2_familyData_page":(context) => Section2(),
      "section3_familyData_page":(context) => Section3(),
      "family_data":(context) => FamilyData()
      },
    );
  }
}

