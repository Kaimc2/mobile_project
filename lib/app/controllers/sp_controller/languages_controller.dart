import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguagesController extends GetxController {
  var currentLocale = const Locale('en').obs;

  @override
  void onInit() {
    super.onInit();
    loadLocale();
  }

  void changeLocale(Locale locale) async {
    currentLocale.value = locale;
    Get.updateLocale(locale);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }

  bool isSelected(Locale locale) {
    return currentLocale.value == locale;
  }

  void loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('locale');
    if (languageCode != null) {
      currentLocale.value = Locale(languageCode);
      Get.updateLocale(currentLocale.value);
    }
  }
}
