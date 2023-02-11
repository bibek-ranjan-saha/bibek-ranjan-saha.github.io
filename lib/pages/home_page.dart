import 'package:animate_do/animate_do.dart';
import 'package:bibek_ranjan_saha/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/apis.dart';
import '../widgets/seo_image.dart';
import '../widgets/seo_text.dart';

class HomePage extends StatelessWidget {
  final Size size;

  const HomePage({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: size.height,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlipInY(
                    child: const CrazySeoText(
                      text: "Hello folks over there ",
                      // "${ipData != null ? "from ${ipData?.city}" : ""},",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  // if (weatherData != null)
                  //   ElasticInLeft(
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Container(
                  //           height: 30,
                  //           width: 30,
                  //           decoration: const BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: Colors.white,
                  //           ),
                  //           child: CrazySeoImage(
                  //             src:
                  //                 "http://openweathermap.org/img/wn/${weatherData?.weather.first.icon}@2x.png",
                  //             child: Image.asset(name)(
                  //                 "http://openweathermap.org/img/wn/${weatherData?.weather.first.icon}@2x.png"),
                  //           ),
                  //         ),
                  //         Flexible(
                  //           child: CrazySeoText(
                  //             text:
                  //                 " Its ${(weatherData?.main.temp ?? 0).toStringAsFixed(2)} °C there ,"
                  //                 "weather is ${weatherData?.weather.single.main}",
                  //             style: const TextStyle(
                  //                 color: Colors.white70, fontSize: 18),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  const SizedBox(
                    height: 20,
                  ),
                  Bounce(
                    duration: const Duration(seconds: 2),
                    delay: const Duration(seconds: 1),
                    child: Wrap(
                      children: [
                        const CrazySeoText(
                          text: "I am Bibek ranjan saha",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 52,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CrazySeoImage(
                          src: AssetAssets.waveIconMS,
                          child: Image.asset(
                            AssetAssets.waveIconMS,
                            width: 50,
                          ),
                        )
                      ],
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      FadeIn(
                        child: const CrazySeoText(
                          text: "Mobile Developer",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Pulse(
                          child: ElevatedButton(
                            onPressed: () async {
                              String url = await ApiRepo().getResume();
                              await launchUrl(Uri.parse(url));
                            },
                            child: const CrazySeoText(text: "Download RESUME"),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (size.width > 700)
              CrazySeoImage(
                src: AssetAssets.bibekFull,
                child: Image.asset(
                  AssetAssets.bibekFull,
                  fit: BoxFit.contain,
                ),
              ),
          ]),
    );
  }
}
