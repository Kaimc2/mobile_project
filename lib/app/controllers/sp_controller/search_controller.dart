import 'package:get/get.dart';

class SearchController extends GetxController {
  final search = ''.obs;
  final searchResult = <String>[].obs;

  void onSearch(String value) {
    search.value = value;
    searchResult.assignAll(
      List.generate(10, (index) => '$value $index'),
    );
  }
}
