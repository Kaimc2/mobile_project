import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_project/app/controllers/sp_controller/user_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';
import 'package:mobile_project/app/ui/screens/search/local_widgets/crad.dart';
import 'package:mobile_project/app/ui/screens/search/local_widgets/history_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> genreData = [
      {
        'title': '#american trap',
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg'
      },
      {
        'title': '#lovecore',
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg'
      },
      {
        'title': '#gaming edm',
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg'
      },
    ];
    final List<Map<String, dynamic>> browseData = [
      {
        'title': 'music',
        'color': Colors.pink,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg',
      },
      {
        'title': 'podcasts',
        'color': Colors.teal,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg',
      },
      {
        'title': 'live_events',
        'color': Colors.purple,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg', // Replace with your image URL or asset path
      },
      {
        'title': 'made_for_you',
        'color': Colors.blue,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg', // Replace with your image URL or asset path
      },
    ];

    return Scaffold(
      appBar: buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: tr('what_do_you_want_to_listen_to?'),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIconColor: Colors.black,
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Explore your genres section
              Text(
                tr("explore_your_genres"),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genreData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: HistoryCard(
                        title: genreData[index]['title'],
                        imageUrl: genreData[index]['imageUrl'],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              // Browse all section
              Text(
                tr('browse_all'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 8.0, left: 0.0, bottom: 8.0, right: 0.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: browseData.length,
                itemBuilder: (context, index) {
                  return BrowseCard(
                    // Use BrowseCard class here
                    title: tr(browseData[index]['title']),
                    color: browseData[index]['color'],
                    imageUrl: browseData[index]['imageUrl'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppbar(BuildContext context) {
    final UserModel user = UserController().user.value;

    return AppBar(
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CircleAvatar(
          radius: 10,
          backgroundImage:
              user.photoUrl.isNotEmpty ? NetworkImage(user.photoUrl) : null,
          child:
              user.photoUrl.isEmpty ? Text(user.name[0].toUpperCase()) : null,
        ),
      ),
      title: Text(
        tr('search'),
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Change text color to black
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.white),
          onPressed: () {
            // Add functionality here
          },
        ),
      ],
    );
  }
}
