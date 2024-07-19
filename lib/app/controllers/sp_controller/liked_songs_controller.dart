import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';

class LikedSongsController extends GetxController {
  List<MusicModel> getMusic() {
    return [
      MusicModel(
        id: '1',
        name: 'VIOLET',
        imageUrl:
            'https://hololive.hololivepro.com/wp-content/uploads/2021/08/ina_violet_jk-e1661929568573.png',
        author: 'Ninomae Ina\'nis',
      ),
      MusicModel(
        id: '2',
        name: 'LiSA',
        imageUrl:
            'https://yt3.googleusercontent.com/VaqxUXZY8JO16FXLu2wVKseh977ylo1hEwwo1qdyjPu1HXAix5CdUhHKmPahn0TQLeKbRvh2KQ=s160-c-k-c0x00ffffff-no-rj',
        author: 'Lalisa Manoban',
      ),
      MusicModel(
        id: '3',
        name: 'hololive IDOL PROJECT, Ninomae Ina\'nis, Mori Calliope',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
      ),
      MusicModel(
        id: '4',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/6/61/Kendrick_Lamar_-_Not_Like_Us.png',
        name: 'Not like us',
        type: 'Playlists',
        author: 'Kendrick Lamar',
      ),
      MusicModel(
        id: '5',
        imageUrl:
            'https://media.pitchfork.com/photos/659d9b69c6f7f7f715b07416/master/pass/21-Savage-American-Dream.jpg',
        name: 'Alot',
        type: 'Playlists',
        author: '21 Savage',
      ),
      MusicModel(
        id: '6',
        imageUrl:
            'https://i.scdn.co/image/ab67616d0000b273c91ffc9b512057a66087b98e',
        name: 'Skull 2',
        type: 'Playlists',
        author: 'Mann Vanda',
      ),
    ];
  }
}
