import 'package:note_app_with_get_sqfile/controller/localeController.dart';
import 'package:get/get.dart';
import 'package:note_app_with_get_sqfile/controller/themeController.dart';

class MyBindings implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(localeController(),permanent: true);
    Get.put(ThemeController(),permanent: true);
  }
}