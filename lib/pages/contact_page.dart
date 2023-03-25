import 'package:Bibek/assets/images.dart';
import 'package:flutter/material.dart';

import '../services/app_service.dart';
import '../widgets/seo_text.dart';
import '../widgets/social_icons.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.45,
      child: Row(
        children: [
          if (size.width > 1000)
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.65),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CrazySeoText(
                    text: "Address & Contact",
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
                                text:
                                    "Subash marg, Boring padar, Kesinga Kalahandi",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            FittedBox(
                              child: CrazySeoText(
                                text: "Odisha, India",
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
                              onTap: () {
                                AppService.launchEmail();
                              },
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      color: Colors.white54,
                                      Icons.email_rounded,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      AppService.launchEmail();
                                    },
                                  ),
                                  const FittedBox(
                                    child: CrazySeoText(
                                      text: "   bibeksahabiki@gmail.com",
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
                              onTap: () {
                                AppService.launchAppUrl("tel:+91-7735336483");
                              },
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.phone_rounded,
                                      color: Colors.white54,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      AppService.launchAppUrl(
                                          "tel:+91-7735336483");
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      AppService.sendSms();
                                    },
                                    icon: const Icon(
                                      Icons.message_rounded,
                                      color: Colors.white54,
                                      size: 25,
                                    ),
                                  ),
                                  const CrazySeoText(
                                    text: "   +91-7735336483",
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
                      text: "Social Links",
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
                          icon: AssetAssets.iconLinkedin,
                          msg: "@bibek-ranjan-saha",
                          uri:
                              "https://www.linkedin.com/in/bibek-ranjan-saha/"),
                      SocialIcons(
                          color: Colors.pinkAccent,
                          icon: AssetAssets.iconInstagram,
                          msg: "@bibek_saha",
                          uri: "https://www.instagram.com/bibek_saha/"),
                      SocialIcons(
                          color: Color(0xff4267B2),
                          icon: AssetAssets.iconFacebook,
                          msg: "@Bibek Saha",
                          uri:
                              "https://www.facebook.com/profile.php?id=100015767202571"),
                      SocialIcons(
                          color: Colors.black,
                          icon: AssetAssets.iconTwitter,
                          msg: "@bibek__saha",
                          uri: "https://twitter.com/bibek__saha"),
                      SocialIcons(
                          color: Colors.green,
                          icon: AssetAssets.iconWhatsApp,
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
                                      text: "Address : ",
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
                                  onTap: () {
                                    AppService.launchAppUrl('https://www.google'
                                        '.com/maps/search/?api=1&query=20.182958,83.212644');
                                  },
                                  child: const CrazySeoText(
                                    text:
                                        "Subash marg, Boring padar, Kesinga Kalahandi",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppService.launchAppUrl(
                                        'https://www.google.com/maps/search/?api=1&query=20.2376,84.2700');
                                  },
                                  child: const CrazySeoText(
                                    text: "Odisha, India",
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
                                      text: "Contact me : ",
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
                                  onTap: () {
                                    AppService.launchEmail();
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
                                        onPressed: () {
                                          AppService.launchEmail();
                                        },
                                      ),
                                      const FittedBox(
                                        child: CrazySeoText(
                                          text: "   bibeksahabiki@gmail.com",
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
                                  onTap: () {
                                    AppService.launchAppUrl(
                                        "tel:+91-7735336483");
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
                                        onPressed: () {
                                          AppService.launchAppUrl(
                                              "tel:+91-7735336483");
                                        },
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          AppService.sendSms();
                                        },
                                        icon: const Icon(
                                          Icons.message_rounded,
                                          color: Colors.black54,
                                          size: 25,
                                        ),
                                      ),
                                      const CrazySeoText(
                                        text: "   +91-7735336483",
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
                  if (size.width >= 600 && size.width <= 1000)
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
                                      text: "Address : ",
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
                                  onTap: () {
                                    AppService.launchAppUrl(
                                        'https://www.google.com/maps/search/?api=1&query=20.182958,83.212644');
                                  },
                                  child: const CrazySeoText(
                                    text:
                                        "Subash marg, Boring padar, Kesinga Kalahandi",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppService.launchAppUrl(
                                        'https://www.google.com/maps/search/?api=1&query=20.2376,84.2700');
                                  },
                                  child: const CrazySeoText(
                                    text: "Odisha, India",
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
                                      text: "Contact me : ",
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
                                  onTap: () {
                                    AppService.launchEmail();
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
                                        onPressed: () {
                                          AppService.launchEmail();
                                        },
                                      ),
                                      const FittedBox(
                                        child: CrazySeoText(
                                          text: "   bibeksahabiki@gmail.com",
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
                                  onTap: () {
                                    AppService.launchAppUrl(
                                        "tel:+91-7735336483");
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
                                        onPressed: () {
                                          AppService.launchAppUrl(
                                              "tel:+91-7735336483");
                                        },
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          AppService.sendSms();
                                        },
                                        icon: const Icon(
                                          Icons.message_rounded,
                                          color: Colors.black54,
                                          size: 25,
                                        ),
                                      ),
                                      const CrazySeoText(
                                        text: "   +91-7735336483",
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
    );
  }
}
