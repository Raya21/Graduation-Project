import 'package:flutter/material.dart';
import 'package:graduation_project_1/family_data.dart';
import 'package:graduation_project_1/home.dart';
import 'package:graduation_project_1/sign_up.dart';

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
      home: FamilyData(),
      routes: {
        "SignUp": (context) => SignUp(),
        "FamilyData": (context) => FamilyData(),
        /*  "Home":(context) => Home(),
      "ForgetPass":(context) => ForgetPass(),
      "Login":(context) => Login()*/
      },
    );
  }
}
