import 'package:flutter/material.dart';
import 'package:mobile_project/app/ui/screens/search/local_widgets/crad.dart';
import 'package:mobile_project/app/ui/screens/search/local_widgets/header.dart';
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
        'title': 'Music',
        'color': Colors.pink,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg',
      },
      {
        'title': 'Podcasts',
        'color': Colors.teal,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg',
      },
      {
        'title': 'Live Events',
        'color': Colors.purple,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg', // Replace with your image URL or asset path
      },
      {
        'title': 'Made For You',
        'color': Colors.blue,
        'imageUrl':
            'https://core.sgx.bz/files/s8server/hr/24/07/71598460b75f4642b93f7ccbf3234792.jpg', // Replace with your image URL or asset path
      },
    ];

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomHeader(),
      ),
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
                    hintText: 'What do you want to listen to?',
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
              const Text(
                'Explore your genres',
                style: TextStyle(
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
              const Text(
                'Browse all',
                style: TextStyle(
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
                    title: browseData[index]['title'],
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
}
