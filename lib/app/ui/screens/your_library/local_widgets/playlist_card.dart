import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
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
    return Card(
      color: const Color(0xFF121212),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '$musicType - $authorName',
            ),
          ),
        ],
      ),
    );
  }
}
