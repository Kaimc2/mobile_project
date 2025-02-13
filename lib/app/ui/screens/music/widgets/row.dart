import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/ui/screens/music/music_detail.dart';

class MusicRowWidget extends StatelessWidget {
  final String heading;
  final List<MusicModel> music;
  final int fromIndex;
  final bool split;

  const MusicRowWidget({
    super.key,
    required this.heading,
    required this.music,
    required this.fromIndex,
    this.split = false,
  });

  @override
  Widget build(BuildContext context) {
    var name = '';
    var leading = '';

    if (split) {
      var splitText = heading.split(" ");
      leading = splitText[0];
      name = splitText[1];
    }

    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            split ? '${tr(leading)} $name' : tr(heading),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: music.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _buildAlbum(
                    imagePath: music[index].imageUrl,
                    name: music[index].name,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAlbum({
    required String imagePath,
    required String name,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MusicDetail(tabIndex: fromIndex));
      },
      child: Column(
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
          ),
        ],
      ),
    );
  }
}
