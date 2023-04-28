import 'dart:js' as js;

import 'package:Bibek/services/app_service.dart';
import 'package:Bibek/widgets/seo_image.dart';
import 'package:Bibek/widgets/seo_text.dart';
import 'package:flutter/material.dart';

import '../assets/images.dart';
import 'list_tile.dart';

class CrazyDrawer extends StatelessWidget {
  const CrazyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CrazySeoImage(
            src: AssetAssets.bibek,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(AssetAssets.bibek)),
            ),
          ),
          const CrazyListTile(index: 0, title: "Home"),
          const CrazyListTile(index: 1, title: "About"),
          const CrazyListTile(index: 2, title: "Project"),
          const CrazyListTile(index: 3, title: "Statistics"),
          const CrazyListTile(index: 4, title: "Experiments"),
          const CrazyListTile(index: 5, title: "Contact"),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  js.context.callMethod("showAlert", [
                    "This site uses userAgent & Ip address to find approximate "
                        "location inorder to serve weather and other policy "
                        "note: I save basic data without any of your personal "
                        "info linked with you we collect as a group"
                  ]);
                },
                child: Text(
                  "Terms & Condition",
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      decoration: TextDecoration.underline,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: AppService.loadMyResume,
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  minimumSize: const Size(100, 45)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CrazySeoText(text: "Download resume"),
                  SizedBox(width: 6),
                  Icon(Icons.download_outlined)
                ],
              ),
            ),
          ),
          Center(
            child: Card(
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
                        onTap: () {
                          AppService.launchAppUrl(
                              "https://www.hackerrank.com/bibeksahabiki");
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
                        onTap: () {
                          AppService.launchAppUrl(
                              "https://auth.geeksforgeeks.org/user/bibeksahabiki/");
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
                        onTap: () {
                          AppService.launchAppUrl(
                              "https://leetcode.com/bibek_ranjan_saha/");
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
                        onTap: () {
                          AppService.launchAppUrl(
                              "https://www.codechef.com/users/bibek_saha");
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
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
