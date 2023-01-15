import 'dart:ui';

import 'package:bibek_ranjan_saha/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/seo_text.dart';
import '../widgets/social_icons.dart';

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
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
        child: Container(
          color: Colors.blueGrey.withOpacity(0.7),
          height: size.height * 0.45,
          child: Row(
            children: [
              if (size.width > 1000)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CrazySeoText(
                      text :
                      "Address & Contact",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.map_rounded,
                                size: 45,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: CrazySeoText(
                                  text :
                                  "Subash marg, Boring padar, Kesinga Kalahandi",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              FittedBox(
                                child: CrazySeoText(
                                  text :
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
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.contact_mail,
                                size: 45,
                                color: Colors.white,
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
                                      child: CrazySeoText(
                                        text :
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
                                    const CrazySeoText(
                                      text :
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
                      ],
                    )
                  ],
                ),
              Expanded(
                child: Container(
                  color: Colors.lightGreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (size.width > 1000)
                        const CrazySeoText(
                          text :
                          "Social Links",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SocialIcons(
                              color: Color(0xff0077b5),
                              icon: NetworkAssets.iconLinkedin,
                              msg: "@bibek-ranjan-saha",
                              uri:
                                  "https://www.linkedin.com/in/bibek-ranjan-saha/"),
                          SocialIcons(
                              color: Colors.pinkAccent,
                              icon: NetworkAssets.iconInstagram,
                              msg: "@bibek_saha",
                              uri: "https://www.instagram.com/bibek_saha/"),
                          SocialIcons(
                              color: Color(0xff4267B2),
                              icon: NetworkAssets.iconFacebook,
                              msg: "@Bibek Saha",
                              uri:
                                  "https://www.facebook.com/profile.php?id=100015767202571"),
                          SocialIcons(
                              color: Colors.black,
                              icon: NetworkAssets.iconTwitter,
                              msg: "@bibek__saha",
                              uri: "https://twitter.com/bibek__saha"),
                          SocialIcons(
                              color: Colors.green,
                              icon: NetworkAssets.iconWhatsApp,
                              msg: "Bibek Saha",
                              uri: "https://wa.me/+917735336483"),
                        ],
                      ),
                      if (size.width <= 600)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        CrazySeoText(
                                          text :
                                          "Address : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.map_outlined,
                                          size: 35,
                                          color: Colors.black54,
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await launchUrl(Uri.parse(
                                            'https://www.google.com/maps/search/?api=1&query=20.182958,83.212644'));
                                      },
                                      child: const CrazySeoText(
                                        text :
                                        "Subash marg, Boring padar, Kesinga Kalahandi",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await launchUrl(Uri.parse(
                                            'https://www.google.com/maps/search/?api=1&query=20.2376,84.2700'));
                                      },
                                      child: const CrazySeoText(
                                        text :
                                        "Odisha, India",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        CrazySeoText(
                                          text :
                                          "Contact me : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
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
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              color: Colors.black54,
                                              Icons.email_rounded,
                                              size: 25,
                                            ),
                                            onPressed: () => {launchEmail()},
                                          ),
                                          const FittedBox(
                                            child: CrazySeoText(
                                              text :
                                              "   bibeksahabiki@gmail.com",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await launchUrl(
                                            Uri.parse("tel:+91-7735336483"));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.phone_rounded,
                                              color: Colors.black54,
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
                                              color: Colors.black54,
                                              size: 25,
                                            ),
                                          ),
                                          const CrazySeoText(
                                            text :
                                            "   +91-7735336483",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
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
                      if(size.width >= 600 && size.width <= 1000)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        CrazySeoText(
                                          text :
                                          "Address : ",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.map_outlined,
                                          size: 35,
                                          color: Colors.black87,
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await launchUrl(Uri.parse(
                                            'https://www.google.com/maps/search/?api=1&query=20.182958,83.212644'));
                                      },
                                      child: const CrazySeoText(
                                        text :
                                        "Subash marg, Boring padar, Kesinga Kalahandi",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await launchUrl(Uri.parse(
                                            'https://www.google.com/maps/search/?api=1&query=20.2376,84.2700'));
                                      },
                                      child: const CrazySeoText(
                                        text :
                                        "Odisha, India",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        CrazySeoText(
                                          text :
                                          "Contact me : ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.contact_mail_outlined,
                                          size: 35,
                                          color: Colors.black54,
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        launchEmail();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              color: Colors.black54,
                                              Icons.email_rounded,
                                              size: 25,
                                            ),
                                            onPressed: () => {launchEmail()},
                                          ),
                                          const FittedBox(
                                            child: CrazySeoText(
                                              text :
                                              "   bibeksahabiki@gmail.com",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await launchUrl(
                                            Uri.parse("tel:+91-7735336483"));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.phone_rounded,
                                              color: Colors.black54,
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
                                              color: Colors.black54,
                                              size: 25,
                                            ),
                                          ),
                                          const CrazySeoText(
                                            text :
                                            "   +91-7735336483",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
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
              ),
            ],
          ),
        ),
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
