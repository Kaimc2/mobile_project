import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/music/music_page.dart';
import 'package:mobile_project/app/ui/screens/podcast/podcast_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = controller.getUser();
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(user.name),
              ButtonBar(
                children: [
                  const SizedBox(width: 8),
                  buttonBarItem(homeController, 'All', 0),
                  buttonBarItem(homeController, 'Music', 1),
                  buttonBarItem(homeController, 'Podcasts', 2),
                ],
              )
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: homeController.tabIndex.value,
            children: const [
              Placeholder(),
              MusicPage(),
              PodcastPage(),
            ],
          ),
        ),
      ),
    );
  }

  Obx buttonBarItem(HomeController homeController, String text, int index) {
    return Obx(
      () => TextButton(
        onPressed: () {
          homeController.changeTabIndex(index);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            homeController.tabIndex.value == index
                ? const Color(0x001db954).withOpacity(1)
                : const Color(0x00535353).withOpacity(0.4),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: homeController.tabIndex.value == index
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
