import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/artist_model.dart';

class MusicRoundedRow extends StatelessWidget {
  final String heading;

  const MusicRoundedRow({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    final List<ArtistModel> artists = HomeController().getArtists();

    return Padding(
      padding: const EdgeInsets.only(left: 14.0, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr(heading),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: artists.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _buildArtist(
                    imagePath: artists[index].imageUrl,
                    name: artists[index].name,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildArtist({required String imagePath, required String name}) {
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
