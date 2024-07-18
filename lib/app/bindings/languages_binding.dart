import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/languages_controller.dart';

class LanguagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguagesController());
  }
}
