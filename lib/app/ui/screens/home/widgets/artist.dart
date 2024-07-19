import 'package:flutter/material.dart';

class Artist extends StatelessWidget {
  final String name;
  final String imageUrl;

  const Artist({
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
            child: imageUrl.endsWith('.jpg')
                ? Image.asset(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover, // Cover the entire widget area
                  )
                : Image.network(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover, // Cover the entire widget area
                  )),
        const SizedBox(height: 10),
        Text(name,
            style: const TextStyle(fontSize: 18)), // Display the artist's name
      ],
    );
  }
}
