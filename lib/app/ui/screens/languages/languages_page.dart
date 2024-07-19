import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/languages_controller.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguagesController languagesController =
        Get.put(LanguagesController());
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildAppBar(context),
      body: buildBody(context, languagesController),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF212121),
      title: Text(
        tr('tile.title.languages'),
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildBody(
      BuildContext context, LanguagesController languagesController) {
    return ListView(
      children: [
        buildListTile(
          context,
          languagesController,
          const Locale('en'),
          'English',
        ),
        buildListTile(
          context,
          languagesController,
          const Locale('km'),
          'Khmer',
        ),
      ],
    );
  }

  Widget buildListTile(
    BuildContext context,
    LanguagesController languagesController,
    Locale locale,
    String language,
  ) {
    return Obx(() {
      return ListTile(
        title: Text(
          language,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        trailing: languagesController.isSelected(locale)
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : null,
        onTap: () {
          languagesController.changeLocale(locale);
          context.setLocale(locale);
        },
      );
    });
  }
}
