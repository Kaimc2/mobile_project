import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
