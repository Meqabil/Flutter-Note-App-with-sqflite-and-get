import 'dart:ui';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/main.dart';

class localeController extends GetxController{

  changeLang(String lang){
    if(lang == 'en'){
      Locale locale = const Locale('ar');
      pref?.setString("lang", "ar");
      Get.updateLocale(locale);
    }else{
      Locale locale = const Locale('en');
      pref?.setString("lang", "en");
      Get.updateLocale(locale);
    }
  }
}