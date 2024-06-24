import 'package:get/state_manager.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';

class TestController extends GetxController {
  
  UserModel getUser() {
    return UserModel(
      id: '12',
      name: 'Nenghak',
      email: 'hak@gmail.com',
      photoUrl: 'https://www.google.com',
    );
  }
}
