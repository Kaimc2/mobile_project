import 'package:flutter/material.dart';
import 'package:mobile_project/app/ui/screens/podcast/podcast_card.dart';

Map<String, dynamic> podcastContent = {
  'imagePath':
      'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
  "title": 'We FORCED The Boys To Watch This | Trash Taste #210',
  "description":
      'In this hilarious episode of Trash Taste, we compelled the boys to sit through an outrageous show that left them in stitches. Watch as they react to unexpected twists and absurd moments. Their commentary is priceless and their disbelief is palpable. Don\'t miss their unforgettable experience in episode #210!',
  "podcastName": 'Trash Taste Podcast',
  "releaseDate": 'Jul 1',
  "duration": 10680,
};
List<Map<String, dynamic>> generateContents(int amounts) {
  List<Map<String, dynamic>> podcastContents = [];

  for (var i = 0; i < amounts; i++) {
    podcastContents.add({
      'imagePath':
          'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
      "title": 'We FORCED The Boys To Watch This | Trash Taste #21$i',
      "description":
          'In this hilarious episode of Trash Taste, we compelled the boys to sit through an outrageous show that left them in stitches. Watch as they react to unexpected twists and absurd moments. Their commentary is priceless and their disbelief is palpable. Don\'t miss their unforgettable experience in episode #210!',
      "podcastName": 'Trash Taste Podcast',
      "releaseDate": 'Jul 1',
      "duration": 10680,
    });
  }

  return podcastContents;
}

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> podcastContents = generateContents(10);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          children: [
            for (var content in podcastContents)
              PodcastCard(
                imagePath: content['imagePath'],
                title: content['title'],
                description: content['description'],
                podcastName: content['podcastName'],
                releaseDate: content['releaseDate'],
                duration: content['duration'],
              ),
          ],
        ),
      ),
    );
  }
}
