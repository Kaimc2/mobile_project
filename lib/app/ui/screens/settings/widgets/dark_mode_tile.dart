import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/theme_mode_controller.dart';

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeModeController themeModeController =
        Get.put<ThemeModeController>(ThemeModeController());
    return Obx(
      () => ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        trailing: Switch.adaptive(
          value: themeModeController.isDarkMode.value,
          onChanged: (value) {
            themeModeController.toggleDarkMode();
          },
          activeColor: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
