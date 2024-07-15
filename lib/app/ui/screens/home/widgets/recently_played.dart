import 'package:flutter/material.dart';

class RecentlyPlayed extends StatelessWidget {
  final String name;
  final String imageUrl;

  const RecentlyPlayed({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            imageUrl,
            width: 120, // Specify the width for the image
            height: 120, // Specify the height for the image
            fit: BoxFit.cover, // Cover the entire widget area
          ),
          const SizedBox(
              height: 10), // Add some space between the image and the name
          Text(name,
              style:
                  const TextStyle(fontSize: 17)), // Display the artist's name
        ],
      ),
    );
  }
}
