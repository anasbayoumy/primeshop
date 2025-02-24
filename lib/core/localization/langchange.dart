import 'dart:ui';

import 'package:get/get.dart';
import 'package:primeshop/core/services/services.dart';

class Langchange extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ChangeLang(String LangCode) {
    Locale locale = Locale(LangCode);
    myServices.sharedPreferences.setString("Lang", LangCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreference = myServices.sharedPreferences.getString("Lang");
    if (sharedPreference == "English") {
      language = const Locale("en");
    } else if (sharedPreference == "العربية") {
      language = const Locale("ar");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
