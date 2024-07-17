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
  ].obs;

  final RxList<ArtistModel> lecturers = [
    ArtistModel(
      id: '1',
      name: "Sao Kosal",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/vodth-dapp.appspot.com/o/candidates%2FIMG_7867.JPG?alt=media&token=a2785131-56dc-429d-8fcb-68424f351d15",
    ),
  ].obs;
}
