import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/podcast_controller.dart';
import 'package:mobile_project/app/ui/screens/podcast/widgets/episode_card.dart';

class PodcastDetail extends StatefulWidget {
  const PodcastDetail({super.key});

  @override
  State<PodcastDetail> createState() => _PodcastDetailState();
}

class _PodcastDetailState extends State<PodcastDetail> {
  final PodcastController podcastController =
      Get.put(PodcastController(), permanent: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0x00895EA5).withOpacity(1),
              const Color(0x007E5895).withOpacity(1),
              const Color(0x00212121).withOpacity(1),
              const Color(0x00212121).withOpacity(1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.3, 0.4, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Get.offAllNamed('/', arguments: {'tabIndex': 2});
                  },
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 125,
                      height: 125,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trash Taste Podcast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Trash Taste Podcast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '4.9 (37.3k) · ${tr("entertainment")}',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                _buildActionBar(),
                const SizedBox(height: 16),
                ButtonBar(
                  buttonPadding: const EdgeInsets.only(left: 0),
                  alignment: MainAxisAlignment.start,
                  children: [
                    _buildButtonItem(text: 'episodes', index: 0),
                    const SizedBox(width: 24),
                    _buildButtonItem(text: 'about', index: 1),
                    const SizedBox(width: 24),
                    _buildButtonItem(text: 'more_like', index: 2),
                  ],
                ),
                const SizedBox(height: 16),
                Obx(
                  () => IndexedStack(
                    index: podcastController.tabIndex.value,
                    children: [
                      _buildEpisodesList(),
                      _buildAboutSection(),
                      _buildMoreSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Obx _buildButtonItem({required String text, required int index}) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          podcastController.changeTabIndex(index);
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: podcastController.tabIndex.value == index
                    ? const Color(0x001db954).withOpacity(1)
                    : Colors.transparent,
                width: 4,
              ),
            ),
          ),
          child: Text(
            tr(text),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Column _buildEpisodesList() {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.repeat),
            const SizedBox(width: 8),
            Text(
              '${tr('all_episodes')} · ${tr('newest')}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const EpisodeCard(),
        const EpisodeCard(),
        const EpisodeCard(),
      ],
    );
  }

  Column _buildMoreSection() {
    return Column(
      children: [
        _buildMoreCard(),
        _buildMoreCard(),
        _buildMoreCard(),
      ],
    );
  }

  Container _buildMoreCard() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, top: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0x00535353).withOpacity(0.8),
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
                  'https://yt3.googleusercontent.com/UggvUqpjFEtw_VeKToWlcDilCxaWS0L5VKdvsnuIJuK4OoxOHUZvUOlqNhmyQQoVNyWpsZlS=s900-c-k-c0x00ffffff-no-rj',
                  width: 90,
                  height: 90,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'OfflineTV Podcast',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${tr('podcasts')} · OfflineTV ',
                    style: TextStyle(
                        color: const Color(0x00b3b3b3).withOpacity(1)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Official OfflineTV Podcast',
            style: TextStyle(color: const Color(0x00b3b3b3).withOpacity(0.8)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.e_mobiledata),
              Flexible(
                child: Text(
                    '${tr("arts_entertainment")} · ${tr("entertainment")}t · ${tr('games')} · ${tr('video_games')}'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
                backgroundColor: WidgetStatePropertyAll(
                    const Color(0x00535353).withOpacity(0.4)),
              ),
              child: const Row(
                children: [
                  Text(
                    '4.9',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.star_outline,
                    color: Colors.white,
                  ),
                  Text(
                    '(37.3k)',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text('·', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            TextButton(
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
                backgroundColor: WidgetStatePropertyAll(
                    const Color(0x00535353).withOpacity(0.4)),
              ),
              onPressed: () {},
              child: Text(
                tr('entertainment'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
            'Trash Taste is the premiere anime podcast exploring anime, manga, and otaku culture with top anime Youtubers: Joey from The Anime Man, Garnt from Gigguk, and Connor from Cdawgva, and occasionally special guests.\n\nFor advertising opportunities please\nemail:PodcastPartnerships@Studio71us.com\n\nWe wanna make the podcast even better, help us learn how we can: https://bit.ly/2EcYbu4\n\nPrivacy Policy:https://www.studio71.com/us/terms-and-conditions-use/#Privacy%20Policy'),
        const SizedBox(height: 24),
        Text(
          tr('best_start'),
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 16),
        const EpisodeWithBgCard(),
      ],
    );
  }

  Row _buildActionBar() {
    return Row(
      children: [
        Container(
          width: 35,
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside),
              left: BorderSide(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside),
              right: BorderSide(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside),
              bottom: BorderSide(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Image.network(
            'https://preview.redd.it/can-we-all-do-the-trash-taste-logo-on-r-place-v0-45x4xnymb5db1.jpg?width=1080&crop=smart&auto=webp&s=8ffbe73bc7f4f5b8302b9e72a07418e36e6870bf',
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 24),
        OutlinedButton(
          onPressed: () {},
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          )),
          child: Text(
            tr('following'),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30,
        ),
      ],
    );
  }
}
