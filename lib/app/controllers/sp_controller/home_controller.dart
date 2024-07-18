import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/artist_model.dart';
import 'package:mobile_project/app/data/models/sp_model/playlist_model.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;

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
          name: "Kakada",
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
