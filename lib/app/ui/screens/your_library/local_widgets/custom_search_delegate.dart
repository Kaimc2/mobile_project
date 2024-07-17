import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.white);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF212121),
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results
    return Container(
      color: const Color(0xFF121212),
      child: Center(
        child: Text(
          'Search Results for "$query"',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions
    return Container(
      color: const Color(0xFF121212),
      child: Center(
        child: Text(
          'Suggestions for "$query"',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget buildSearchField(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: query),
      autofocus: true,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        query = value;
      },
      onSubmitted: (value) {
        query = value;
        showResults(context);
      },
    );
  }
}
