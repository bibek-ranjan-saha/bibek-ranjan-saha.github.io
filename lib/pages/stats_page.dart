// import 'dart:ui';
//
// import 'package:animated_flip_counter/animated_flip_counter.dart';
// import 'package:bibek_ranjan_saha/models/ip_data.dart';
// import 'package:bibek_ranjan_saha/providers/data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// import '../models/Statistics.dart';
// import '../widgets/seo_text.dart';
//
// class StatisticsPage extends StatelessWidget {
//   final IpData? ipData;
//   final Size size;
//
//   StatisticsPage({Key? key, this.ipData, required this.size}) : super(key: key);
//
//   final TooltipBehavior _tipBehaviour = TooltipBehavior();
//
//   @override
//   Widget build(BuildContext context) {
//     DataProvider provider = Provider.of<DataProvider>(context, listen: true);
//     var statsWidth = (size.shortestSide <= size.height
//             ? (size.shortestSide / 2)
//             : size.shortestSide) -
//         50;
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               children: [
//                 AnimatedFlipCounter(
//                   value: provider.stats?.totalCount ?? 1,
//                   suffix: "  user visits till now",
//                   textStyle: const TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Icon(
//                   Icons.arrow_circle_down_sharp,
//                   color: Colors.white,
//                   size: 36,
//                 )
//               ],
//             ),
//           ),
//           Row(
//             children: const [
//               Text(
//                 "Open it in your other device and see the magic.",
//                 style: TextStyle(fontSize: 16, color: Colors.white54),
//               ),
//             ],
//           ),
//           if (ipData != null)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: const [
//                       Flexible(
//                         child: CrazySeoText(
//                           text: "Let me guess your details",
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.lightGreenAccent,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Icon(
//                         Icons.arrow_circle_right_rounded,
//                         color: Colors.white,
//                         size: 36,
//                       )
//                     ],
//                   ),
//                 ),
//                 Text(
//                   "Country : ${ipData?.country}\nRegion "
//                   ": ${ipData?.region}\nCity : "
//                   "${ipData?.city}\nNetwork Service Provider : ${ipData?.org}\nZip "
//                   "code : ${ipData?.postal}",
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white70,
//                   ),
//                 ),
//               ],
//             ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               children: const [
//                 Flexible(
//                   child: CrazySeoText(
//                     text:
//                         "Showcase of user's visiting my device updated in real-time",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.lightGreenAccent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Icon(
//                   Icons.arrow_circle_right_rounded,
//                   color: Colors.white,
//                   size: 28,
//                 )
//               ],
//             ),
//           ),
//           Wrap(
//             crossAxisAlignment: WrapCrossAlignment.center,
//             runAlignment: WrapAlignment.spaceEvenly,
//             alignment: WrapAlignment.spaceEvenly,
//             runSpacing: 12,
//             spacing: 12,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white, width: 2),
//                     ),
//                     width: statsWidth,
//                     child: SfCircularChart(
//                       tooltipBehavior: _tipBehaviour,
//                       title: ChartTitle(
//                         text: "Country of visitors",
//                         textStyle: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       legend: Legend(
//                           isVisible: true,
//                           overflowMode: LegendItemOverflowMode.wrap),
//                       series: <CircularSeries>[
//                         DoughnutSeries<City?, String>(
//                             dataSource: provider.stats?.countries ?? [],
//                             xValueMapper: (City? country, _) =>
//                                 country?.name ?? "country",
//                             yValueMapper: (City? country, _) =>
//                                 country?.count ?? 0,
//                             dataLabelSettings: const DataLabelSettings(
//                                 isVisible: true, color: Colors.white),
//                             enableTooltip: true)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white, width: 2),
//                     ),
//                     width: statsWidth,
//                     child: SfCircularChart(
//                       tooltipBehavior: _tipBehaviour,
//                       title: ChartTitle(
//                         text: "Region of visitors",
//                         textStyle: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       legend: Legend(
//                           isVisible: true,
//                           overflowMode: LegendItemOverflowMode.wrap),
//                       series: <CircularSeries>[
//                         DoughnutSeries<Region?, String>(
//                             dataSource: provider.stats?.regions ?? [],
//                             xValueMapper: (Region? region, _) =>
//                                 region?.name ?? "region",
//                             yValueMapper: (Region? region, _) =>
//                                 region?.count ?? 0,
//                             dataLabelSettings: const DataLabelSettings(
//                                 isVisible: true, color: Colors.white),
//                             enableTooltip: true)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white, width: 2),
//                     ),
//                     width: statsWidth,
//                     child: SfCircularChart(
//                       tooltipBehavior: _tipBehaviour,
//                       title: ChartTitle(
//                         text: "City of visitors",
//                         textStyle: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       legend: Legend(
//                           isVisible: true,
//                           overflowMode: LegendItemOverflowMode.wrap),
//                       series: <CircularSeries>[
//                         DoughnutSeries<City?, String>(
//                             dataSource: provider.stats?.cities ?? [],
//                             xValueMapper: (City? city, _) =>
//                                 city?.name ?? "city",
//                             yValueMapper: (City? city, _) => city?.count ?? 0,
//                             dataLabelSettings: const DataLabelSettings(
//                                 isVisible: true, color: Colors.white),
//                             enableTooltip: true)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white, width: 2),
//                     ),
//                     width: statsWidth,
//                     child: SfCircularChart(
//                       tooltipBehavior: _tipBehaviour,
//                       title: ChartTitle(
//                         text: "Internet Service Provider of "
//                             "visitors",
//                         textStyle: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       legend: Legend(
//                           isVisible: true,
//                           overflowMode: LegendItemOverflowMode.wrap),
//                       series: <CircularSeries>[
//                         DoughnutSeries<ServiceProvider?, String>(
//                             groupMode: CircularChartGroupMode.point,
//                             dataSource: provider.stats?.serviceProviders ?? [],
//                             xValueMapper: (ServiceProvider? sp, _) => ((sp
//                                                 ?.org ??
//                                             "")
//                                         .toString()
//                                         .length >
//                                     10)
//                                 ? "${sp?.org.toString().substring(0, 10)}..."
//                                 : sp?.org ?? "isp",
//                             yValueMapper: (ServiceProvider? sp, _) =>
//                                 sp?.count ?? 0,
//                             dataLabelSettings: const DataLabelSettings(
//                                 isVisible: true, color: Colors.white),
//                             enableTooltip: true)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
