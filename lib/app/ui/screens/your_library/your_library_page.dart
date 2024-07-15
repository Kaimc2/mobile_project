import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/your_library_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
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
          yourLibraryController.yourLibraryDatas, yourLibraryController),
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
                title: const Text(
                  'Your Library',
                  style: TextStyle(
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
    return const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/stella.jpg'),
        radius: 20,
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
          onPressed: () {},
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
            SpChip(
              label: 'Playlists',
              backgroundColor: const Color(0xFF535353).withOpacity(0.4),
            ),
            const SizedBox(width: 8.0),
            SpChip(
              label: 'Artists',
              backgroundColor: const Color(0xFF535353).withOpacity(0.4),
            ),
            const SizedBox(width: 8.0),
            SpChip(
              label: 'Albums',
              backgroundColor: const Color(0xFF535353).withOpacity(0.4),
            ),
            const SizedBox(width: 8.0),
            SpChip(
              label: 'Podcasts',
              backgroundColor: const Color(0xFF535353).withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
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
      itemCount: musicList.length,
      itemBuilder: (context, index) {
        return _buildAnimatedGridItem(context, index, musicList);
      },
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
        children: List.generate(
          musicList.length,
          (index) => PlaylistTile(
            imageUrl: musicList[index].imageUrl,
            title: musicList[index].name,
            musicType: musicList[index].type ?? '',
            authorName: musicList[index].author ?? '',
          ),
        ),
      ),
    );
  }
}
