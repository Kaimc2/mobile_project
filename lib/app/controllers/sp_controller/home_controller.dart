import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/artist_model.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/data/models/sp_model/playlist_model.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;

  UserModel getUser() {
    return UserModel(
      id: '12',
      name: 'Tykea',
      email: 'tk@gmail.com',
      photoUrl:
          'https://scontent.fpnh11-1.fna.fbcdn.net/v/t39.30808-1/451078650_1973951236397892_1005063722113467197_n.jpg?stp=c187.0.480.480a_dst-jpg_p480x480&_nc_cat=103&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeEuatl-CSVLOmryDROKsBbZWQd-ofwnLuRZB36h_Ccu5GuGTqOInobF63TJ6geqe2Bd16Z12Jlq-foPwezxJson&_nc_ohc=AJPAWJoGn3kQ7kNvgHUJ0QU&_nc_ht=scontent.fpnh11-1.fna&oh=00_AYDL6Aa_28zdSSNS4T07Bmd0zXlDA2qzctxKYmiTarqGNw&oe=669AC0D7',
    );
  }

  List<ArtistModel> getArtists() {
    return [
      ArtistModel(
          id: '1',
          name: "Tykea Ly",
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/vodth-dapp.appspot.com/o/candidates%2FIMG_7867.JPG?alt=media&token=a2785131-56dc-429d-8fcb-68424f351d15"),
      ArtistModel(
          id: '2',
          name: "Pichey",
          imageUrl:
              "https://images.ctfassets.net/mrsnpomeucef/3flwsEi4H05T90gyKDVrVn/817cb2fb12e91cbcd607a142539fe3ff/How_to_clear_Spotify_queue.png?w=2880&h=1440"),
      ArtistModel(
          id: '3',
          name: "kakada",
          imageUrl:
              "https://images.ctfassets.net/mrsnpomeucef/3flwsEi4H05T90gyKDVrVn/817cb2fb12e91cbcd607a142539fe3ff/How_to_clear_Spotify_queue.png?w=2880&h=1440"),
      ArtistModel(
          id: '4',
          name: "HakRul",
          imageUrl:
              "https://images.ctfassets.net/mrsnpomeucef/3flwsEi4H05T90gyKDVrVn/817cb2fb12e91cbcd607a142539fe3ff/How_to_clear_Spotify_queue.png?w=2880&h=1440"),
    ];
  }

  List<PlaylistModel> getPlaylists() {
    return [
      PlaylistModel(
        id: '1',
        name: 'My Favorite',
        imageUrl:
            'https://images.ctfassets.net/mrsnpomeucef/3flwsEi4H05T90gyKDVrVn/817cb2fb12e91cbcd607a142539fe3ff/How_to_clear_Spotify_queue.png?w=2880&h=1440',
      ),
      PlaylistModel(
        id: '2',
        name: 'Playlist for the dead',
        imageUrl:
            'https://images.8tracks.com/cover/i/009/012/462/Untitled-1-6975.jpg?rect=0,0,500,500&q=98&fm=jpg&fit=max&w=960&h=960',
      ),
      PlaylistModel(
        id: '3',
        name: '\$kull the Album',
        imageUrl:
            'https://i.scdn.co/image/ab67616d0000b273f04771092c2f52ec785f0c9e',
      ),
      PlaylistModel(
        id: '4',
        name: 'Lo-fi Khoding',
        imageUrl:
            'https://storage.ko-fi.com/cdn/useruploads/post/84610529-483b-49cb-8c64-7e2e468a6c2f_loficoding.jpg',
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    // Retrieve the tab index from arguments if available
    if (Get.arguments != null && Get.arguments['tabIndex'] != null) {
      tabIndex.value = Get.arguments['tabIndex'];
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
