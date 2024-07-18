import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/recently_played.dart';

class RecentlyPlayedList extends StatelessWidget {
  final List recentlyPlayedList;

  const RecentlyPlayedList({
    super.key,
    required this.recentlyPlayedList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr("recently_played"),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 202,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
              scrollDirection:
                  Axis.horizontal, // Set scroll direction to horizontal
              itemCount:
                  recentlyPlayedList.length, // Use recentlyPlayedList list
              itemBuilder: (context, index) {
                var artist = recentlyPlayedList[index]; // Use artist data
                return Container(
                  margin: const EdgeInsets.only(
                      right: 20), // Add space between items
                  child: RecentlyPlayed(
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
