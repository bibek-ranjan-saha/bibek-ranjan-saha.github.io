import 'package:animate_do/animate_do.dart';
import 'package:Bibek/assets/images.dart';
import 'package:Bibek/providers/data_provider.dart';
import 'package:Bibek/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/seo_image.dart';
import '../widgets/seo_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<DataProvider>(builder: (ctx, provider, child) {
                    return FlipInY(
                      child: CrazySeoText(
                        text:
                            "Hello folks over there ${provider.ipData != null ? "from ${provider.ipData?.city}" : ""},",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    );
                  }),
                  Consumer<DataProvider>(builder: (ctx, provider, child) {
                    if (provider.weather != null) {
                      return ElasticInLeft(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: CrazySeoImage(
                                src:
                                    "http://openweathermap.org/img/wn/${provider.weather?.weather.first.icon}@2x.png",
                                child: Image.network("http://openweathermap"
                                    ".org/img/wn/${provider.weather?.weather.first.icon}@2x.png"),
                              ),
                            ),
                            Flexible(
                              child: CrazySeoText(
                                text:
                                    " Its ${(provider.weather?.main.temp ?? 0).toStringAsFixed(2)} °C there ,"
                                    "weather is ${provider.weather?.weather.single.main}",
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
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
                          duration: const Duration(seconds: 2),
                          child: const ElevatedButton(
                            onPressed: AppService.loadMyResume,
                            child: CrazySeoText(text: "Download RESUME"),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (size.width > 1000)
              Align(
                alignment: Alignment.bottomRight,
                child: BounceInUp(
                  duration: const Duration(seconds: 1),
                  child: CrazySeoImage(
                    src: AssetAssets.bibekFull,
                    child: Image.asset(
                      height: size.height,
                      AssetAssets.bibekFull,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
