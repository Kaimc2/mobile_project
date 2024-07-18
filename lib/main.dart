import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/app/app.dart';
import 'package:mobile_project/initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.load();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('km'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
