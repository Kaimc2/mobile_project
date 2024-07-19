import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/artist_model.dart';

class AboutUsController extends GetxController {
  final RxList<ArtistModel> artists = <ArtistModel>[
    ArtistModel(
        id: '1',
        name: "Tykea Ly",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/vodth-dapp.appspot.com/o/candidates%2FIMG_7867.JPG?alt=media&token=a2785131-56dc-429d-8fcb-68424f351d15"),
    ArtistModel(
        id: '2',
        name: "Prak Pichey",
        imageUrl: "assets/images/prak_pichey_profile.jpg"),
    ArtistModel(
        id: '3',
        name: "Chhim Kakada",
        imageUrl:
            "https://scontent.fpnh5-2.fna.fbcdn.net/v/t39.30808-6/344549771_1243328739634844_264069067732752802_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFlxOjNhYIVrP8ua9AaxNTSc1iZFchtO6JzWJkVyG07oueYBOS0WdeeGeGcGufdaoDrzDGt_7CTI-0fyawCrGED&_nc_ohc=fTrIUNlqFcgQ7kNvgEtOBsV&_nc_zt=23&_nc_ht=scontent.fpnh5-2.fna&oh=00_AYDWDg8hrEezR8-e1sflVm7gzHOVzsyckfVeaqSsUKUUdg&oe=669FF51A"),
    ArtistModel(
        id: '4',
        name: "Heng Nenghak",
        imageUrl:
            "https://media.licdn.com/dms/image/D5603AQE5vVR-aSj6oA/profile-displayphoto-shrink_800_800/0/1721062065629?e=1726704000&v=beta&t=jnDPx8bHsRGzg2OapPA8tRdIHv9xIxC7loglUoOZWYU"),
  ].obs;

  final RxList<ArtistModel> lecturers = [
    ArtistModel(
      id: '1',
      name: "Mr. Oum Saokosal",
      imageUrl:
          "https://yt3.googleusercontent.com/WdPZqmPq34KG-cwxOMHXmdHDlXzbkofAtQKD8Crm7FO9QjeoT8C5Z-cOAV9QierKnVMRjXtO=s900-c-k-c0x00ffffff-no-rj",
    ),
  ].obs;
}
