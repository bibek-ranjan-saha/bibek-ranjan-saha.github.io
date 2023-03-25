import 'package:Bibek/widgets/drawer.dart';
import 'package:Bibek/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'assets/images.dart';
import 'constants/values.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const CrazyDrawer(),
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
            ],
          ),
        ),
        title: isWebMobile(size)
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  HeadText(
                    title: 'Home',
                    index: 0,
                  ),
                  HeadText(
                    title: 'About',
                    index: 1,
                  ),
                  HeadText(
                    title: 'Projects',
                    index: 2,
                  ),
                  HeadText(
                    title: 'Statistics',
                    index: 3,
                  ),
                  HeadText(
                    title: 'Contacts',
                    index: 4,
                  ),
                ],
              ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetAssets.backgroundImageNew),
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(
            //     Colors.black.withOpacity(0.5), BlendMode.hue),
          ),
        ),
        child: ScrollablePositionedList.builder(
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => pages[index],
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ),
      ),
    );
  }
}
