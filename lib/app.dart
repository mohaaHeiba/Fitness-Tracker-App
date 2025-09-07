import 'package:fitness_tracker_app/generated/l10n.dart';
import 'package:fitness_tracker_app/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fitness_tracker_app/presentation/navigation/navigation_bar.dart'
    as nav;
import 'package:get_storage/get_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage().read('loginBefore') ?? false;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //theme
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          brightness: Brightness.light,
          primary: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          primary: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark,

      //locale
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // locale: Locale('ar', 'EG'),

      //nav
      home: storage ? nav.NavigationBar() : WelcomePage(),
    );
  }
}
