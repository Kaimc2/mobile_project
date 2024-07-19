import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/user_controller.dart';
import 'package:mobile_project/app/controllers/sp_controller/your_library_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/liked_songs/liked_songs_page.dart';
import 'package:mobile_project/app/ui/screens/your_library/local_widgets/custom_search_delegate.dart';
import 'package:mobile_project/app/ui/screens/your_library/local_widgets/playlist_card.dart';
import 'package:mobile_project/app/ui/screens/your_library/local_widgets/playlist_tile.dart';
import 'package:mobile_project/app/ui/screens/your_library/local_widgets/sp_chip.dart';
import 'package:mobile_project/app/ui/screens/your_library/local_widgets/your_library_utils.dart';

class YourLibraryPage extends StatefulWidget {
  const YourLibraryPage({super.key});

  @override
  YourLibraryPageState createState() => YourLibraryPageState();
}

class YourLibraryPageState extends State<YourLibraryPage>
    with TickerProviderStateMixin {
  final YourLibraryController yourLibraryController =
      Get.put(YourLibraryController());
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final RxString selectedChip = ''.obs; // Add selected chip state

  @override
  void initState() {
    super.initState();
    yourLibraryController.yourLibraryDatas.value =
        yourLibraryController.getYourLibraryDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildAppBar(context, yourLibraryController),
      body: buildBody(
        yourLibraryController.yourLibraryDatas,
        yourLibraryController,
      ),
    );
  }

  PreferredSizeWidget buildAppBar(
    BuildContext context,
    YourLibraryController yourLibraryController,
  ) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 70.0),
      child: Container(
        color: const Color(0xFF212121),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                forceMaterialTransparency: true,
                backgroundColor: Colors.transparent,
                centerTitle: false,
                title: Text(
                  tr('title.your_library'),
                  style: const TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                leading: buildUserIcon(),
                actions: [
                  buildActionButtons(context, yourLibraryController),
                ],
              ),
              buildAppBarFlexibleSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserIcon() {
    final UserModel user = UserController().user.value;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(
        radius: 20,
        backgroundImage:
            user.photoUrl.isNotEmpty ? NetworkImage(user.photoUrl) : null,
        child: user.photoUrl.isEmpty ? Text(user.name[0].toUpperCase()) : null,
      ),
    );
  }

  Widget buildActionButtons(
      BuildContext context, YourLibraryController yourLibraryController) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 38.0,
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        IconButton(
          iconSize: 38.0,
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.playlist_add, color: Colors.white),
                        title: Text(tr('bottomsheet.build_playlists'),
                            style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          // Handle build playlist action
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.merge_type, color: Colors.white),
                        title: Text(tr('bottomsheet.blend'),
                            style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          // Handle blend action
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildAppBarFlexibleSpace() {
    return Container(
      color: const Color(0xFF212121), // Ensure solid background color
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildChip(tr('title.playlists')),
            const SizedBox(width: 8.0),
            buildChip(tr('title.artists')),
            const SizedBox(width: 8.0),
            buildChip(tr('title.albums')),
            const SizedBox(width: 8.0),
            buildChip(tr('title.podcasts')),
          ],
        ),
      ),
    );
  }

  Widget buildChip(String label) {
    return Obx(() {
      final isSelected = selectedChip.value == label;
      return SpChip(
        label: label,
        backgroundColor: isSelected
            ? Colors.green
            : const Color(0xFF535353).withOpacity(0.4),
        // onTap: () {
        //   selectedChip.value = label;
        // },
      );
    });
  }

  Widget buildBody(
    List<MusicModel> musicList,
    YourLibraryController yourLibraryController,
  ) {
    return ListView(
      children: [
        Container(
          color: const Color(0xFF121212),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: YourLibraryUtils(
              controller: yourLibraryController,
            ),
          ),
        ),
        Obx(
          () => yourLibraryController.isGridView.value
              ? buildPlaylistGridView(yourLibraryController.yourLibraryDatas)
              : buildPlaylistListView(yourLibraryController.yourLibraryDatas),
        ),
      ],
    );
  }

  Widget buildLikedSongsTile() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 72, 33, 243), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
      title: const Text('Liked Songs', style: TextStyle(color: Colors.white)),
      subtitle: const Text('6 songs', style: TextStyle(color: Colors.white70)),
      onTap: () {
        Get.to(() => const LikedSongsPage());
      },
    );
  }

  Widget buildPlaylistGridView(List<MusicModel> musicList) {
    return GridView.builder(
      key: _listKey, // Assign key to the grid
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.9,
      ),
      itemCount: musicList.length + 1, // +1 for the Liked Songs tile
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildLikedSongsGridItem();
        }
        return _buildAnimatedGridItem(
            context, index - 1, musicList); // Adjust index
      },
    );
  }

  Widget _buildLikedSongsGridItem() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const LikedSongsPage());
      },
      child: Card(
        color: const Color(0xFF121212),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 72, 33, 243), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Icon(Icons.favorite, color: Colors.white, size: 50),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Liked Songs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Playlist - 6 songs',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedGridItem(
      BuildContext context, int index, List<MusicModel> musicList) {
    return FadeTransition(
      opacity: const AlwaysStoppedAnimation(1),
      child: PlaylistCard(
        imageUrl: musicList[index].imageUrl,
        title: musicList[index].name,
        musicType: musicList[index].type ?? '',
        authorName: musicList[index].author ?? '',
      ),
    );
  }

  Widget buildPlaylistListView(List<MusicModel> musicList) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildLikedSongsTile(),
          ...List.generate(
            musicList.length,
            (index) => PlaylistTile(
              imageUrl: musicList[index].imageUrl,
              title: musicList[index].name,
              musicType: musicList[index].type ?? '',
              authorName: musicList[index].author ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
