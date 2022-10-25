import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project_1/family_data.dart';
import 'package:graduation_project_1/home.dart';
import 'package:graduation_project_1/locale/locale.dart';
import 'package:graduation_project_1/sign_up.dart';
import 'package:graduation_project_1/settings.dart';
import 'locale/locale_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      locale: Get.deviceLocale,
      translations: MyLocale(),
      home: FamilyData(),
      routes: {
        "SignUp": (context) => SignUp(),
        "FamilyData": (context) => FamilyData(),
        "settings": (context) => settings(),
        /*  "Home":(context) => Home(),
      "ForgetPass":(context) => ForgetPass(),
      "Login":(context) => Login()*/
      },
    );
  }
}
