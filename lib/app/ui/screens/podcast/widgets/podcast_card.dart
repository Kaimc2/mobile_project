import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/ui/screens/podcast/podcast_detail.dart';

class PodcastCard extends StatelessWidget {
  final String id;
  final String imagePath;
  final String title;
  final String podcastName;
  final String releaseDate;
  final int duration;
  final String description;
  final String? preview;

  const PodcastCard({
    super.key,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.podcastName,
    required this.releaseDate,
    required this.duration,
    this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const PodcastDetail());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
        child: Container(
          width: 400,
          height: 475,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0x0034353A).withOpacity(1),
                const Color(0x0034353A).withOpacity(0.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 4,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                const SizedBox(height: 20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imagePath,
                      width: 175,
                      height: 175,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: RichText(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: const TextStyle(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: '$releaseDate · ${formatDuration(duration)} · ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: description,
                          style: TextStyle(
                            color: const Color(0x00b3b3b3).withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${tr('episodes')} · $podcastName',
                style: TextStyle(
                  color: const Color(0x00b3b3b3).withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_circle_outline,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                EdgeInsets.all(18),
              ),
              backgroundColor: WidgetStatePropertyAll(
                Colors.black.withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.preview,
                  color: const Color(0x00b3b3b3).withOpacity(0.8),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    preview ?? tr('preview_episode'),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      color: const Color(0x00b3b3b3).withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: 28,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_fill,
                size: 56,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String formatDuration(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;

    String hoursStr = '$hours hr${hours != 1 ? 's' : ''}';
    String minutesStr = '$minutes min${minutes != 1 ? 's' : ''}';

    return '$hoursStr $minutesStr';
  }
}
