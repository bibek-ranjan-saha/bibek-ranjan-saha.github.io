import 'package:flutter/material.dart';

import '../models/Statistics.dart';

class DataProvider extends ChangeNotifier {
  Statistics? stats;

  void updateData(Statistics newStats) {
    stats = newStats;
    notifyListeners();
  }

  // List<PieChartSectionData> getCountrySections() {
  //   return stats?.countries
  //           ?.map(
  //             (e) => PieChartSectionData(
  //               color: Colors.accents.single,
  //               title: e?.name,
  //               value: e?.count?.toDouble() ?? 0.0,
  //             ),
  //           )
  //           .toList() ??
  //       [];
  // }
}
