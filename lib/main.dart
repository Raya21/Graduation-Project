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
import 'package:index/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool themebool = pref.getBool("isdark")?? false;
  runApp(ChangeNotifierProvider(create: (context)=>ThemeProvider(isdark: themebool), child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: ((context, value, child) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: value.getTheme,
     /*ThemeData(
      primaryColor: Colors.purple,
      fontFamily: 'Average_Sans',
     ),*/
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
    }));
  }
}