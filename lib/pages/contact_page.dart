import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final Size size;

  const ContactPage({required Key key, required this.size}) : super(key: key);

  // getJokes() async {
  //   Timer.periodic(const Duration(seconds: 30), (timer) async {
  //     joke = await ApiRepo().getJoke();
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          const Spacer(),
          // SizedBox(
          //   height: 200,
          //   width: size.width,
          //   child: Stack(//stack helps to overlaps widgets
          //       children: [
          //     Positioned(
          //       //helps to position widget where ever we want
          //       bottom: 0,
          //       //position at the bottom
          //       right: animation.value,
          //       //value of right from animation controller
          //       child: ClipPath(
          //         clipper: MyWaveClipper(), //applying our custom clipper
          //         child: Opacity(
          //           opacity: 1,
          //           child: Container(
          //             color: Colors.blueGrey,
          //             width: size.width * 1.3,
          //             height: 160,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       //helps to position widget where ever we want
          //       bottom: 0,
          //       //position at the bottom
          //       left: animation.value,
          //       //value of left from animation controller
          //       child: ClipPath(
          //         clipper: MyWaveClipper(), //applying our custom clipper
          //         child: Opacity(
          //           opacity: 0.6,
          //           child: Container(
          //             color: Colors.blueGrey,
          //             width: size.width * 1.3,
          //             height: 160,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Padding(
          //         padding: const EdgeInsets.all(18.0),
          //         child: AnimatedTextKit(
          //           animatedTexts: [
          //             TypewriterAnimatedText(
          //               joke,
          //               textStyle: const TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w600),
          //               speed: const Duration(milliseconds: 100),
          //             ),
          //           ],
          //           pause: const Duration(milliseconds: 1000),
          //           displayFullTextOnTap: true,
          //           totalRepeatCount: 1,
          //           stopPauseOnTap: true,
          //         ),
          //       ),
          //     )
          //   ]),
          // ),
          Container(
            color: Colors.grey.withOpacity(0.5),
            height: 300,
            child: Row(
              children: [
                if (size.width > 800)
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.map_rounded,
                          size: 45,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          child: Text(
                            "Subash marg, Boring padar, Kesinga Kalahandi",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "Odisha, India",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (size.width > 800)
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.contact_mail,
                          size: 45,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            launchEmail();
                          },
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  color: Colors.white54,
                                  Icons.email_rounded,
                                  size: 25,
                                ),
                                onPressed: () => {launchEmail()},
                              ),
                              const FittedBox(
                                child: Text(
                                  "   bibeksahabiki@gmail.com",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse("tel:+91-7735336483"));
                          },
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.phone_rounded,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                                onPressed: () async {
                                  await launchUrl(
                                      Uri.parse("tel:+91-7735336483"));
                                },
                              ),
                              IconButton(
                                onPressed: () async {
                                  final Uri smsLaunchUri = Uri(
                                    scheme: 'sms',
                                    path: '+917735336483',
                                    queryParameters: <String, String>{
                                      'body': Uri.encodeComponent(
                                          'Hii catching you up from your portfolio lets get to a call'),
                                    },
                                  );
                                  await launchUrl(smsLaunchUri);
                                },
                                icon: const Icon(
                                  Icons.message_rounded,
                                  color: Colors.white54,
                                  size: 25,
                                ),
                              ),
                              const Text(
                                "   +91-7735336483",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: Container(
                    color: Colors.orange.withOpacity(0.6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(Uri.parse(
                                    "https://www.linkedin.com/in/bibek-ranjan-saha/"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/linkedin.png"),
                                  const Text("@bibek-ranjan-saha"),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(Uri.parse(
                                    "https://www.instagram.com/bibek_saha/"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/instagram.png"),
                                  const Text("@bibek_saha"),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(Uri.parse(
                                    "https://www.facebook.com/profile.php?id=100015767202571"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/facebook.png"),
                                  const Text("@Bibek Saha"),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(Uri.parse(
                                    "https://twitter.com/bibek__saha"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/twitter.png"),
                                  const Text("@bibek__saha"),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse("https://wa.me/+917735336483"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/whatsapp.png"),
                                  const Text("Bibek Saha"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (size.width < 800)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Address : ",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.map_outlined,
                                    size: 35,
                                    color: Colors.white70,
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      'https://www.google.com/maps/search/?api=1&query=20.182958,83.212644'));
                                },
                                child: const Text(
                                  "Subash marg, Boring padar, Kesinga Kalahandi",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      'https://www.google.com/maps/search/?api=1&query=20.2376,84.2700'));
                                },
                                child: const Text(
                                  "Odisha, India",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        if (size.width < 800)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Contact me : ",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.contact_mail_outlined,
                                    size: 35,
                                    color: Colors.white70,
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  launchEmail();
                                },
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        color: Colors.white54,
                                        Icons.email_rounded,
                                        size: 25,
                                      ),
                                      onPressed: () => {launchEmail()},
                                    ),
                                    const FittedBox(
                                      child: Text(
                                        "   bibeksahabiki@gmail.com",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse("tel:+91-7735336483"));
                                },
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.phone_rounded,
                                        color: Colors.white54,
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        await launchUrl(
                                            Uri.parse("tel:+91-7735336483"));
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final Uri smsLaunchUri = Uri(
                                          scheme: 'sms',
                                          path: '+917735336483',
                                          queryParameters: <String, String>{
                                            'body': Uri.encodeComponent(
                                                'Hii catching you up from your portfolio lets get to a call'),
                                          },
                                        );
                                        await launchUrl(smsLaunchUri);
                                      },
                                      icon: const Icon(
                                        Icons.message_rounded,
                                        color: Colors.white54,
                                        size: 25,
                                      ),
                                    ),
                                    const Text(
                                      "   +91-7735336483",
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchEmail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'bibeksahabiki@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'From your Portfolio',
      }),
    );
    await launchUrl(emailLaunchUri);
  }
}
