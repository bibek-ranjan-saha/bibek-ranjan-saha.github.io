import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../screens/home/pages/about_page.dart';
import '../screens/home/pages/contact_page.dart';
import '../screens/home/pages/experiments_page.dart';
import '../screens/home/pages/home_page.dart';
import '../screens/home/pages/project_page.dart';
import '../screens/home/pages/stats_page.dart';

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


class ColorConstants{
  static const Color blue = Color(0xff3A3ADD);
}

class RetryConstants{
  static const int defaultRetryCount = 3;
}