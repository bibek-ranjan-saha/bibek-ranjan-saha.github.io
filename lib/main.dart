import 'package:bibek_ranjan_saha/home_page.dart';
import 'package:bibek_ranjan_saha/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: ChangeNotifierProvider<DataProvider>(
        create: (context) => DataProvider(),
        child: Consumer<DataProvider>(
          builder: (context, themeProvider, child) => MaterialApp(
            title: "Bibek Ranjan Saha Portfolio",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
                primarySwatch: Colors.lightGreen,
                useMaterial3: true,
                textTheme: GoogleFonts.ubuntuTextTheme()),
            home: const MainPage(),
          ),
        ),
      ),
    );
  }
}

//bubblegumSansTextTheme
