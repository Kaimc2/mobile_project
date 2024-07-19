import 'package:get/get.dart';

class LikedSongsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikedSongsBinding());
  }
}
