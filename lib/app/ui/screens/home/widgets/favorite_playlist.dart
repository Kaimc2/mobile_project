import 'package:flutter/material.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/playlist_card.dart';

class FavoritePlaylist extends StatelessWidget {
  const FavoritePlaylist({
    super.key,
    required this.playlists,
  });

  final List playlists;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true, // Needed to use GridView inside SingleChildScrollView
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
    );
  }
}
