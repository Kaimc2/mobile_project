import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SortOptions { recents, recentlyAdded, alphabetical, creator }

class YourLibraryController extends GetxController {
  RxList<MusicModel> yourLibraryDatas = <MusicModel>[].obs;
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  Rx<SortOptions> selectedSortOption = SortOptions.recents.obs;

  List<MusicModel> getYourLibraryDatas() {
    return [
      MusicModel(
        id: '1',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/6/61/Kendrick_Lamar_-_Not_Like_Us.png',
        name: 'Not like us',
        type: 'Playlists',
        author: 'Kendrick Lamar',
      ),
      MusicModel(
        id: '2',
        imageUrl:
            'https://media.pitchfork.com/photos/659d9b69c6f7f7f715b07416/master/pass/21-Savage-American-Dream.jpg',
        name: 'Alot',
        type: 'Playlists',
        author: '21 Savage',
      ),
      MusicModel(
        id: '3',
        imageUrl:
            'https://i.scdn.co/image/ab67616d0000b273c91ffc9b512057a66087b98e',
        name: 'Skull 2',
        type: 'Playlists',
        author: 'Mann Vanda',
      ),
    ];
  }

  RxBool isGridView = true.obs;
  ValueNotifier<bool> isGridViewNotifier = ValueNotifier<bool>(true);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
    _getViewModeStatus();
    yourLibraryDatas.value = getYourLibraryDatas();
  }

  _saveViewModeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('viewMode', isGridViewNotifier.value);
  }

  _getViewModeStatus() async {
    var isGrid = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('viewMode') ?? true;
    }).obs;
    isGridViewNotifier.value = await isGrid.value;
  }

  void toggleViewMode() {
    isGridViewNotifier.value = !isGridViewNotifier.value;
    _saveViewModeStatus();
  }

  void sortLibrary(SortOptions sortOption) {
    selectedSortOption.value = sortOption;
    List<MusicModel> sortedList = List.from(yourLibraryDatas);

    switch (sortOption) {
      case SortOptions.recents:
        // Assuming the list is already sorted by recents initially
        break;
      case SortOptions.recentlyAdded:
        // Add your logic for recently added sorting if applicable
        // Example: sortedList.sort((a, b) => a.addedDate.compareTo(b.addedDate));
        break;
      case SortOptions.alphabetical:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOptions.creator:
        sortedList.sort((a, b) => a.author!.compareTo(b.author!));
        break;
    }

    yourLibraryDatas.assignAll(sortedList);
  }

  void openRecentSortBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sort by',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() =>
                      _buildSortOptionTile(SortOptions.recents, 'Recents')),
                  Obx(() => _buildSortOptionTile(
                      SortOptions.alphabetical, 'Alphabetical')),
                  Obx(() =>
                      _buildSortOptionTile(SortOptions.creator, 'Creator')),
                  const SizedBox(height: 32),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildSortOptionTile(SortOptions option, String title) {
    final bool isSelected = selectedSortOption.value == option;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        sortLibrary(option);
        Get.back();
      },
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF1DB954) : Colors.white,
          fontSize: 18.0,
        ),
      ),
      trailing:
          isSelected ? const Icon(Icons.check, color: Colors.green) : null,
    );
  }
}
