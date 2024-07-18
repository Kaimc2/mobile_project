import 'package:flutter/material.dart';
import 'package:mobile_project/app/controllers/sp_controller/music_page_controller.dart';
import 'package:mobile_project/app/controllers/sp_controller/user_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/music_model.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/music/widgets/music_card.dart';
import 'package:mobile_project/app/ui/screens/music/widgets/rounded_row.dart';
import 'package:mobile_project/app/ui/screens/music/widgets/row.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserController().user.value;
    final List<MusicModel> music = MusicPageController().getMusic();
    final List<MusicCardModel> cardContents =
        MusicPageController().getMusicCardContents();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const MusicRoundedRow(heading: 'popular_artists'),
          MusicRowWidget(
            heading: 'made_for ${user.name}',
            music: music,
            fromIndex: 1,
            split: true,
          ),
          MusicRowWidget(heading: 'popular_radios', music: music, fromIndex: 1),
          MusicRowWidget(heading: 'popular_albums', music: music, fromIndex: 1),
          for (var content in cardContents)
            MusicCard(
              bgImagePath: content.bgImageUrl,
              mixImagePath: content.mixImageUrl,
              name: content.name,
              description: content.description,
              category: content.category,
              preview: content.preview,
            ),
        ],
      ),
    );
  }
}
