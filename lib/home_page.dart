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
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  // Size size = const Size(0, 0);

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
  }

  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void didChangeDependencies() {
    var newSize = MediaQuery.of(context).size;
    pages = [
      HomePage(size: newSize),
      AboutPage(size: newSize),
      ProjectPage(size: newSize),
      ContactPage(size: newSize)
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: Drawer(
        child: Column(
          children: [
            CrazySeoImage(
                src: AssetAssets.bibek, child: Image.asset(AssetAssets.bibek)),
            ListTile(
              onTap: () {
                itemScrollController.scrollTo(
                    index: 0,
                    duration: const Duration(milliseconds: 365),
                    curve: Curves.fastOutSlowIn);
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
                itemScrollController.scrollTo(
                    index: 1,
                    duration: const Duration(milliseconds: 365),
                    curve: Curves.fastOutSlowIn);
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
                itemScrollController.scrollTo(
                    index: 2,
                    duration: const Duration(milliseconds: 365),
                    curve: Curves.fastOutSlowIn);
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
                itemScrollController.scrollTo(
                    index: 3,
                    duration: const Duration(milliseconds: 365),
                    curve: Curves.fastOutSlowIn);
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
                  String url = await ApiRepo().getResume();
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
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/b.png",
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
                Container(
                  color: Colors.lightGreenAccent,
                  height: 10,
                  width: 10,
                )
              ]),
        ),
        title: isWebMobile
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      itemScrollController.scrollTo(
                          index: 0,
                          duration: const Duration(milliseconds: 365),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: const HeadText(
                      title: 'Home',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      itemScrollController.scrollTo(
                          index: 1,
                          duration: const Duration(milliseconds: 365),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: const HeadText(
                      title: 'About',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      itemScrollController.scrollTo(
                          index: 2,
                          duration: const Duration(milliseconds: 365),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: const HeadText(
                      title: 'Projects',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      itemScrollController.scrollTo(
                          index: 3,
                          duration: const Duration(milliseconds: 365),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: const HeadText(
                      title: 'Contacts',
                    ),
                  ),
                ],
              ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: CrazySeoImage(
                  src: AssetAssets.backgroundImageNew,
                  child: Image.asset(AssetAssets.backgroundImageNew),
                ),
              ),
            ),
          ),
          ScrollablePositionedList.builder(
            itemCount: 4,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => pages[index],
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
          ),
        ],
      ),
    );
  }
}
