import 'package:easy_localization/easy_localization.dart';

class Initializer {
  static Future<void> load() async {
    await EasyLocalization.ensureInitialized();
  }
}
