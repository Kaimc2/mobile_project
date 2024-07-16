import 'package:flutter/material.dart';
import 'package:mobile_project/app/controllers/sp_controller/podcast_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/podcast_model.dart';
import 'package:mobile_project/app/ui/screens/podcast/widgets/podcast_card.dart';

class PodcastList extends StatelessWidget {
  const PodcastList({super.key});

  @override
  Widget build(BuildContext context) {
    List<PodcastModel> podcastContents =
        PodcastController().generateContents(3);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var content in podcastContents)
              PodcastCard(
                id: content.id,
                imagePath: content.imagePath,
                title: content.title,
                description: content.description,
                podcastName: content.podcastName,
                releaseDate: content.releaseDate,
                duration: content.duration,
              ),
          ],
        ),
      ),
    );
  }
}
