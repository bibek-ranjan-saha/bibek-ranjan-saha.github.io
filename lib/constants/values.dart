import 'package:Bibek/pages/experiments_page.dart';
import 'package:Bibek/pages/stats_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/project_page.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

bool isWebMobile(Size size)
{
  bool isWidthSmaller = size.shortestSide == size.width || size.width < size
      .height || size.width <= 500;
  final bool isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  return isWidthSmaller || isWebMobile;
}

List<Widget> pages = const [
  HomePage(),
  AboutPage(),
  ProjectPage(),
  StatisticsPage(),
  ExperimentsPage(),
  ContactPage()
];
