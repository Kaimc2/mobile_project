import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PlaylistCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(4), // Smaller value for less roundness
      ),
      child: IntrinsicHeight(
        // Ensures the row's height matches the tallest widget
        child: Row(
          children: [
            AspectRatio(
              // Makes the image square
              aspectRatio: 1 / 1, // Aspect ratio of 1:1 for a square
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              // Allows text to fill the remaining space
              child: Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
