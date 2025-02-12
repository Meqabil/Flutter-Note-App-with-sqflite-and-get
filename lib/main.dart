import 'package:flutter/material.dart';
import 'package:note_app_with_get_sqfile/controller/themeController.dart';
import 'package:note_app_with_get_sqfile/locale/my_locale.dart';
import 'package:note_app_with_get_sqfile/model/color_themes.dart';
import 'package:note_app_with_get_sqfile/model/myBinidings.dart';
import 'package:note_app_with_get_sqfile/view/add_notes.dart';
import 'package:note_app_with_get_sqfile/view/home.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/view/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
SharedPreferences? pref;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    final themeController = Get.put(ThemeController());
    final loadTheme = themeController.loadThemePreference();
    return GetMaterialApp(
      title: "Simple Note App",
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      translations: MyTranslations(),
      theme: themeController.isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme,
      locale: Locale(pref?.getString("lang") ?? "en"),
      home: const Home(),
      getPages: [
        GetPage(name: '/', page:() => const Home()),
        GetPage(name: '/add_notes', page:() => const AddNotes()),
        GetPage(name: '/settings', page: ()=> const SettingsPage()),
      ],
    );
  }
}
