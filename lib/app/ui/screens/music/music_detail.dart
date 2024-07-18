import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/music_page_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/ui/screens/music/row.dart';

class MusicDetail extends StatefulWidget {
  final int tabIndex;

  const MusicDetail({super.key, required this.tabIndex});

  @override
  State<MusicDetail> createState() => _MusicDetailState();
}

class _MusicDetailState extends State<MusicDetail> {
  final ScrollController _scrollController = ScrollController();
  final List<MusicModel> music = MusicPageController().getMusic();
  bool _isAppBarCollapsed = false;
  late int fromIndex;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarCollapsed = _scrollController.hasClients &&
            _scrollController.offset > (310 - kToolbarHeight);
      });
    });
    fromIndex = widget.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0x00b3b3b3).withOpacity(0.6),
              const Color(0x00535353).withOpacity(0.7),
              const Color(0x00121212).withOpacity(0.8),
              const Color(0x00121212).withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.2, 1.0, 1.0],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: _isAppBarCollapsed
                  ? const Color(0x002A2929).withOpacity(1)
                  : Colors.transparent,
              surfaceTintColor: Colors.transparent,
              pinned: true,
              leading: IconButton(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Get.offAllNamed('/', arguments: {'tabIndex': fromIndex});
                },
                icon: const Icon(
                  Icons.chevron_left_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              expandedHeight: 310,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double height = constraints.biggest.height;
                  final double percentage = (height - kToolbarHeight) / 310;

                  return FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(
                      top: percentage > 0.5 ? 110.0 : 20.0,
                      left: 20.0,
                      right: 20.0,
                      bottom: percentage > 0.5 ? 20.0 : 20.0,
                    ),
                    centerTitle: true,
                    title: percentage > 0.5
                        ? Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: percentage,
                              child: Image.network(
                                'https://hololive.hololivepro.com/wp-content/uploads/2021/08/ina_violet_jk-e1661929568573.png',
                                width: 270,
                              ),
                            ),
                          )
                        : const Text(
                            'VIOLET',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                  );
                },
              ),
            ),

            // Actual details
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 16,
                  right: 16,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      title: 'featuring',
                      content:
                          'VIOLET - Twilight ver. · りゅーーっときてきゅーーっ!!! · Kanalumi · and more',
                    ),
                    buildInfo(
                      title: 'we_added',
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
                    MusicRow(
                        heading: 'more_by',
                        artist: 'Ninomae Ina\'nis',
                        music: music,
                        fromIndex: 1),
                    const SizedBox(height: 20),
                    MusicRow(heading: 'also_like', music: music, fromIndex: 1),
                  ],
                ),
              ),
            ),
          ],
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
        Text(tr(title)),
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
        Text(
          tr('concerts'),
          style: const TextStyle(
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
                    tr('on_tour'),
                    style: TextStyle(
                      color: const Color(0x00b3b3b3).withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Ninomae Ina\'nis'),
                  const SizedBox(height: 4),
                  Text(
                    tr('see_all_events'),
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
