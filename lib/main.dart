import 'package:bibek_ranjan_saha/home_page.dart';
import 'package:flutter/material.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: false,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(primarySwatch: Colors.lightGreen,useMaterial3: true,
            textTheme: GoogleFonts.ubuntuTextTheme()),
        home: const MainPage(),
      ),
    );
  }
}

//bubblegumSansTextTheme
