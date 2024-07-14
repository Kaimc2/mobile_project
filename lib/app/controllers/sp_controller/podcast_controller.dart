import 'dart:math';

import 'package:get/get.dart';
import 'package:mobile_project/app/data/models/sp_model/podcast_model.dart';

class PodcastController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  List<PodcastModel> getPodcast() {
    return [
      PodcastModel(
        id: '1',
        title: 'We FORCED The Boys To Watch This | Trash Taste #210',
        podcastName: 'Trash Taste Podcast',
        imagePath:
            'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
        description:
            'In this hilarious episode of Trash Taste, we compelled the boys to sit through an outrageous show that left them in stitches. Watch as they react to unexpected twists and absurd moments. Their commentary is priceless and their disbelief is palpable. Don\'t miss their unforgettable experience in episode #210!',
        releaseDate: 'Jul 1',
        duration: 10680,
      ),
      PodcastModel(
        id: '2',
        title: 'THE TRASH TASTE TOURNAMENT ARC | Trash Taste #211',
        podcastName: 'Trash Taste Podcast',
        imagePath:
            'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
        description:
            'In this hilarious episode of Trash Taste, we compelled the boys to sit through an outrageous show that left them in stitches. Watch as they react to unexpected twists and absurd moments. Their commentary is priceless and their disbelief is palpable. Don\'t miss their unforgettable experience in episode #210!',
        releaseDate: 'Sat',
        duration: 10680,
      ),
    ];
  }

  List<PodcastModel> generateContents(int amounts) {
    List<PodcastModel> podcastContents = [];

    for (var i = 0; i < amounts; i++) {
      podcastContents.add(getPodcast()[Random().nextInt(getPodcast().length)]);
    }

    return podcastContents;
  }
}
