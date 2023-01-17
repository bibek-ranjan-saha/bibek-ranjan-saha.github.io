import 'package:bibek_ranjan_saha/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: "Bibek Ranjan Saha Portfolio",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            useMaterial3: true,
            textTheme: GoogleFonts.ubuntuTextTheme()),
        home: const MainPage(),
      ),
    );
  }
}

//bubblegumSansTextTheme
