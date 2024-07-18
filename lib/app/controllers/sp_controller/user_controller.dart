import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';

class UserController extends GetxController {
  // Initialize `user` as an Rx<UserModel> with a default UserModel instance or make it nullable
  final Rx<UserModel> user = UserModel(
    id: '12',
    name: 'Tykea',
    email: 'tk@gmail.com',
    photoUrl:
        'https://scontent.fpnh11-1.fna.fbcdn.net/v/t39.30808-1/451078650_1973951236397892_1005063722113467197_n.jpg?stp=c187.0.480.480a_dst-jpg_p480x480&_nc_cat=103&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeEuatl-CSVLOmryDROKsBbZWQd-ofwnLuRZB36h_Ccu5GuGTqOInobF63TJ6geqe2Bd16Z12Jlq-foPwezxJson&_nc_ohc=AJPAWJoGn3kQ7kNvgHUJ0QU&_nc_ht=scontent.fpnh11-1.fna&oh=00_AYDL6Aa_28zdSSNS4T07Bmd0zXlDA2qzctxKYmiTarqGNw&oe=669AC0D7',
    password: 'tykeaboyloy1234',
    nameHash: '3rsv3vl59hpdcl5bdca2bylhh',
    subscriptionType: 'Free',
  ).obs;
}
