import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
