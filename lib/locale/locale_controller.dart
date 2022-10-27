import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  Locale initialLang =
      GetStorage().read("language") == "ar" ? Locale("ar") : Locale("en");

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    GetStorage().write("language", codeLang);
    Get.updateLocale(locale);
  }
}
