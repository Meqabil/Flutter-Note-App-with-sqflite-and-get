import 'package:get/get.dart';

class MyTranslations extends Translations{
  @override
  Map<String,Map<String,String>> get keys =>{
    'en' : {
      //Main Page
      'm_title': 'Notes',
      'g_s': 'Go to Settings',
      'd_a': 'Delete all notes',
      // Adding notes page
      'n_t': 'Title',
      'note':'Note',
      'save':'save',
      // Settings Page
      's_title': "Settings",
      'dark_mode': 'Dark Mode',
      'language' : 'Language',
      'lang': 'English',
      'English': 'English',
      'Arabic': 'Arabic',
      'c_l': 'Change Language',
      'share': 'Share',
      'share_note':"Share the note",
      'delete':'Delete the note'
    },
    'ar' : {
      //Main Page
      'm_title': 'الملاحظات',
      'g_s': 'الذهاب إالـي الإعدادات',
      'd_a': 'حذف كل الملاحظات',
      // Adding notes page
      'n_t': 'العنوان',
      'note':'المـوضوع',
      'save':'حفظ',
      // Settings Page
      's_title': 'الإعدادات',
      'dark_mode': 'الوضع المظلم',
      'language' : 'اللغة',
      'lang': 'العربية',
      'English': 'الانجليزية',
      'Arabic': 'العربية',
      'c_l': 'تغيير اللغة',
      'share': 'مشاركة التطبيق',
      'share_note':'إرســال ملاحظـة',
      'delete':'حذف الملاحظـة'
    }
  };
}
