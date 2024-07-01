import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobile_project/app/bindings/home_binding.dart';
import 'package:mobile_project/app/bindings/search_binding.dart';
import 'package:mobile_project/app/bindings/settings_binding.dart';
import 'package:mobile_project/app/bindings/your_library_binding.dart';
import 'package:mobile_project/app/ui/screens/home/home_page.dart';
import 'package:mobile_project/app/ui/screens/landing/landing_page.dart';
import 'package:mobile_project/app/ui/screens/search/search_page.dart';
import 'package:mobile_project/app/ui/screens/settings/settings_page.dart';
import 'package:mobile_project/app/ui/screens/your_library/your_library_page.dart';

class AppPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => LandingPage(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: '/home',
            page: () => const HomePage(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: '/search',
            page: () => const SearchPage(),
            binding: SearchBinding(),
          ),
          GetPage(
            name: '/your-library',
            page: () => const YourLibraryPage(),
            binding: YourLibraryBinding(),
          ),
          GetPage(
            name: '/settings',
            page: () => const SettingsPage(),
            binding: SettingsBinding(),
          ),
        ],
      ),
    ];
  }
}
