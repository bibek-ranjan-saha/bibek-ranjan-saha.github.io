import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:bibek_ranjan_saha/assets/images.dart';
import 'package:bibek_ranjan_saha/pages/about_page.dart';
import 'package:bibek_ranjan_saha/pages/contact_page.dart';
import 'package:bibek_ranjan_saha/pages/home_page.dart';
import 'package:bibek_ranjan_saha/pages/project_page.dart';
import 'package:bibek_ranjan_saha/services/apis.dart';
import 'package:bibek_ranjan_saha/widgets/headers.dart';
import 'package:bibek_ranjan_saha/widgets/seo_image.dart';
import 'package:bibek_ranjan_saha/widgets/seo_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'models/ip_data.dart';
import 'models/repo_data.dart';

// int currentIndex = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // VideoPlayerController _controller = VideoPlayerController.asset(
  //     "assets/video/HarmoniousUnknownAfghanhound.mp4");
  late ScrollController _scrollController;
  double scrolledValue = 0;
  double maxValue = 1;

  double dx = 0.0;
  double dy = 0.0;
  bool isActive = false;

  bool isAtTop = true;
  ApiRepo api = ApiRepo();

  bool mouseOverTime = false;

  List<GlobalKey> keys = List.generate(4, (index) => GlobalKey());

  void goToSegment(int newIndex) {
    // bool isBig = true;
    // if (currentIndex != newIndex) {
    //   if (currentIndex > newIndex) {
    //     isBig = false;
    //   }
    //   for (int i = currentIndex;
    //       isBig ? i < newIndex : i > newIndex;
    //       isBig ? i++ : i--) {
    //     Future.delayed(
    //       const Duration(milliseconds: 10),
    //       () {
    Scrollable.ensureVisible(keys[newIndex].currentContext!,
        curve: Curves.fastLinearToSlowEaseIn);
    //       },
    //     );
    //   }
    // }
  }

  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  // void startVideoBackground() {
  //   if (!_controller.value.isInitialized) {
  //     _controller.initialize().then((_) {
  //       _controller.setLooping(true);
  //       Timer(const Duration(milliseconds: 100), () {
  //         setState(() {
  //           _controller.play();
  //         });
  //       });
  //       // Ensure the first frame is shown after the video is initialized
  //       setState(() {});
  //     });
  //     _controller.addListener(() {
  //       setState(() {});
  //     });
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    _scrollController = ScrollController();
    // startVideoBackground();
    // getData();
    getProjects();
    if (!isWebMobile) {
      resetPointerStatus();
    }
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        isAtTop = _scrollController.position.pixels == 0;
      }
      setState(() {
        maxValue = _scrollController.position.maxScrollExtent;
        scrolledValue = _scrollController.offset;
      });
    });
    super.initState();
  }

  IpData? ipData;

  void resetPointerStatus() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        isActive = false;
      });
    });
  }

  // WeatherData? weatherData;

  // void getData() async {
  //   ipData = await api.getIpData();
  //   setState(() {});
  //   if (ipData != null) {
  //     api.getStats(ipData!, dataProvider!);
  //     setState(() {});
  //   }
  // }

  List<RepoData> projects = [];

  void getProjects() async {
    projects = await api.getProjects();
    setState(() {});
  }

  Size size = const Size(0, 0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: Drawer(
        child: Column(
          children: [
            CrazySeoImage(
                src: AssetAssets.bibek, child: Image.asset(AssetAssets.bibek)),
            ListTile(
              onTap: () {
                goToSegment(0);
                Navigator.pop(context);
              },
              minLeadingWidth: 6,
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(25)),
                height: 30,
                width: 6,
              ),
              title: const CrazySeoText(text: "Home"),
            ),
            ListTile(
              onTap: () {
                goToSegment(1);
                Navigator.pop(context);
              },
              minLeadingWidth: 6,
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(25)),
                height: 30,
                width: 6,
              ),
              title: const CrazySeoText(text: "About"),
            ),
            ListTile(
              onTap: () {
                goToSegment(2);
                Navigator.pop(context);
              },
              minLeadingWidth: 6,
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(25)),
                height: 30,
                width: 6,
              ),
              title: const CrazySeoText(text: "Projects"),
            ),
            ListTile(
              onTap: () {
                goToSegment(3);
                Navigator.pop(context);
              },
              minLeadingWidth: 6,
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(25)),
                height: 30,
                width: 6,
              ),
              title: const CrazySeoText(text: "Contact"),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () async {
                  String url = await api.getResume();
                  await launchUrl(Uri.parse(url));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CrazySeoText(text: "Download resume"),
                    Icon(Icons.download_outlined)
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade500,
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://www.hackerrank.com/bibeksahabiki"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: CrazySeoImage(
                              src: AssetAssets.iconHackerRank,
                              child: Image.asset(AssetAssets.iconHackerRank),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://auth.geeksforgeeks.org/user/bibeksahabiki/"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                              height: 46,
                              width: 46,
                              child: CrazySeoImage(
                                  src: AssetAssets.iconGFG,
                                  child: Image.asset(AssetAssets.iconGFG))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://leetcode.com/bibek_ranjan_saha/"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: CrazySeoImage(
                              src: AssetAssets.iconLeetCode,
                              child: Image.asset(AssetAssets.iconLeetCode),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://www.codechef.com/users/bibek_saha"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: CrazySeoImage(
                              src: AssetAssets.iconCodeChef,
                              child: Image.asset(AssetAssets.iconCodeChef),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                  minHeight: 4,
                  value: scrolledValue / maxValue,
                  backgroundColor: Colors.white,
                  color: Colors.lightGreenAccent),
            ),
            SizedBox(
              height: kToolbarHeight - 4,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CrazySeoText(
                          text: 'B',
                          style: GoogleFonts.bungeeShade(
                            fontSize: 34,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Column(
                          children: [
                            const Spacer(),
                            Container(
                              height: 10,
                              width: 8,
                              color: Colors.lightGreenAccent,
                            ),
                            const SizedBox(
                              height: 2,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  if (size.width > 900)
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HeadText(
                              childPointer: keys[0],
                              title: 'Home',
                            ),
                            HeadText(
                              childPointer: keys[1],
                              title: 'About',
                            ),
                            HeadText(
                              childPointer: keys[2],
                              title: 'Projects',
                            ),
                            HeadText(
                              childPointer: keys[3],
                              title: 'Contacts',
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
      ),
      body: isWebMobile
          ? SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HomePage(key: keys[0], size: size),
                  AboutPage(
                    key: keys[1],
                    size: size,
                    // startAnimation: !(scrolledValue >= size.height),
                  ),
                  ProjectPage(
                    key: keys[2],
                    size: size,
                    projects: projects,
                  ),
                  // StatisticsPage(
                  //   key: keys[3],
                  //   ipData: ipData,
                  //   size: size,
                  // ),
                  ContactPage(key: keys[3], size: size)
                ],
              ),
            )
          : Listener(
              onPointerHover: (event) {
                setState(() {
                  dx = event.position.dx;
                  dy = event.position.dy;
                  isActive = true;
                });
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Seo.image(
                          alt: AssetAssets.bibek,
                          src: AssetAssets.bibek,
                          child: Image.asset(AssetAssets.backgroundImageNew),
                        ),
                      ),
                    ),
                  ),
                  RawScrollbar(
                    thumbColor: Colors.white,
                    trackColor: Colors.grey,
                    controller: _scrollController,
                    radius: const Radius.circular(12),
                    trackVisibility: true,
                    child: WebSmoothScroll(
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            HomePage(key: keys[0], size: size),
                            AboutPage(
                              key: keys[1],
                              size: size,
                              // startAnimation: !(scrolledValue >= size.height),
                            ),
                            ProjectPage(
                              key: keys[2],
                              size: size,
                              projects: projects,
                            ),
                            // StatisticsPage(
                            //   key: keys[3],
                            //   ipData: ipData,
                            //   size: size,
                            // ),
                            ContactPage(key: keys[3], size: size)
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 265),
                    height: isActive ? 30 : 3,
                    width: isActive ? 30 : 3,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    transform: Transform.translate(
                            offset: Offset(dx + 12, dy - kToolbarHeight + 12))
                        .transform,
                  ),
                  AnimatedPositioned(
                    bottom: mouseOverTime ? 100 : 10,
                    left: 10,
                    duration: const Duration(milliseconds: 250),
                    child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          mouseOverTime = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          mouseOverTime = false;
                        });
                      },
                      onHover: (event) {
                        setState(() {
                          mouseOverTime = true;
                        });
                      },
                      child: Card(
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                "current time is",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  AnimatedFlipCounter(
                                    value: DateTime.now().hour % 12,
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  AnimatedFlipCounter(
                                    value: DateTime.now().minute,
                                    prefix: "h :",
                                    suffix: "m :",
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  AnimatedFlipCounter(
                                    value: DateTime.now().second,
                                    suffix: "s",
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        onPressed: () {
          if (isAtTop) {
            _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutSine);
          } else {
            _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutSine);
          }
        },
        child: Icon(isAtTop
            ? Icons.arrow_circle_down_rounded
            : Icons.arrow_circle_up_rounded),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller?.dispose();
  // }
}
