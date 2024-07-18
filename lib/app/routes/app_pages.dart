import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobile_project/app/bindings/about_us_binding.dart';
import 'package:mobile_project/app/bindings/account_binding.dart';
import 'package:mobile_project/app/bindings/home_binding.dart';
import 'package:mobile_project/app/bindings/languages_binding.dart';
import 'package:mobile_project/app/bindings/search_binding.dart';
import 'package:mobile_project/app/bindings/settings_binding.dart';
import 'package:mobile_project/app/bindings/your_library_binding.dart';
import 'package:mobile_project/app/ui/screens/about_us/about_us_page.dart';
import 'package:mobile_project/app/ui/screens/account/account_page.dart';
import 'package:mobile_project/app/ui/screens/home/home_page.dart';
import 'package:mobile_project/app/ui/screens/landing/landing_page.dart';
import 'package:mobile_project/app/ui/screens/languages/languages_page.dart';
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
          GetPage(
            name: '/account',
            page: () => const AccountPage(),
            binding: AccountBinding(),
          ),
          GetPage(
            name: '/about-us',
            page: () => const AboutUsPage(),
            binding: AboutUsBinding(),
          ),
          GetPage(
            name: '/languages',
            page: () => const LanguagesPage(),
            binding: LanguagesBinding(),
          ),
        ],
      ),
    ];
  }
}
