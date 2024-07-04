import 'package:flutter/material.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/music/music_card.dart';
import 'package:mobile_project/app/ui/screens/music/rounded_row.dart';
import 'package:mobile_project/app/ui/screens/music/row.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = HomeController().getUser();
    final List<Map<String, dynamic>> cardContents = [
      {
        'bgImagePath':
            'https://static.miraheze.org/hololivewiki/thumb/1/19/Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg/300px-Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg',
        'mixImagePath':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
        'name': 'J-Pop Mix',
        'description': 'hololive IDOL PROJECT, ClariS, RADWIMPS and more',
      },
      {
        'bgImagePath':
            'https://static.miraheze.org/hololivewiki/thumb/1/19/Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg/300px-Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg',
        'mixImagePath':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
        'name': 'J-Pop Mix 2',
        'description': 'hololive IDOL PROJECT, ClariS, RADWIMPS and more',
        'preview': 'Song Name - Playing or Something IDK'
      },
      {
        'bgImagePath':
            'https://static.miraheze.org/hololivewiki/thumb/1/19/Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg/300px-Album_Cover_Art_-_Hyakka_Ryoran_Hanafubuki.jpg',
        'mixImagePath':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLgtkWXX_ymNViko5-0mr72PDaEGavJT_Ohw&s',
        'name': 'J-Pop Mix 3',
        'description': 'hololive IDOL PROJECT, ClariS, RADWIMPS and more',
      },
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          children: [
            const MusicRoundedRow(heading: 'Popular artists'),
            MusicRow(heading: 'Made for ${user.name}'),
            const MusicRow(heading: 'Popular radio'),
            const MusicRow(heading: 'Popular albums'),
            for (var content in cardContents)
              MusicCard(
                bgImagePath: content['bgImagePath'],
                mixImagePath: content['mixImagePath'],
                name: content['name'],
                description: content['description'],
                preview: content['preview'],
              ),
          ],
        ),
      ),
    );
  }
}
