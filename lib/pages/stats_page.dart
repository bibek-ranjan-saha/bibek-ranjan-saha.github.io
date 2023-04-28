import 'package:Bibek/providers/data_provider.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/statistics_data.dart';
import '../widgets/seo_text.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TooltipBehavior tipBehaviour = TooltipBehavior();
    var size = MediaQuery.of(context).size;
    var statsWidth = (size.shortestSide <= size.height
            ? (size.shortestSide / 2)
            : size.shortestSide) -
        50;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Consumer<DataProvider>(builder: (ctx, provider, child) {
                  if (provider.stats == null) {
                    return const Text(
                      "Statistics of Portfolio",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }
                  return AnimatedFlipCounter(
                    value: provider.stats?.totalCount ?? 1,
                    suffix: "  user visits till now",
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_circle_down_sharp,
                  color: Colors.white,
                  size: 36,
                )
              ],
            ),
          ),
          Consumer<DataProvider>(builder: (ctx, provider, child) {
            return Row(
              children: [
                Text(
                  provider.stats == null
                      ? "Wait for websockets to connect then you will be able to see live updates"
                      : "Open it in your other device and see the magic.",
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.start,
                ),
              ],
            );
          }),
          Consumer<DataProvider>(builder: (ctx, provider, child) {
            if (provider.ipData == null) {
              return const SizedBox();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: const [
                      Flexible(
                        child: CrazySeoText(
                          text: "Let me guess your details",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_circle_right_rounded,
                        color: Colors.white,
                        size: 36,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Country : ${provider.ipData?.countryName}\nRegion "
                    ": ${provider.ipData?.continentName}\nCity : "
                    "${provider.ipData?.city}\nNetwork Service Provider : "
                    "${provider.ipData?.organization}\nZip "
                    "code : ${provider.ipData?.zipcode}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: const [
                Flexible(
                  child: CrazySeoText(
                    text:
                        "Showcase of user's visiting my device updated in real-time",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.white,
                  size: 28,
                )
              ],
            ),
          ),
          Consumer<DataProvider>(builder: (ctx, provider, child) {
            if (provider.stats == null) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Web-sockets is not established yet hold on for live update",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 12,
              spacing: 12,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  width: statsWidth,
                  child: SfCircularChart(
                    tooltipBehavior: tipBehaviour,
                    title: ChartTitle(
                      text: "Country of visitors",
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    legend: Legend(
                        isVisible: true,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: <CircularSeries>[
                      DoughnutSeries<City?, String>(
                          dataSource: provider.stats?.countries ?? [],
                          xValueMapper: (City? country, _) =>
                              country?.name ?? "country",
                          yValueMapper: (City? country, _) =>
                              country?.count ?? 0,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true, color: Colors.white),
                          enableTooltip: true)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  width: statsWidth,
                  child: SfCircularChart(
                    tooltipBehavior: tipBehaviour,
                    title: ChartTitle(
                      text: "Region of visitors",
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    legend: Legend(
                        isVisible: true,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: <CircularSeries>[
                      DoughnutSeries<Region?, String>(
                          dataSource: provider.stats?.regions ?? [],
                          xValueMapper: (Region? region, _) =>
                              region?.name ?? "region",
                          yValueMapper: (Region? region, _) =>
                              region?.count ?? 0,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true, color: Colors.white),
                          enableTooltip: true)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  width: statsWidth,
                  child: SfCircularChart(
                    tooltipBehavior: tipBehaviour,
                    title: ChartTitle(
                      text: "City of visitors",
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    legend: Legend(
                        isVisible: true,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: <CircularSeries>[
                      DoughnutSeries<City?, String>(
                          dataSource: provider.stats?.cities ?? [],
                          xValueMapper: (City? city, _) => city?.name ?? "city",
                          yValueMapper: (City? city, _) => city?.count ?? 0,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true, color: Colors.white),
                          enableTooltip: true)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  width: statsWidth,
                  child: SfCircularChart(
                    tooltipBehavior: tipBehaviour,
                    title: ChartTitle(
                      text: "Internet Service Provider of "
                          "visitors",
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    legend: Legend(
                        isVisible: true,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: <CircularSeries>[
                      DoughnutSeries<ServiceProvider?, String>(
                          groupMode: CircularChartGroupMode.point,
                          dataSource: provider.stats?.serviceProviders ?? [],
                          xValueMapper: (ServiceProvider? sp, _) =>
                              ((sp?.org ?? "").toString().length > 10)
                                  ? "${sp?.org.toString().substring(0, 10)}..."
                                  : sp?.org ?? "isp",
                          yValueMapper: (ServiceProvider? sp, _) =>
                              sp?.count ?? 0,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true, color: Colors.white),
                          enableTooltip: true)
                    ],
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
