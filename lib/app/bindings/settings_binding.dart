import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
