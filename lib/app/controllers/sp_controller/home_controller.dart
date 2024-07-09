import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;

  UserModel getUser() {
    return UserModel(
      id: '12',
      name: 'Nenghak',
      email: 'hak@gmail.com',
      photoUrl: 'https://www.google.com',
    );
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
