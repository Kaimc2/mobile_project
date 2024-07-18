import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/settings_controller.dart';
import 'package:mobile_project/app/controllers/sp_controller/user_controller.dart';
import 'package:mobile_project/app/ui/screens/settings/widgets/dark_mode_tile.dart';
import 'package:mobile_project/app/ui/screens/settings/widgets/log_out_button.dart';
import 'package:mobile_project/app/ui/screens/settings/widgets/user_profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingController = Get.put(SettingsController());
    final UserController userController = Get.put<UserController>(
      UserController(),
    );
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildAppBar(context),
      body: Obx(
        () => buildBody(userController),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF212121),
      title: const Text(
        'Settings',
        style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildBody(UserController userController) {
    return ListView(
      children: [
        UserProfile(
          photoUrl: userController.user.value.photoUrl,
          name: userController.user.value.name,
        ),
        buildListile(
          title: 'Account',
          onTap: () => Get.toNamed('/account'),
        ),
        buildListile(
          title: 'Languages',
          onTap: () => Get.toNamed('/languages'),
        ),
        const DarkModeTile(
          title: 'Dark Mode',
        ),
        buildListile(
          title: 'About Us',
          onTap: () => Get.toNamed('/about-us'),
        ),
        const SizedBox(height: 60.0),
        const LogOutButton()
      ],
    );
  }

  Widget buildListile({
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_sharp,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}
