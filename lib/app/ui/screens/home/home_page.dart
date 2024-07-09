import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/music/music_page.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/playlist_card.dart';
import 'package:mobile_project/app/ui/screens/podcast/podcast_page.dart';
import 'package:mobile_project/app/data/models/sp_model/playlist_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PlaylistModel> playlists = controller.getPlaylists();
    final UserModel user = controller.getUser();
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
                playlists: playlists,
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
          backgroundColor: MaterialStatePropertyAll(
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
  const HomePageBody({super.key, required this.playlists});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap:
                true, // Needed to use GridView inside SingleChildScrollView
            physics:
                const NeverScrollableScrollPhysics(), // To prevent grid view from scrolling
            itemCount: playlists.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 2, // Horizontal space between cards
              mainAxisSpacing: 2, // Vertical space between cards
              childAspectRatio:
                  2.9, // Adjust this value to change the card aspect ratio
            ),
            itemBuilder: (context, index) {
              var playlist = playlists[index];
              return PlaylistCard(
                imageUrl: playlist.imageUrl,
                name: playlist.name,
              );
            },
          ),
        ],
      ),
    );
  }
}
