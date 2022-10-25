import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  final datacount = GetStorage();
  /*addStringToSF(String codeLang) async {
    SharedPreferences sharepref = await SharedPreferences.getInstance();
    sharepref.setString("lang", codeLang);
  }*/

  //Locale initialLang
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    datacount.write("count", codeLang);
    // addStringToSF(codeLang);
    //sharepref!.setString("lang", codeLang);
    Get.updateLocale(locale);
  }
}
