import 'package:flutter/material.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/artist.dart';

class PopularArtists extends StatelessWidget {
  const PopularArtists({
    super.key,
    required this.artists,
  });

  final List artists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Popular artists",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 202,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              scrollDirection:
                  Axis.horizontal, // Set scroll direction to horizontal
              itemCount: artists.length, // Use artists list
              itemBuilder: (context, index) {
                var artist = artists[index]; // Use artist data
                return Container(
                  margin: const EdgeInsets.only(
                      right: 20), // Add space between items
                  child: Artist(
                    imageUrl: artist.imageUrl,
                    name: artist.name,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
