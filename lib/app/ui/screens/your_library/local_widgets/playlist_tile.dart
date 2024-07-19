import 'package:flutter/material.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.musicType,
    required this.authorName,
  });

  final String imageUrl;
  final String title;
  final String musicType;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        debugPrint('tile tapped');
      },
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 50,
        height: 50,
        child: ClipRRect(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text(
        '$musicType - $authorName',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
