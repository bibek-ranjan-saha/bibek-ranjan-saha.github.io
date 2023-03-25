import 'package:Bibek/providers/data_provider.dart';
import 'package:Bibek/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';
import 'package:url_strategy/url_strategy.dart';

import 'home_page.dart';

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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => DataProvider(),
          ),
        ],
        builder: (ctx, wdt) {
          DataProvider provider = Provider.of<DataProvider>(ctx, listen: false);
          AppService.initiateAllApi(provider);
          return MaterialApp(
            title: "Bibek Ranjan Saha Portfolio",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
                primarySwatch: Colors.lightGreen,
                useMaterial3: true,
                fontFamily: "customFont"),
            home: const MainPage(),
          );
        },
      ),
    );
  }
}

//bubblegumSansTextTheme
