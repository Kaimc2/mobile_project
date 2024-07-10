import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/music_page_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/ui/screens/music/widgets/row.dart';

class MusicDetail extends StatelessWidget {
  const MusicDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MusicModel> music = MusicPageController().getMusic();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(
            top: 48,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0x00b3b3b3).withOpacity(0.8),
                const Color(0x00535353).withOpacity(0.3),
                const Color(0x00121212).withOpacity(0.8),
                const Color(0x00121212).withOpacity(0.8),
                const Color(0x00121212).withOpacity(0.8),
                const Color(0x00121212).withOpacity(0.8),
                const Color(0x00121212).withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -10,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        Get.offAllNamed('/', arguments: {'tabIndex': 1});
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: Image.network(
                        'https://hololive.hololivepro.com/wp-content/uploads/2021/08/ina_violet_jk-e1661929568573.png',
                        width: 270,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'VIOLET',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                      'https://linkstorage.linkfire.com/medialinks/images/9a69880e-286f-4b9e-b454-7d0734acfc03/artwork-440x440.jpg',
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('Ninomae Ina\'nis'),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Single · 2021',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 12),
              buildActionBar(),
              buildInfo(
                title: 'Featuring',
                content:
                    'VIOLET - Twilight ver. · りゅーーっときてきゅーーっ!!! · Kanalumi · and more',
              ),
              buildInfo(
                title: 'We added',
                content:
                    'マリン出航!! · Sparks of Joy · Daydream · A New Start · 毒杯スワロウ',
              ),
              const SizedBox(height: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('6 August 2021'),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          'https://linkstorage.linkfire.com/medialinks/images/9a69880e-286f-4b9e-b454-7d0734acfc03/artwork-440x440.jpg',
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Ninomae Ina\'nis'),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
              buildConcertCard(),
              const SizedBox(height: 40),
              MusicRow(heading: 'More by Ninomae Ina\'nis', music: music),
              const SizedBox(height: 20),
              MusicRow(heading: 'You might also like', music: music),
            ],
          ),
        ),
      ),
    );
  }

  Row buildActionBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                'https://hololive.hololivepro.com/wp-content/uploads/2021/08/ina_violet_jk-e1661929568573.png',
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline_outlined,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_circle_down_outlined,
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
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shuffle,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_fill,
                size: 50,
                color: const Color(0x001db954).withOpacity(1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildInfo({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 28),
        Text(title),
        const SizedBox(height: 16),
        Text(
          content,
          style: TextStyle(
            color: const Color(0x00b3b3b3).withOpacity(1),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Column buildConcertCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Concerts',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.maxFinite,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color(0x00535353).withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Image.network(
                'https://linkstorage.linkfire.com/medialinks/images/9a69880e-286f-4b9e-b454-7d0734acfc03/artwork-440x440.jpg',
                fit: BoxFit.fill,
                width: 80,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On tour',
                    style: TextStyle(
                      color: const Color(0x00b3b3b3).withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Ninomae Ina\'nis'),
                  const SizedBox(height: 4),
                  Text(
                    'See all events',
                    style: TextStyle(
                      color: const Color(0x00b3b3b3).withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
