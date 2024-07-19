import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/liked_songs_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/ui/screens/music/music_detail.dart';

class LikedSongsPage extends StatefulWidget {
  final String? imageUrl;
  final String? title;

  const LikedSongsPage({
    super.key,
    this.imageUrl,
    this.title,
  });

  @override
  State<LikedSongsPage> createState() => _LikedSongsPageState();
}

class _LikedSongsPageState extends State<LikedSongsPage> {
  final ScrollController _scrollController = ScrollController();
  final List<MusicModel> musics = LikedSongsController().getMusic();
  bool _isAppBarCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarCollapsed = _scrollController.hasClients &&
            _scrollController.offset > (60 - kToolbarHeight);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E3238),
              Color(0xFF181818),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildSliverAppBar(),
            _buildSearchAndSortBar(),
            _buildLikedSongsHeader(musics),
            _buildSongsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: const Text('Liked Songs'),
      backgroundColor:
          _isAppBarCollapsed ? const Color(0xFF181818) : Colors.transparent,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      leading: IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.chevron_left_outlined,
          color: Colors.white,
          size: 35,
        ),
      ),
      expandedHeight: kToolbarHeight,
    );
  }

  Widget _buildSearchAndSortBar() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  hintText: 'Find in liked songs',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                // Handle sort action
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text(
                'Sort',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikedSongsHeader(List<MusicModel> musics) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Liked Songs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${musics.length} songs',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.shuffle, color: Colors.green, size: 32),
                  onPressed: () {
                    // Handle shuffle play
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.pause_circle_filled,
                      color: Colors.green, size: 32),
                  onPressed: () {
                    // Handle play/pause
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white.withOpacity(0.1),
              child: ListTile(
                leading: const Icon(Icons.add, color: Colors.white),
                title: const Text('Add songs',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle add songs action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSongsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final song = musics[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.network(song.imageUrl,
                  width: 50, height: 50, fit: BoxFit.cover),
              title:
                  Text(song.name, style: const TextStyle(color: Colors.white)),
              subtitle: Text(song.author ?? 'N/A',
                  style: const TextStyle(color: Colors.white60)),
              trailing: const Icon(Icons.more_vert, color: Colors.white),
              onTap: () {
                Get.to(() => MusicDetail());
              },
            ),
          );
        },
        childCount: musics.length,
      ),
    );
  }
}
