import 'package:Bibek/models/battery_data.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../../../models/device_data.dart';
import '../../../services/apis.dart';
import '../../../widgets/seo_text.dart';
import '../../internatalization_converter_screen.dart';

class ExperimentsPage extends StatelessWidget {
  const ExperimentsPage({Key? key}) : super(key: key);

  String getTime(BatteryData result) {
    String fullChargeTime = result.chargingTime == null
        ? "Unknown"
        : result.chargingTime == 0
            ? "Already full"
            : "${(result.chargingTime ?? 0) / 60} hr";
    String fullDischargeTime = result.dischargingTime == null
        ? "Unknown"
        : result.dischargingTime == 0
            ? "Very long"
            : "${(result.dischargingTime ?? 0) / 60} hr";
    String output = result.charging
        ? "Full charge in : $fullChargeTime"
        : "Will last till : $fullDischargeTime";
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Flexible(
                  child: CrazySeoText(
                    text: "Experiments",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.white,
                  size: 32,
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
            child: Wrap(
              runSpacing: 12,
              spacing: 12,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CrazySeoText(
                        text: "Device info",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: FutureBuilder<DeviceData?>(
                        future: ApiRepo.getSystemInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.waiting) {
                            if (snapshot.data == null) {
                              return const Text(
                                "Something went wrong",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900),
                              );
                            } else {
                              Parse result = snapshot.data!.parse;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CrazySeoText(
                                    text:
                                        "Device :  ${result.simpleOperatingPlatformString ?? "Unable to identify"}",
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  CrazySeoText(
                                    text:
                                        "Browser : ${result.softwareName ?? "Unable to identify"}",
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  CrazySeoText(
                                    text:
                                        "OS : ${result.operatingSystem ?? "Unable to identify"}",
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              );
                            }
                          } else {
                            return const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Wait for it..",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CrazySeoText(
                        text: "Battery info",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return FutureBuilder<BatteryData?>(
                            future: ApiRepo.getBatteryInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.waiting) {
                                if (snapshot.data == null) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Something went wrong",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.refresh_rounded,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  var result = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CrazySeoText(
                                            text:
                                                "Battery Level :  ${(result.level * 100).toStringAsFixed(1)} %",
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          CrazySeoText(
                                            text:
                                                "Status : ${result.charging ? "Charging Battery" : "Not Charging"}",
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          CrazySeoText(
                                            text: getTime(result),
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.refresh_rounded,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.all(28.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Wait for it..",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CrazySeoText(
                        text: "New Internationalization Maker (JSON to Dart)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CrazySeoText(
                            text: "It was time when I was refactoring one of "
                                "my old project little did I know I am going "
                                "to end up here.\n\n(FunFact: It was very easy "
                                "and quick took about 1hr with every feature "
                                "and UI)\nI have created this feature "
                                "without any package or help from anyone with out "
                                "reference purely in dart, Let me know if "
                                "Its failing anywhere or need some feature "
                                "over it and send me a message If it helped "
                                "you in anyway/saved your time.",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: TextButton(
                              onPressed: () {
                                Routemaster.of(context).push(
                                    InternationalizationConverterScreen.route);
                              },
                              child: const Text("Try it now"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
