import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0x00535353).withOpacity(1),
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
                  width: 55,
                  height: 55,
                ),
              ),
              const SizedBox(width: 16),
              const Flexible(
                child: Text(
                  'THE TRASH TASTE TOURNAMENT ARC | Trash Taste #211',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Elevate your spontaneous activities with Vessi\'s Stormburst Low Top for versatility. Discover more at https://vessi.com/trashtaste',
            style: TextStyle(color: const Color(0x00b3b3b3).withOpacity(0.8)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Sat · 2hrs, 4 min left'),
              const SizedBox(width: 8),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0x00535353).withOpacity(1),
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0x001db954).withOpacity(1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download_for_offline_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.ios_share_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 30,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EpisodeWithBgCard extends StatelessWidget {
  const EpisodeWithBgCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0x00535353).withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
                  width: 55,
                  height: 55,
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Episode',
                      style: TextStyle(
                          fontSize: 14,
                          color: const Color(0x00b3b3b3).withOpacity(0.8)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'THE TRASH TASTE TOURNAMENT ARC | Trash Taste #211',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Elevate your spontaneous activities with Vessi\'s Stormburst Low Top for versatility. Discover more at https://vessi.com/trashtaste',
            style: TextStyle(color: const Color(0x00b3b3b3).withOpacity(0.8)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Sat · 2hrs, 4 min left'),
              const SizedBox(width: 8),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0x00535353).withOpacity(1),
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0x001db954).withOpacity(1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download_for_offline_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.ios_share_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 30,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
