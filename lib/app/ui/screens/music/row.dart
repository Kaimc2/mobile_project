import 'package:flutter/material.dart';

class MusicRow extends StatelessWidget {
  final String heading;

  const MusicRow({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildAlbum(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
                    'hololive IDOL PROJECT, Ninomae Ina\'nis, Mori Calliope'),
                const SizedBox(width: 12),
                _buildAlbum(
                    'https://yt3.googleusercontent.com/VaqxUXZY8JO16FXLu2wVKseh977ylo1hEwwo1qdyjPu1HXAix5CdUhHKmPahn0TQLeKbRvh2KQ=s160-c-k-c0x00ffffff-no-rj',
                    'LiSA'),
                const SizedBox(width: 12),
                _buildAlbum(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
                    'hololive IDOL PROJECT, Ninomae Ina\'nis, Mori Calliope'),
                const SizedBox(width: 12),
                _buildAlbum(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
                    'hololive IDOL PROJECT, Ninomae Ina\'nis, Mori Calliope'),
                const SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAlbum(String imagePath, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              imagePath,
              width: 160,
              height: 165,
              fit: BoxFit.cover,
            )
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 160,
          height: 40,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
