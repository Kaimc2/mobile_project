import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final String imageUrl;

  const Profile({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 150, // Specify the width for the image
            height: 150, // Specify the height for the image
            fit: BoxFit.cover, // Cover the entire widget area
          ),
        ),
        const SizedBox(
            height: 10), // Add some space between the image and the name
        Text(name,
            style: const TextStyle(fontSize: 18)), // Display the artist's name
      ],
    );
  }
}
