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
          'https://scontent.fpnh8-2.fna.fbcdn.net/v/t39.30808-6/308991827_1562995874160099_5357320955659265368_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHmcbDz_3Ko4YmFeFDvmHcZAAbED9oN7hEABsQP2g3uETQfmXIscbmZCzIv_4QpO7eFGIkgLVYDEznfNT9nt1Ff&_nc_ohc=IL2JIZEPCKgQ7kNvgEcz6MV&_nc_zt=23&_nc_ht=scontent.fpnh8-2.fna&oh=00_AYD1L-WhOun-WnzF5l6CTb8Mhz3hFbpSHo-Kahtl6WAS2w&oe=669321AF',
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

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
