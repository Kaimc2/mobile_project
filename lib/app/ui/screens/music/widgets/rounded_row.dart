import 'package:flutter/material.dart';

class MusicRoundedRow extends StatelessWidget {
  final String heading;

  const MusicRoundedRow({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildArtist(
                    'https://viberatecdn.blob.core.windows.net/entity/artist/tena-khimphun-xPHrh',
                    'Tena'),
                const SizedBox(width: 12),
                _buildArtist(
                    'https://viberatecdn.blob.core.windows.net/entity/artist/tena-khimphun-xPHrh',
                    'Tena'),
                const SizedBox(width: 12),
                _buildArtist(
                    'https://viberatecdn.blob.core.windows.net/entity/artist/tena-khimphun-xPHrh',
                    'Tena'),
                const SizedBox(width: 12),
                _buildArtist(
                    'https://viberatecdn.blob.core.windows.net/entity/artist/tena-khimphun-xPHrh',
                    'Tena'),
                const SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildArtist(String imagePath, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 85,
          backgroundImage: NetworkImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(name)
      ],
    );
  }
}
