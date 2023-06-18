import 'package:Bibek/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../../screens/error_screen.dart';
import '../../screens/internatalization_converter_screen.dart';

class AppRouter {
  static final route = RouteMap(
      onUnknownRoute: (route) {
        return const MaterialPage(child: ErrorScreen());
      },
      routes: {
        MainPage.route: (route) => const MaterialPage(child: MainPage()),
        InternationalizationConverterScreen.route: (route) =>
            const MaterialPage(child: InternationalizationConverterScreen()),
      });
}
