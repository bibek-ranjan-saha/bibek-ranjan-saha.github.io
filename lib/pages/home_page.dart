import 'package:animate_do/animate_do.dart';
import 'package:bibek_ranjan_saha/models/ip_data.dart';
import 'package:flutter/material.dart';
import 'package:bibek_ranjan_saha/assets/images.dart';

class HomePage extends StatelessWidget {
  final Size size;
  final IpData? ipData;

  const HomePage({required Key key, required this.size, this.ipData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: size.height,
      child: Row(children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello folks over there ${ipData != null ? "from ${ipData?.city}" : ""},",
                    style: const TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Bounce(
                    animate: true,
                    duration: const Duration(seconds: 2),
                    delay: const Duration(seconds: 1),
                    child: const Text(
                      "I am Bibek ranjan saha",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeIn(
                        child: const Text(
                          "Mobile Developer",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Pulse(
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Download CV")),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        if (size.width > 700)
          Image.network(
            Assets.bibek,
            fit: BoxFit.contain,
          ),
      ]),
    );
  }
}
