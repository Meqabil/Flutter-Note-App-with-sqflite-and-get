import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/main.dart';
import 'package:note_app_with_get_sqfile/model/color_themes.dart';

class ThemeController extends GetxController {
  // Observable variable for theme mode
  RxBool isDarkMode = false.obs;

  // Toggle theme mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    isDarkMode.value ? pref?.setString("theme", "dark") : pref?.setString("theme", "light");
    Get.changeTheme(isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  // Load theme preference from storage (optional)
  Future<void> loadThemePreference() async {
    if(pref?.getString("theme") != null){
      if(pref?.getString("theme") == "dark"){
        isDarkMode.value = true;
        Get.changeTheme(AppThemes.darkTheme);
      }else{
        isDarkMode.value = false;
        Get.changeTheme(AppThemes.lightTheme);
      }
    }
  }
}