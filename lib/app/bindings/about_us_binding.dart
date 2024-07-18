import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/about_us_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutUsController());
  }
}
