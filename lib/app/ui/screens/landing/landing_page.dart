import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/landing_page_controller.dart';
import 'package:mobile_project/app/ui/screens/home/home_page.dart';
import 'package:mobile_project/app/ui/screens/search/search_page.dart';
import 'package:mobile_project/app/ui/screens/settings/settings_page.dart';
import 'package:mobile_project/app/ui/screens/your_library/your_library_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
  );

  final TextStyle selectedLabelStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return Scaffold(
      // extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: landingPageController.tabIndex.value,
          children: const [
            HomePage(),
            SearchPage(),
            YourLibraryPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar:
          buildBottomNavigationBar(context, landingPageController),
    );
  }

  Widget buildBottomNavigationBar(
    BuildContext context,
    LandingPageController landingPageController,
  ) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 42,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF212121).withOpacity(0.5),
                      const Color(0xFF212121),
                    ],
                  ),
                ),
              ),
              BottomNavigationBar(
                iconSize: 30,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: landingPageController.changeTabIndex,
                currentIndex: landingPageController.tabIndex.value,
                backgroundColor:
                    Colors.transparent, // Make background transparent
                unselectedItemColor: Colors.white.withOpacity(0.5),
                selectedItemColor: Colors.white,
                unselectedLabelStyle: unselectedLabelStyle,
                selectedLabelStyle: selectedLabelStyle,
                items: buildBottomNavigationBarItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> buildBottomNavigationBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.search_rounded,
        ),
        label: 'Explore',
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.library_music_rounded,
        ),
        label: 'Your Library',
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings',
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      ),
    ];
  }
}
