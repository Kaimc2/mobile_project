import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';

class MusicPageController extends GetxController {
  List<MusicModel> getMusic() {
    return [
      MusicModel(
        id: '1',
        name: 'VIOLET',
        imageUrl:
            'https://hololive.hololivepro.com/wp-content/uploads/2021/08/ina_violet_jk-e1661929568573.png',
      ),
      MusicModel(
        id: '2',
        name: 'LiSA',
        imageUrl:
            'https://yt3.googleusercontent.com/VaqxUXZY8JO16FXLu2wVKseh977ylo1hEwwo1qdyjPu1HXAix5CdUhHKmPahn0TQLeKbRvh2KQ=s160-c-k-c0x00ffffff-no-rj',
      ),
      MusicModel(
        id: '3',
        name: 'hololive IDOL PROJECT, Ninomae Ina\'nis, Mori Calliope',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
      ),
      MusicModel(
        id: '4',
        name: 'VIOLET',
        imageUrl:
            'https://hololive.hololivepro.com/wp-content/uploads/2021/08/ina_violet_jk-e1661929568573.png',
      ),
      MusicModel(
        id: '5',
        name: 'LiSA',
        imageUrl:
            'https://yt3.googleusercontent.com/VaqxUXZY8JO16FXLu2wVKseh977ylo1hEwwo1qdyjPu1HXAix5CdUhHKmPahn0TQLeKbRvh2KQ=s160-c-k-c0x00ffffff-no-rj',
      ),
      MusicModel(
        id: '6',
        name: 'hololive IDOL PROJECT, Ninomae Ina\'nis, Mori Calliope',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
      ),
    ];
  }

  List<MusicCardModel> getMusicCardContents() {
    return [
      MusicCardModel(
        id: '1',
        name: 'J-Pop Mix',
        mixImageUrl:
            'https://static.miraheze.org/hololivewiki/thumb/1/19/Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg/300px-Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg',
        bgImageUrl:
            'https://static.miraheze.org/hololivewiki/thumb/1/19/Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg/300px-Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg',
        description: 'hololive IDOL PROJECT, ClariS, RADWIMPS and more',
      ),
      MusicCardModel(
        id: '2',
        name: 'SONA',
        mixImageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
        bgImageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
        description: '',
        category: 'Album · PPC',
        preview: 'Song Name - Playing or Something IDK',
      ),
    ];
  }
}
