import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/controller/localeController.dart';
import 'package:note_app_with_get_sqfile/main.dart';

class ChoseLangDialouge extends StatefulWidget {
  const ChoseLangDialouge({super.key});

  @override
  State<ChoseLangDialouge> createState() => _ChoseLangDialougeState();
}

class _ChoseLangDialougeState extends State<ChoseLangDialouge> {
  String lang = pref?.getString("lang") == "ar" ? "ar" : "en";
  localeController l = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("c_l".tr),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            RadioListTile(title: Text("English".tr),activeColor: Colors.green,value: 'en', groupValue: lang, onChanged: (value){
              setState(() {
                lang = value!;
                pref?.setString("lang", "ar");
                l.changeLang('ar');
                Navigator.of(context).pop();
              });
            }),
            RadioListTile(title: Text("Arabic".tr),activeColor: Colors.green,value: "ar", groupValue: lang, onChanged: (val){
              setState(() {
                lang = val!;
                pref?.setString("lang", "en");
                l.changeLang('en');
                Navigator.of(context).pop();
              });
            }),
          ],
        ),
      ),
    );
  }
}
