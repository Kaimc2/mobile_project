import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';
import 'package:mobile_project/app/controllers/sp_controller/music_page_controller.dart';
import 'package:mobile_project/app/controllers/sp_controller/user_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/favorite_playlist.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/podcast_list.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/popular_artists.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/recently_played_list.dart';
import 'package:mobile_project/app/ui/screens/music/music_page.dart';
import 'package:mobile_project/app/ui/screens/music/widgets/row.dart';
import 'package:mobile_project/app/ui/screens/podcast/podcast_page.dart';
import 'package:mobile_project/app/data/models/sp_model/playlist_model.dart';
import 'package:mobile_project/app/data/models/sp_model/artist_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PlaylistModel> playlists = controller.getPlaylists();
    final List<MusicModel> music = MusicPageController().getMusic();
    final UserModel user = UserController().user.value;
    final List<ArtistModel> artists = controller.getArtists();
    final List<PlaylistModel> recentlyPlayedList = controller.getPlaylists();
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: user.photoUrl.isNotEmpty
                    ? NetworkImage(user.photoUrl)
                    : null,
                child: user.photoUrl.isEmpty
                    ? Text(user.name[0].toUpperCase())
                    : null,
              ),
              ButtonBar(
                children: [
                  const SizedBox(width: 4),
                  buttonBarItem(homeController, 'All', 0),
                  buttonBarItem(homeController, 'Music', 1),
                  buttonBarItem(homeController, 'Podcasts', 2),
                ],
              )
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: homeController.tabIndex.value,
            children: [
              HomePageBody(
                music: music,
                user: user,
                recentlyPlayedList: recentlyPlayedList,
                playlists: playlists,
                artists: artists,
              ),
              const MusicPage(),
              const PodcastPage(),
            ],
          ),
        ),
      ),
    );
  }

  Obx buttonBarItem(HomeController homeController, String text, int index) {
    return Obx(
      () => TextButton(
        onPressed: () {
          homeController.changeTabIndex(index);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            homeController.tabIndex.value == index
                ? const Color(0x001db954).withOpacity(1)
                : const Color(0x00535353).withOpacity(0.4),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: homeController.tabIndex.value == index
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  final List playlists;
  final List artists;
  final List recentlyPlayedList;
  final List<MusicModel> music;
  final UserModel user;
  const HomePageBody(
      {super.key,
      required this.music,
      required this.user,
      required this.playlists,
      required this.artists,
      required this.recentlyPlayedList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FavoritePlaylist(playlists: playlists),
          PopularArtists(artists: artists),
          MusicRowWidget(heading: 'Popular albums', music: music, fromIndex: 0),
          RecentlyPlayedList(recentlyPlayedList: recentlyPlayedList),
          MusicRowWidget(
              heading: 'Made for ${user.name}', music: music, fromIndex: 0),
          MusicRowWidget(heading: 'Popular radio', music: music, fromIndex: 0),
          const PodcastList()
        ],
      ),
    );
  }
}
