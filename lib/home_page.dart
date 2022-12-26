import 'package:animated_background/animated_background.dart';
import 'package:bibek_ranjan_saha/pages/contact_page.dart';
import 'package:bibek_ranjan_saha/pages/home_page.dart';
import 'package:bibek_ranjan_saha/pages/project_page.dart';
import 'package:bibek_ranjan_saha/services/apis.dart';
import 'package:bibek_ranjan_saha/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'models/ip_data.dart';
import 'models/repo_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  GlobalKey homeKey = GlobalKey();
  GlobalKey aboutKey = GlobalKey();
  GlobalKey projectKey = GlobalKey();
  GlobalKey statsKey = GlobalKey();
  GlobalKey contactKey = GlobalKey();

  late ScrollController _scrollController;
  double scrolledValue = 0;
  double maxValue = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
    getProjects();
    _scrollController.addListener(() {
      setState(() {
        maxValue = _scrollController.position.maxScrollExtent;
        scrolledValue = _scrollController.offset;
      });
    });
  }

  IpData? ipData;

  void getData() async {
    ipData = await ApiRepo().getIpData();
    setState(() {});
  }

  List<RepoData> projects = [];

  void getProjects() async {
    projects = await ApiRepo().getProjects();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.black,
      endDrawer: size.width < 900
          ? Drawer(
              child: Column(
                children: [
                  Image.asset("assets/images/bibek.jpg"),
                  ListTile(
                    onTap: () {
                      Scrollable.ensureVisible(homeKey.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
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
                    title: const Text("Home"),
                  ),
                  ListTile(
                    onTap: () {
                      Scrollable.ensureVisible(aboutKey.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
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
                    title: const Text("About"),
                  ),
                  ListTile(
                    onTap: () {
                      Scrollable.ensureVisible(projectKey.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
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
                    title: const Text("Projects"),
                  ),
                  ListTile(
                    onTap: () {
                      Scrollable.ensureVisible(statsKey.currentContext!,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
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
                    title: const Text("Statistics"),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text("Download resume"),
                          Icon(Icons.download_outlined)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.grey.withAlpha(10),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Image.network("src"))
                      ],
                    ),
                  )
                ],
              ),
            )
          : null,
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
                        Seo.text(
                          text: 'Bibek Ranjan Saha portfolio',
                          child: Text(
                            "B",
                            style: GoogleFonts.bungeeShade(
                              fontSize: 34,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        // Seo.text(
                        //   text: 'Bibek Ranjan Saha portfolio',
                        //   child: const Text(
                        //     "ibek",
                        //     style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w900,
                        //         color: Colors.black),
                        //   ),
                        // ),
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
                              childPointer: homeKey,
                              title: 'Home',
                            ),
                            HeadText(
                              childPointer: aboutKey,
                              title: 'About',
                            ),
                            HeadText(
                              childPointer: projectKey,
                              title: 'Projects',
                            ),
                            HeadText(
                              childPointer: statsKey,
                              title: 'Stats',
                            ),
                            HeadText(
                              childPointer: contactKey,
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
      body: AnimatedBackground(
        vsync: this,
        behaviour: SpaceBehaviour(),
        child: WebSmoothScroll(
          controller: _scrollController,
          child: RawScrollbar(
            thumbColor: Colors.white,
            trackColor: Colors.grey,
            controller: _scrollController,
            radius: const Radius.circular(12),
            trackVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  HomePage(key: homeKey, size: size,ipData: ipData),
                  Container(
                    key: aboutKey,
                    height: size.height,
                    color: Colors.transparent,
                  ),
                  ProjectPage(
                    key: projectKey,
                    size: size,
                    projects: projects,
                  ),
                  Container(
                    key: statsKey,
                    height: size.height,
                    color: Colors.yellowAccent,
                  ),
                  ContactPage(key: contactKey, size: size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
