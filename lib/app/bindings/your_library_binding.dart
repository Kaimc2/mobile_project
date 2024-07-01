import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/your_library_binding.dart';

class YourLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourLibraryController());
  }
}
