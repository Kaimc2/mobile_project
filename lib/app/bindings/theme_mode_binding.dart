import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/theme_mode_controller.dart';

class ThemeModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeModeController());
  }
}
