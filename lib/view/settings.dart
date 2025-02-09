import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/controller/themeController.dart';
import 'package:note_app_with_get_sqfile/view/chose_lang_dialouge.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  final String appLink = ''' هذا البرنامج يستخدم لتخزين الملاحظات بقاعدة البيانات المحلية قم بتحميله الان من متجر التطبيقات
  https://play.google.com/store/apps/details?id=com.example.note_app_with_get_sqfile
  ''';
  void shareApp(){
    Share.share(appLink);
  }
  ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("s_title".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            SwitchListTile(
                activeColor: Colors.green,
                title: Text("dark_mode".tr),
                value: themeController.isDarkMode.value,
                onChanged: (value){
                  themeController.toggleTheme();
                  setState(() {
                    value = themeController.isDarkMode.value;
                  });
                }
            ),
            ListTile(
              title: Text("lang".tr,style: const TextStyle(color: Colors.green)),
              leading: Text("language".tr,),
              trailing: const Icon(Icons.language),
              onTap: (){
                showDialog(context: context, builder: (context) => const ChoseLangDialouge());
              },
            ),
            ListTile(
              title: Text('share'.tr),
              trailing: const Icon(Icons.share),
              onTap: shareApp,
            )
          ],
        ),
      ),
    );
  }
}
