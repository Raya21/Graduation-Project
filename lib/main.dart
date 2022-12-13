import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:index/addhelp.dart';
import 'package:index/apply_loans.dart';
import 'package:index/asking_for_help.dart';
import 'package:index/contactus.dart';
import 'package:index/family_data.dart';
import 'package:index/forget_password.dart';
import 'package:index/outstanding_students.dart';
//import 'package:index/language.dart';
import 'package:index/reset_password.dart';
import 'package:index/home.dart';
import 'package:index/login.dart';
import 'package:index/profile.dart';
import 'package:index/scholarship.dart';
import 'package:index/section1_familyData_page.dart';
import 'package:index/section2_familyData_page.dart';
import 'package:index/section3_familyData_page.dart';
import 'package:index/settings.dart';
import 'package:index/sign_up.dart';
import 'package:index/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'locale/locale.dart';
import 'locale/locale_controller.dart';


Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool themebool = pref.getBool("isdark") ?? false;
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(isdark: themebool),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     MyLocaleController controller = Get.put(MyLocaleController());
    return Consumer<ThemeProvider>(builder: ((context, value, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: value.getTheme,
     locale: controller.initialLang,
      translations: MyLocale(),
        initialRoute: "login",
        routes: {
          "home": (context) => Home(value: '',),
          "reset_password": (context) => ResetPass(),
          "login": (context) => Login(),
          "profile": (context) => profile(value: '',),
          "settings": (context) => settings(),
          "apply_loans": (context) => applyLoans(value: '',),
          "contactus": (context) => ContactUs(),
          "sign_up": (context) => SignUp(),
          "section1_familyData_page": (context) => Section1(),
          "section2_familyData_page": (context) => Section2(),
          "section3_familyData_page": (context) => Section3(),
          "family_data": (context) => FamilyData(),
          "forget_password": (context) => ForgetPass(),
          "scholarship": (context) => Scholarship(value: '', value1: '', value2: '', value3: '', emailv: '',),
          "outstanding_students": (context) => outstandingStudents(),
          "asking_for_help":(context) =>AskForHelp(value: '',),
          "addhelp":(context) => AddHelp(value: '',)
        },
      );
    }));
  }
}
