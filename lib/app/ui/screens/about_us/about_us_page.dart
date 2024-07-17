import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/about_us_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/artist_model.dart';
import 'package:mobile_project/app/ui/screens/home/widgets/artist.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutUsController aboutUsController = Get.find<AboutUsController>();
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildAppBar(context),
      body: buildBody(aboutUsController),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF212121),
      title: const Text(
        'About Us',
        style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildBody(AboutUsController aboutUsController) {
    return CustomScrollView(
      slivers: <Widget>[
        ...buildGridSection(
          items: aboutUsController.lecturers,
          sectionTitle: 'Lecturers',
        ),
        ...buildGridSection(
          items: aboutUsController.artists,
          sectionTitle: 'Team Members',
        ),
      ],
    );
  }

  List<Widget> buildGridSection({
    required List<ArtistModel> items,
    required String sectionTitle,
  }) {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            sectionTitle,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            var artist = items[index];
            return Artist(
              imageUrl: artist.imageUrl,
              name: artist.name,
            );
          },
          childCount: items.length,
        ),
      ),
    ];
  }
}
