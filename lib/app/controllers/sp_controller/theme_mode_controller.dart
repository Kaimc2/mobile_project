import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeModeController extends GetxController {
  RxBool isDarkMode = true.obs;

  void toggleDarkMode() {
    // False is dark mode, true is light mode
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
