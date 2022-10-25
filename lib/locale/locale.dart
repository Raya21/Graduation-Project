import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "اسم المستخدم",
          "2": "البريد الإلكتروني",
          "3": "كلمة السر",
          "Settings": "الإعدادات",
          "Change Password": "تغيير كلمة السر",
          "Arabic": "عربي",
          "English": "انجليزي",
          "Colse": "إغلاق",
          "Account": "الحساب",
          "Language": "اللغة"
        },
        "en": {
          "1": "User Name",
          "2": "E-mail",
          "3": "Password",
          "Settings": "Settings",
          "Change Password": "Change Password",
          "Arabic": "Arabic",
          "English": "English",
          "Colse": "Colse",
          "Account": "Account",
          "Language": "Language"
        }
      };
}
