import 'dart:ui';

import 'package:bibek_ranjan_saha/assets/images.dart';
import 'package:bibek_ranjan_saha/widgets/circular_progress.dart';
import 'package:bibek_ranjan_saha/widgets/knowledge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/seo_image.dart';
import '../widgets/seo_text.dart';

class AboutPage extends StatelessWidget {
  final Size size;

  const AboutPage({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Flexible(
                  child: CrazySeoText(
                    text: "More About me",
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
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: CrazySeoText(
              text: "I am Bibek from Odisha interested in app development be it"
                  " Flutter or Kotlin and getting started with Node js.",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              // textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: StaggeredGrid.count(
              crossAxisCount: ((size.width) / 700).round() <= 0
                  ? 1
                  : ((size.width) / 700).round(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  padding: const EdgeInsets.all(10),
                  width: size.width > 1000 ? (size.width / 2) - 40 : size.width,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Flexible(
                            child: CrazySeoText(
                              text: "Languages",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                      const KnowledgeCard(
                        skillValue: 0.9,
                        skillName: 'Java',
                      ),
                      const KnowledgeCard(
                        skillValue: 0.7,
                        skillName: 'Kotlin',
                      ),
                      const KnowledgeCard(
                        skillValue: 0.8,
                        skillName: 'Dart',
                      ),
                      const KnowledgeCard(
                        skillValue: 0.8,
                        skillName: 'SQL',
                      ),
                      const KnowledgeCard(
                        skillValue: 0.6,
                        skillName: 'Python',
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  padding: const EdgeInsets.all(10),
                  width: size.width > 800 ? size.width * 0.47 : size.width,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Flexible(
                            child: CrazySeoText(
                              text: "Skills",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Wrap(
                          runSpacing: 12,
                          spacing: 12,
                          children: const [
                            CircularProgress(
                              value: 0.9,
                              skill: "Flutter",
                            ),
                            CircularProgress(
                              value: 0.7,
                              skill: "Android App",
                            ),
                            CircularProgress(
                              value: 0.8,
                              skill: "Firebase",
                            ),
                            CircularProgress(
                              value: 0.4,
                              skill: "Node js",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Flexible(
                            child: CrazySeoText(
                              text: "Knowledge",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconAndroid,
                                  child: Image.asset(AssetAssets.iconAndroid))),
                          const FlutterLogo(size: 50),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconJava,
                                  child: Image.asset(AssetAssets.iconJava))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconPostman,
                                  child: Image.asset(AssetAssets.iconPostman))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconGIT,
                                  child: Image.asset(AssetAssets.iconGIT))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconFirebase,
                                  child:
                                      Image.asset(AssetAssets.iconFirebase))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconArduino,
                                  child: Image.asset(AssetAssets.iconArduino))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconMySQL,
                                  child: Image.asset(AssetAssets.iconMySQL))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconLinux,
                                  child: Image.asset(AssetAssets.iconLinux))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconPython,
                                  child: Image.asset(AssetAssets.iconPython))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconKotlin,
                                  child: Image.asset(AssetAssets.iconKotlin))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              // color: Colors.white,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconUnity,
                                  child: Image.asset(AssetAssets.iconUnity))),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconDart,
                                  child: Image.asset(AssetAssets.iconDart))),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  padding: const EdgeInsets.all(10),
                  width: size.width > 800 ? size.width * 0.47 : size.width,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Flexible(
                            child: CrazySeoText(
                              text: "Education & Qualifications",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                      const KnowledgeCard(
                        showPercentage: true,
                        skillValue: 0.85,
                        skillName:
                            'GIET University, Gunupur odisha 2023 (B.tech CSE with cyber security specialization)',
                      ),
                      const KnowledgeCard(
                        showPercentage: true,
                        skillValue: 0.64,
                        skillName:
                            'Navajyoti Science Higher Secondary School 2017,BBSR (+2 Science)',
                      ),
                      const KnowledgeCard(
                        showPercentage: true,
                        skillValue: 0.74,
                        skillName:
                            'Saraswati Vidya Mandir Kesinga , Kalahandi 2015 (10th )',
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  padding: const EdgeInsets.all(10),
                  width: size.width > 800 ? size.width * 0.47 : size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Flexible(
                            child: CrazySeoText(
                              text: "Internships & Certifications",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CrazySeoText(
                        text: " → HighRadius Technology (ARPA Intern) ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      const CrazySeoText(
                        text:
                            "Worked on java and internal framework to automate other business processes like invoice,claim and deduction over email or through web portal. "
                            "\n Dated : 06/2022 to present",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CrazySeoText(
                        text: " → FedSea inc. (Flutter Developer Lead) ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      const CrazySeoText(
                        text:
                            "Lead a team of around 4 people where I used to guide"
                            " on feature deliverables,code refactoring and "
                            "review and api structuring with backend team "
                            "along with"
                            " user research. "
                            "\n Dated : 05/2022 to 06/2022",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CrazySeoText(
                              text: " → FedSea inc. (Flutter Developer) ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            CrazySeoText(
                              text:
                                  "Delivered features like chat with socket,file "
                                  "uploading,rest api calls for other "
                                  "features and ui animations. "
                                  "\n Dated : 03/2022 to 05/2022",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CrazySeoText(
                        text: " → Liveasy (Flutter Developer) ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      const CrazySeoText(
                        text:
                            "Worked on their main app based on logistics which is"
                            " live on play-store with features like live "
                            "trucks tracking service, managing all driver and trucks. "
                            "\n Dated : 09/2022 to 11/2022",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const CrazySeoText(
                        text:
                            " → Era Interface (Software Development Apprenticeship) ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      const CrazySeoText(
                        text: "Created a instagram clone with flutter and dart "
                            "consuming api from rapid api and reimagined ui "
                            "with animation and basic operations like camera,"
                            "story,feed,account etc. "
                            "\n Dated : 05/2021 to 09/2021",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2)),
              padding: const EdgeInsets.all(10),
              child: const ExpansionTile(
                title: CrazySeoText(
                  text: "Personal details",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900),
                ),
                iconColor: Colors.white,
                textColor: Colors.white,
                collapsedIconColor: Colors.white,
                children: [
                  ListTile(
                    title: CrazySeoText(
                      text: " ▪ Address ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    subtitle: CrazySeoText(
                      text: "Subash marg, BoringPadar Kesinga Kalahandi Odisha "
                          "India pin -766012",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  ListTile(
                    title: CrazySeoText(
                      text: " ▪ Date Of Birth ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    subtitle: CrazySeoText(
                      text: "13/06/2002",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  ListTile(
                    title: CrazySeoText(
                      text: " ▪ Father's name ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    subtitle: CrazySeoText(
                      text: "Kishore Chandra Saha",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  ListTile(
                    title: CrazySeoText(
                      text: " ▪ Language Known ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    subtitle: CrazySeoText(
                      text: "Hindi, English, Odia",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
